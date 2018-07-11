#line 1 "/Users/Zheng/Desktop/CydiaX/CydiaX/CydiaX.xm"
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


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class CydiaTabBarController; @class SBApplication; 
static void (*_logos_orig$_ungrouped$CydiaTabBarController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL CydiaTabBarController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$CydiaTabBarController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL CydiaTabBarController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$CydiaTabBarController$viewWillLayoutSubviews)(_LOGOS_SELF_TYPE_NORMAL CydiaTabBarController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$CydiaTabBarController$viewWillLayoutSubviews(_LOGOS_SELF_TYPE_NORMAL CydiaTabBarController* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$SBApplication$supportsApplicationType$)(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST, SEL, int); static BOOL _logos_method$_ungrouped$SBApplication$supportsApplicationType$(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST, SEL, int); static NSInteger (*_logos_orig$_ungrouped$SBApplication$_classicModeFromSplashBoard)(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST, SEL); static NSInteger _logos_method$_ungrouped$SBApplication$_classicModeFromSplashBoard(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$SBApplication$_supportsApplicationType$)(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST, SEL, int); static BOOL _logos_method$_ungrouped$SBApplication$_supportsApplicationType$(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST, SEL, int); static BOOL (*_logos_orig$_ungrouped$SBApplication$classicAppScaled)(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$SBApplication$classicAppScaled(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST, SEL); static bool (*_logos_orig$_ungrouped$SBApplication$isClassic)(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST, SEL); static bool _logos_method$_ungrouped$SBApplication$isClassic(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST, SEL); 

#line 36 "/Users/Zheng/Desktop/CydiaX/CydiaX/CydiaX.xm"


static void _logos_method$_ungrouped$CydiaTabBarController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL CydiaTabBarController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$CydiaTabBarController$viewDidLoad(self, _cmd);
    cyx_fixTabBarPosition((UITabBarController *)self);
}

static void _logos_method$_ungrouped$CydiaTabBarController$viewWillLayoutSubviews(_LOGOS_SELF_TYPE_NORMAL CydiaTabBarController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$CydiaTabBarController$viewWillLayoutSubviews(self, _cmd);
    cyx_fixTabBarPosition((UITabBarController *)self);
}



@interface SBApplication : NSObject

- (NSString *)bundleIdentifier;
- (bool)_supportsApplicationType:(int)type;
- (bool)classicAppScaled;

@end

static NSString * const kCydiaBundleIdentifier = @"com.saurik.Cydia";



static BOOL _logos_method$_ungrouped$SBApplication$supportsApplicationType$(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, int type) {
    if ([self.bundleIdentifier isEqualToString:kCydiaBundleIdentifier]) {
        return YES;
    }
    return _logos_orig$_ungrouped$SBApplication$supportsApplicationType$(self, _cmd, type);
}

static NSInteger _logos_method$_ungrouped$SBApplication$_classicModeFromSplashBoard(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if ([self.bundleIdentifier isEqualToString:kCydiaBundleIdentifier]) {
        return 2;
    }
    return _logos_orig$_ungrouped$SBApplication$_classicModeFromSplashBoard(self, _cmd);
}

static BOOL _logos_method$_ungrouped$SBApplication$_supportsApplicationType$(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, int type) {
    if ([self.bundleIdentifier isEqualToString:kCydiaBundleIdentifier]) {
        return YES;
    }
    return _logos_orig$_ungrouped$SBApplication$_supportsApplicationType$(self, _cmd, type);
}

static BOOL _logos_method$_ungrouped$SBApplication$classicAppScaled(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return _logos_orig$_ungrouped$SBApplication$classicAppScaled(self, _cmd);
}

static bool _logos_method$_ungrouped$SBApplication$isClassic(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if ([self.bundleIdentifier isEqualToString:kCydiaBundleIdentifier]) {
        return NO;
    }
    return _logos_orig$_ungrouped$SBApplication$isClassic(self, _cmd);
}



static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CydiaTabBarController = objc_getClass("CydiaTabBarController"); MSHookMessageEx(_logos_class$_ungrouped$CydiaTabBarController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$CydiaTabBarController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$CydiaTabBarController$viewDidLoad);MSHookMessageEx(_logos_class$_ungrouped$CydiaTabBarController, @selector(viewWillLayoutSubviews), (IMP)&_logos_method$_ungrouped$CydiaTabBarController$viewWillLayoutSubviews, (IMP*)&_logos_orig$_ungrouped$CydiaTabBarController$viewWillLayoutSubviews);Class _logos_class$_ungrouped$SBApplication = objc_getClass("SBApplication"); MSHookMessageEx(_logos_class$_ungrouped$SBApplication, @selector(supportsApplicationType:), (IMP)&_logos_method$_ungrouped$SBApplication$supportsApplicationType$, (IMP*)&_logos_orig$_ungrouped$SBApplication$supportsApplicationType$);MSHookMessageEx(_logos_class$_ungrouped$SBApplication, @selector(_classicModeFromSplashBoard), (IMP)&_logos_method$_ungrouped$SBApplication$_classicModeFromSplashBoard, (IMP*)&_logos_orig$_ungrouped$SBApplication$_classicModeFromSplashBoard);MSHookMessageEx(_logos_class$_ungrouped$SBApplication, @selector(_supportsApplicationType:), (IMP)&_logos_method$_ungrouped$SBApplication$_supportsApplicationType$, (IMP*)&_logos_orig$_ungrouped$SBApplication$_supportsApplicationType$);MSHookMessageEx(_logos_class$_ungrouped$SBApplication, @selector(classicAppScaled), (IMP)&_logos_method$_ungrouped$SBApplication$classicAppScaled, (IMP*)&_logos_orig$_ungrouped$SBApplication$classicAppScaled);MSHookMessageEx(_logos_class$_ungrouped$SBApplication, @selector(isClassic), (IMP)&_logos_method$_ungrouped$SBApplication$isClassic, (IMP*)&_logos_orig$_ungrouped$SBApplication$isClassic);} }
#line 96 "/Users/Zheng/Desktop/CydiaX/CydiaX/CydiaX.xm"
