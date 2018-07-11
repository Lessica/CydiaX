#import <UIKit/UIKit.h>

#define kCydiaTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height > 20.0 ? 83.0 : 49.0)
#define kCydiaIndicatorHeight (34.0)

static BOOL cyx_isiPhoneX() {
    static BOOL checkiPhoneX = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 8.0, *)) {
            if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone && UIScreen.mainScreen.nativeBounds.size.height == 2436)  {
                checkiPhoneX = YES;
            }
        } else {
            // Fallback on earlier versions
        }
    });
    return checkiPhoneX;
}

static void cyx_fixTabBarPosition(UITabBarController *tab) {
    if (@available(iOS 11.0, *)) {
        if (cyx_isiPhoneX()) {
            CGRect tabFrame = tab.tabBar.frame;
            tabFrame.size.height = kCydiaTabBarHeight;
            tabFrame.origin.y = tab.view.frame.size.height - kCydiaTabBarHeight;
            tab.tabBar.frame = tabFrame;
            for (UITabBarItem* item in tab.tabBar.items) {
                [item setImageInsets:UIEdgeInsetsMake(-kCydiaIndicatorHeight, 0, 0, 0)];
                [item setTitlePositionAdjustment:UIOffsetMake(0, -kCydiaIndicatorHeight)];
            }
        }
    }
}

%hook CydiaTabBarController

- (void)viewDidLoad {
    %orig;
    cyx_fixTabBarPosition((UITabBarController *)self);
}

- (void)viewWillLayoutSubviews {
    %orig;
    cyx_fixTabBarPosition((UITabBarController *)self);
}

%end

@interface SBApplication : NSObject

- (NSString *)bundleIdentifier;
- (bool)_supportsApplicationType:(int)type;
- (bool)classicAppScaled;

@end

static NSString * const kCydiaBundleIdentifier = @"com.saurik.Cydia";

%hook SBApplication

- (BOOL)supportsApplicationType:(int)type {
    if ([self.bundleIdentifier isEqualToString:kCydiaBundleIdentifier]) {
        return YES;
    }
    return %orig;
}

- (NSInteger)_classicModeFromSplashBoard {
    if ([self.bundleIdentifier isEqualToString:kCydiaBundleIdentifier]) {
        return 2;
    }
    return %orig;
}

- (BOOL)_supportsApplicationType:(int)type {
    if ([self.bundleIdentifier isEqualToString:kCydiaBundleIdentifier]) {
        return YES;
    }
    return %orig;
}

- (BOOL)classicAppScaled {
    return %orig;
}

- (bool)isClassic {
    if ([self.bundleIdentifier isEqualToString:kCydiaBundleIdentifier]) {
        return NO;
    }
    return %orig;
}

%end

