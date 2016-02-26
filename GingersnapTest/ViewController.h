//
//  ViewController.h
//  GingersnapTest
//
//  Created by Karim Koriche on 31/01/2016.
//  Copyright © 2016 Karim Koriche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "ViewModel.h"
#import "iCarousel.h"


@interface ViewController : UIViewController <iCarouselDataSource, iCarouselDelegate>
{
    BOOL isShowStatus; // bool for hide status bar methods
}

// Static objects
@property (nonatomic, strong) UIImageView * topHeading;
@property (nonatomic, strong) UIButton * terms;
@property (nonatomic, strong) iCarousel * carouselControl;
@property (nonatomic, strong) DataModel * dataFeed;


-(void)initCarousel;

-(void)showBar;
-(void)hideBar;

-(void)sendMsg;
-(void)playStory;
-(void)trackDelivery:(NSString*)redeemStatus redeemDate:(NSString*)redeemDate  share_status:(NSString*)shareStatus;

@end

