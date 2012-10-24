// light@huohua.tv
#import "UINavigationController+HHKit.h"

@implementation UINavigationController (HHKit)

- (void)pushViewControllerWithBlock:(HHViewControllerBlock)viewController animated:(BOOL)animated {
    [self pushViewController:viewController() animated:animated];
}

- (void)popWithAnimated
{
    if (![self popViewControllerAnimated:YES]) {
        [self.visibleViewController dismissModalViewControllerAnimated:YES];
    }
}

- (void)replaceVisibleViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSMutableArray *VCs = [self.viewControllers mutableCopy];
    [VCs replaceObjectAtIndex:[VCs count]-1 withObject:viewController];
    [self setViewControllers:VCs animated:animated];
}

- (BOOL)isRootViewController:(UIViewController *)viewController
{
    UIViewController *rootViewController = [self.viewControllers objectAtIndex:0];
    return [rootViewController isEqual:viewController];
}

@end