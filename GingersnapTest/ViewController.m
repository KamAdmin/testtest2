//
//  ViewController.m
//  GingersnapTest
//
//  Created by Karim Koriche on 31/01/2016.
//  Copyright © 2016 Karim Koriche. All rights reserved.
//

#import "ViewController.h"
#import "DataModel.h"
#import "ViewModel.h"
#import "UIViewController+MJPopupViewController.h"

@interface ViewController () <UIActionSheetDelegate>
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // Static graphic elements
    
    [self.view setBackgroundColor:[UIColor colorWithRed:30/255.0f green:69/255.0f blue:89/255.0f alpha:1.0f]];

    self.topHeading = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 470, 90)];
    [self.topHeading setImage:[UIImage imageNamed:@"Top Heading"]];
    [self.topHeading setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:self.topHeading];
    
    self.terms = [[UIButton alloc] initWithFrame:CGRectMake(30, self.view.frame.size.height - 60, 170, 50)];
    [self.terms setImage:[UIImage imageNamed:@"Terms & Conditions"] forState:UIControlStateNormal];
    [self.terms setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:self.terms];
    
    
    
    
    // Data loading in DataModel
    
    self.dataFeed = [DataModel new];
    self.dataFeed.mainVC = self;
    [self.dataFeed LoadFeed:@"https://gingersnap-print.s3.amazonaws.com/dashboard/dashboard.json"];

}





// Carousel initialisation from DataModel class, after data feed loading succeeded

-(void)initCarousel
{
    self.carouselControl = [[iCarousel alloc] initWithFrame:self.view.bounds];
    self.carouselControl.type = iCarouselTypeLinear;
    self.carouselControl.dataSource = self;
    self.carouselControl.delegate = self;
    [self.view addSubview:self.carouselControl];
    [self.view bringSubviewToFront:self.terms];
}





// Show and Hide statusBar methods. Used when the user zoom the central image.

- (void)showBar
{
    isShowStatus = NO;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)hideBar
{
    isShowStatus = YES;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (BOOL)prefersStatusBarHidden {
    return isShowStatus;
}






// Send, play and track button's method, called from corresponding buttons in ViewModel.
// Display a simple ViewController with a message

-(void)sendMsg
{
    
    UIViewController * messageController = [[UIViewController alloc] init];
    messageController.view.frame = CGRectMake(0, 0, 400, 150);
    messageController.view.backgroundColor = [UIColor colorWithRed:10/255.0f green:49/255.0f blue:69/255.0f alpha:1.0f];
    messageController.view.layer.cornerRadius = 20;
    
    UILabel * message = [[UILabel alloc] initWithFrame:CGRectMake(50, 25, 300, 100)];
    message.textAlignment = NSTextAlignmentCenter;
    message.numberOfLines = 0;
    [message setText:@"You are not allowed to send a message"];
    [message setTextColor:[UIColor whiteColor]];
    message.font = [UIFont fontWithName:@"BureauGrotesque" size:30];
    [messageController.view addSubview:message];
    
    [self presentPopupViewController:messageController animationType:MJPopupViewAnimationSlideTopBottom];
    
}


-(void)playStory
{
    UIViewController * messageController = [[UIViewController alloc] init];
    messageController.view.frame = CGRectMake(0, 0, 400, 400);
    messageController.view.backgroundColor = [UIColor colorWithRed:144/255.0f green:179/255.0f blue:11/255.0f alpha:1.0f];
    messageController.view.layer.cornerRadius = 20;
    
    UILabel * message = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 300, 300)];
    message.textAlignment = NSTextAlignmentCenter;
    message.numberOfLines = 0;
    [message setText:@"Let's go !"];
    [message setTextColor:[UIColor whiteColor]];
    message.font = [UIFont fontWithName:@"BureauGrotesque" size:70];
    [messageController.view addSubview:message];
    
    [self presentPopupViewController:messageController animationType:MJPopupViewAnimationSlideBottomBottom];
}


// Display informations from data feed

-(void)trackDelivery:(NSString*)redeemStatus redeemDate:(NSString*)redeemDate  share_status:(NSString*)shareStatus
{
    
    UIViewController * messageController = [[UIViewController alloc] init];
    messageController.view.frame = CGRectMake(0, 0, 400, 400);
    messageController.view.backgroundColor = [UIColor colorWithRed:36/255.0f green:103/255.0f blue:8/255.0f alpha:1.0f];
    messageController.view.layer.cornerRadius = 20;
    
    UILabel * Status = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 300, 100)];
    Status.textAlignment = NSTextAlignmentCenter;
    Status.numberOfLines = 0;
    [Status setText:[NSString stringWithFormat:@"Redeem status: %@", redeemStatus]];
    [Status setTextColor:[UIColor whiteColor]];
    Status.font = [UIFont fontWithName:@"BureauGrotesque" size:25];
    [messageController.view addSubview:Status];
    
    // Date translation to local format.
    
    NSDate * ddd = [self dateFromRFC3339String:redeemDate];
 
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"yyyy.MM.dd HH:mm"];
    df.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:[NSTimeZone localTimeZone].secondsFromGMT];
    NSString *stringFromDate = [df stringFromDate:ddd];
    
    UILabel * Date = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 300, 100)];
    Date.textAlignment = NSTextAlignmentCenter;
    Date.numberOfLines = 0;
    [Date setText:[NSString stringWithFormat:@"Date: %@", stringFromDate]];
    [Date setTextColor:[UIColor whiteColor]];
    Date.font = [UIFont fontWithName:@"BureauGrotesque" size:25];
    [messageController.view addSubview:Date];
    
    UILabel * message = [[UILabel alloc] initWithFrame:CGRectMake(50, 250, 300, 100)];
    message.textAlignment = NSTextAlignmentCenter;
    message.numberOfLines = 0;
    [message setText:[NSString stringWithFormat:@"Share status: %@", shareStatus]];
    [message setTextColor:[UIColor whiteColor]];
    message.font = [UIFont fontWithName:@"BureauGrotesque" size:25];
    [messageController.view addSubview:message];
    
    [self presentPopupViewController:messageController animationType:MJPopupViewAnimationSlideBottomBottom];
}





// Method for translate RFC333S9 date to local format

- (NSDate*)dateFromRFC3339String:(NSString*)aString
{
    static NSDateFormatter* sRFC3339DateFormatter = nil;
    static NSDateFormatter* sRFC3339DateFormatterSubSeconds = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSLocale *enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        
        sRFC3339DateFormatter = [[NSDateFormatter alloc] init];
        [sRFC3339DateFormatter setLocale:enUSPOSIXLocale];
        [sRFC3339DateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ssXXXXX"];
        [sRFC3339DateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        
        sRFC3339DateFormatterSubSeconds = [[NSDateFormatter alloc] init];
        [sRFC3339DateFormatterSubSeconds setLocale:enUSPOSIXLocale];
        [sRFC3339DateFormatterSubSeconds setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSSSSXXXXX"];
        [sRFC3339DateFormatterSubSeconds setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    });
    
    NSDate* date = [sRFC3339DateFormatter dateFromString:aString];
    if (date == nil)
        date = [sRFC3339DateFormatterSubSeconds dateFromString:aString];
    
    return date;
}






// Caroussel delegate methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [[self.dataFeed.dataArray objectForKey:@"redeemed"] count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view;
{
    ViewModel * mainView = [[ViewModel alloc]initWithFrame:CGRectMake(0, 0, 800, 600)];
    mainView.mainVC = self;
    
    // Updating all graphic elements in ViewModel after carousel created, and loading succeeded.
    
    [mainView updateView:mainView Number:index];
    
    return mainView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
