#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TurathGateView : UIView <UITextFieldDelegate>
@property (nonatomic, strong) UITextField *codeField;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *telegramButton;
@property (nonatomic, strong) UIButton *linkButton;
@end

@implementation TurathGateView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    // 1. الخلفية الزرقاء الداكنة
    self.backgroundColor = [UIColor colorWithRed:0.02 green:0.07 blue:0.20 alpha:1.00];
    
    // 2. النجمة والشعار الدائري
    UIView *avatarContainer = [[UIView alloc] initWithFrame:CGRectMake((self.bounds.size.width - 140)/2, 140, 140, 140)];
    avatarContainer.backgroundColor = [UIColor clearColor];
    avatarContainer.layer.cornerRadius = 70;
    avatarContainer.layer.borderWidth = 3;
    avatarContainer.layer.borderColor = [UIColor colorWithRed:0.18 green:0.42 blue:0.87 alpha:1.00].CGColor;
    avatarContainer.layer.shadowColor = [UIColor colorWithRed:0.18 green:0.42 blue:0.87 alpha:1.00].CGColor;
    avatarContainer.layer.shadowOffset = CGSizeZero;
    avatarContainer.layer.shadowOpacity = 0.8;
    avatarContainer.layer.shadowRadius = 15;
    [self addSubview:avatarContainer];
    
    UILabel *starLabel = [[UILabel alloc] initWithFrame:avatarContainer.bounds];
    starLabel.text = @"★";
    starLabel.font = [UIFont systemFontOfSize:65];
    starLabel.textColor = [UIColor colorWithRed:0.35 green:0.67 blue:1.00 alpha:1.00];
    starLabel.textAlignment = NSTextAlignmentCenter;
    [avatarContainer addSubview:starLabel];
    
    // عنوان التراث ستور
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, self.bounds.size.width - 40, 40)];
    titleLabel.text = @"التراث ستور\n— TURATH STORE —";
    titleLabel.numberOfLines = 2;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:22];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLabel];
    
    // 3. حقل إدخال الرمز
    self.codeField = [[UITextField alloc] initWithFrame:CGRectMake(30, 310, self.bounds.size.width - 60, 55)];
    self.codeField.backgroundColor = [UIColor clearColor];
    self.codeField.layer.cornerRadius = 12;
    self.codeField.layer.borderWidth = 1.5;
    self.codeField.layer.borderColor = [UIColor colorWithRed:0.15 green:0.27 blue:0.53 alpha:1.00].CGColor;
    self.codeField.textColor = [UIColor whiteColor];
    self.codeField.textAlignment = NSTextAlignmentRight;
    self.codeField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"الرمز " attributes:@{NSForegroundColorAttributeName: [UIColor grayColor]}];
    self.codeField.delegate = self;
    [self addSubview:self.codeField];
    
    // 4. زر تأكيد الدخول
    self.loginButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 380, self.bounds.size.width - 60, 55)];
    self.loginButton.backgroundColor = [UIColor colorWithRed:0.08 green:0.38 blue:0.92 alpha:1.00];
    self.loginButton.layer.cornerRadius = 14;
    [self.loginButton setTitle:@"✓ تأكيد الدخول" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.loginButton addTarget:self action:@selector(loginTapped) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.loginButton];
    
    // نص توضيحي
    UILabel *hintLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 450, self.bounds.size.width - 60, 20)];
    hintLabel.text = @"للحصول على الرمز الرجاء الذهاب الى :";
    hintLabel.textColor = [UIColor lightGrayColor];
    hintLabel.font = [UIFont systemFontOfSize:13];
    hintLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:hintLabel];
    
    // 5. أزرار قنوات الاشتراك والروابط
    self.telegramButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 485, self.bounds.size.width - 60, 50)];
    self.telegramButton.layer.cornerRadius = 12;
    self.telegramButton.layer.borderWidth = 1;
    self.telegramButton.layer.borderColor = [UIColor colorWithRed:0.15 green:0.27 blue:0.53 alpha:1.00].CGColor;
    [self.telegramButton setTitle:@"✈ اولا - الانضمام في القناة" forState:UIControlStateNormal];
    self.telegramButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.telegramButton];
    
    self.linkButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 550, self.bounds.size.width - 60, 50)];
    self.linkButton.layer.cornerRadius = 12;
    self.linkButton.layer.borderWidth = 1;
    self.linkButton.layer.borderColor = [UIColor colorWithRed:0.15 green:0.27 blue:0.53 alpha:1.00].CGColor;
    [self.linkButton setTitle:@"🔗 ثانيا - ادخل هنا للحصول على رمز الدخول" forState:UIControlStateNormal];
    self.linkButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.linkButton];
}

- (void)loginTapped {
    // التحقق من الرمز المدخل
    if ([self.codeField.text isEqualToString:@"1234"]) { 
        [UIView animateWithDuration:0.5 animations:^{
            self.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
}
@end

// كود الحقن التلقائي للمكتبة داخل التطبيق المضيف
__attribute__((constructor)) static void initialize() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *keyWindow = nil;
        if (@available(iOS 13.0, *)) {
            for (UIWindowScene *scene in [UIApplication sharedApplication].connectedScenes) {
                if (scene.activationState == UISceneActivationStateForegroundActive) {
                    for (UIWindow *window in ((UIWindowScene *)scene).windows) {
                        if (window.isKeyWindow) { keyWindow = window; break; }
                    }
                }
            }
        }
        if (!keyWindow) { keyWindow = [UIApplication sharedApplication].keyWindow; }
        
        if (keyWindow) {
            TurathGateView *gateView = [[TurathGateView alloc] initWithFrame:keyWindow.bounds];
            [keyWindow addSubview:gateView];
        }
    });
}
