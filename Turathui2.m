#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// تعريف الواجهة (Interface)
@interface TurathGate : NSObject
+ (void)load;
- (void)showWelcomeMessage;
@end

@implementation TurathGate

// دالة load يتم استدعاؤها تلقائياً بمجرد تحميل الـ dylib في الذاكرة
+ (void)load {
    NSLog(@"[TurathGate] الـ dylib تم تحميله بنجاح داخل التطبيق!");
    
    // تشغيل الواجهة بعد ثوانٍ قليلة من تشغيل التطبيق لضمان جاهزية الـ UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        TurathGate *instance = [[TurathGate alloc] init];
        [instance showWelcomeMessage];
    });
}

// دالة لإظهار تنبيه (Alert) على الشاشة لإثبات عمل الواجهة
- (void)showWelcomeMessage {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    // التأكد من الوصول إلى الـ ViewController الحالي المعروض
    while (rootViewController.presentedViewController) {
        rootViewController = rootViewController.presentedViewController;
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"TurathGate"
                                                                   message:@"مرحباً بك! تم تشغيل واجهة المكتبة بنجاح."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"موافق"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    
    [alert addAction:okAction];
    
    [rootViewController presentViewController:alert animated:YES completion:nil];
}

@end
