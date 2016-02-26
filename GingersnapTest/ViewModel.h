//
//  ViewModel.h
//  GingersnapTest
//
//  Created by Karim Koriche on 01/02/2016.
//  Copyright © 2016 Karim Koriche. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface ViewModel : UIView
{
    CGRect rectZoom; // CGRect to keep origin rect for deZoom
    BOOL isShowStatus; // Bool for hide and show status bar
    
}

// Objects for all data retrieved

@property (nonatomic) NSInteger viewIndex;
@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSString * salutation;
@property (nonatomic, strong) NSString * photo;
@property (nonatomic, strong) NSString * redeem_code;
@property (nonatomic, strong) NSString * recipient_name;
@property (nonatomic, strong) NSString * disguise_type;
@property (nonatomic, strong) NSString * gender;
@property (nonatomic, strong) NSString * redeem_status;
@property (nonatomic, strong) NSString * redeem_date;
@property (nonatomic, strong) NSString * share_status;
@property (nonatomic, strong) NSString * shared_image;


// Objects for all graphics in each profile view.

@property (nonatomic, strong) UIImageView * photoView;
@property (nonatomic, strong) UIImageView * character;
@property (nonatomic, strong) UIImageView * background;
@property (nonatomic, strong) UIImageView * lockImg;
@property (nonatomic, strong) UIButton * magGlassBtn;

@property (nonatomic, strong) UIButton * playBtn;
@property (nonatomic, strong) UIButton * sendMsgBtn;
@property (nonatomic, strong) UIButton * trackBtn;

@property (nonatomic, strong) UILabel * nameLabel;
@property (nonatomic, strong) UILabel * storyIDlabel;
@property (nonatomic, strong) UILabel * statusLabel;
@property (nonatomic, strong) UIImageView * imageToLoad;

@property(nonatomic,strong) ViewController * mainVC;



// Method called from carousel to update profile views

-(void)updateView:(ViewModel*)view Number:(NSInteger)number;

@end
