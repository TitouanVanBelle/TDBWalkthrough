//
//  TDBSimpleWhite.m
//  TDBWalkthrough
//
//  Created by Titouan Van Belle on 24/04/14.
//  Copyright (c) 2014 3dB. All rights reserved.
//

#import "TDBInterface.h"

@interface TDBInterface ()

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) UIImage *image;

@property (strong, nonatomic) IBOutlet UILabel *desc;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *getStarted;
@property (strong, nonatomic) IBOutlet UIButton *signIn;
@property (strong, nonatomic) IBOutlet UIButton *signUp;
@property (strong, nonatomic) IBOutlet UIButton *signInWithFacebook;

@end

@implementation TDBInterface

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // text
    self.desc.lineBreakMode = NSLineBreakByWordWrapping;
    self.desc.numberOfLines = 0;
    self.desc.text = self.text;
    
    CGSize maximumLabelSize = CGSizeMake(296, FLT_MAX);
    
    CGSize expectedLabelSize = [self.text boundingRectWithSize:maximumLabelSize
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:@{NSFontAttributeName:self.desc.font}
                                                        context:nil].size;
    
    CGRect frame = self.desc.frame;
    frame.size.height = expectedLabelSize.height;

    dispatch_async(dispatch_get_main_queue(), ^{
        self.desc.frame = frame;
    });    
    
    
    // imageview
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.image = self.image;
    
    
    // buttons
    self.getStarted.tag = 0;
    self.signIn.tag = 1;
    self.signUp.tag = 2;
    self.signInWithFacebook.tag = 3;
    
    self.getStarted.hidden = YES;
    self.signIn.hidden = YES;
    self.signUp.hidden = YES;
    self.signInWithFacebook.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setupWithImage:(UIImage *)image andText:(NSString *)text
{
    self.text = text;
    self.image = image;
}


- (void)showButtons
{
    if (!self.getStarted.hidden) return;
    
    self.getStarted.hidden = NO;
    self.signIn.hidden = NO;
    self.signUp.hidden = NO;
    self.signInWithFacebook.hidden = NO;
    
    self.getStarted.alpha = 0;
    self.signIn.alpha = 0;
    self.signUp.alpha = 0;
    self.signInWithFacebook.alpha = 0;
    
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options: UIViewAnimationCurveEaseInOut
                     animations:^{
                         self.getStarted.alpha = 1;
                         self.signIn.alpha = 1;
                         self.signUp.alpha = 1;
                         self.signInWithFacebook.alpha = 1;
                     }
                     completion:nil];
}

@end
