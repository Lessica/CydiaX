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

@class CydiaTabBarController; 
static void (*_logos_orig$_ungrouped$CydiaTabBarController$viewWillLayoutSubviews)(_LOGOS_SELF_TYPE_NORMAL CydiaTabBarController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$CydiaTabBarController$viewWillLayoutSubviews(_LOGOS_SELF_TYPE_NORMAL CydiaTabBarController* _LOGOS_SELF_CONST, SEL); 

#line 21 "/Users/Zheng/Desktop/CydiaX/CydiaX/CydiaX.xm"


static void _logos_method$_ungrouped$CydiaTabBarController$viewWillLayoutSubviews(_LOGOS_SELF_TYPE_NORMAL CydiaTabBarController* _LOGOS_SELF_CONST self, SEL _cmd) {
    _logos_orig$_ungrouped$CydiaTabBarController$viewWillLayoutSubviews(self, _cmd);
    if (@available(iOS 11.0, *)) {
        if (cyx_isiPhoneX()) {
            UITabBarController *tab = (UITabBarController *)self;
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



static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CydiaTabBarController = objc_getClass("CydiaTabBarController"); MSHookMessageEx(_logos_class$_ungrouped$CydiaTabBarController, @selector(viewWillLayoutSubviews), (IMP)&_logos_method$_ungrouped$CydiaTabBarController$viewWillLayoutSubviews, (IMP*)&_logos_orig$_ungrouped$CydiaTabBarController$viewWillLayoutSubviews);} }
#line 42 "/Users/Zheng/Desktop/CydiaX/CydiaX/CydiaX.xm"
