//
//  ViewModel.m
//  GingersnapTest
//
//  Created by Karim Koriche on 01/02/2016.
//  Copyright © 2016 Karim Koriche. All rights reserved.
//

#import "ViewModel.h"
#import "ViewController.h"
#import "UIImageView+AFNetworking.h"
#import "WBMaskedImageView.h"

@implementation ViewModel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.background = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width - 600)/2, 50, 600, 500)];
        [self.background setImage:[UIImage imageNamed:@"Rectangle 821"]];
        [self.background setContentMode:UIViewContentModeScaleAspectFit];
        [self.background setUserInteractionEnabled:YES];
        [self addSubview:self.background];
        
        self.photoView = [[UIImageView alloc] init];
        [self.photoView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:self.photoView];
        
        self.character = [[UIImageView alloc] initWithFrame:CGRectMake(0, 30, 250, 550)];
        [self.character setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:self.character];
        
        
        self.imageToLoad = [[UIImageView alloc] initWithFrame:CGRectMake((self.background.frame.size.width - 270) /2, 10, 270, 260)];
        [self.imageToLoad setContentMode:UIViewContentModeScaleAspectFit];
        [self.imageToLoad setUserInteractionEnabled:YES];
        self.imageToLoad.tag = 1;
        [self.background addSubview:self.imageToLoad];
        
        self.magGlassBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.imageToLoad.frame.size.width - 40, 15, 50, 50)];
        [self.magGlassBtn setImage:[UIImage imageNamed:@"Mag Glass"] forState:UIControlStateNormal];
        [self.magGlassBtn setContentMode:UIViewContentModeScaleAspectFit];
        [self.magGlassBtn addTarget:self action:@selector(zoomImage) forControlEvents:UIControlEventTouchUpInside];
        [self.imageToLoad addSubview:self.magGlassBtn];
        
        
        
        self.sendMsgBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.background.frame.size.width - 260) /2, self.imageToLoad.frame.size.height, 260, 60)];
        [self.sendMsgBtn setImage:[UIImage imageNamed:@"Send Message"] forState:UIControlStateNormal];
        [self.sendMsgBtn setContentMode:UIViewContentModeScaleAspectFit];
        [self.sendMsgBtn addTarget:_mainVC action:@selector(sendMsg) forControlEvents:UIControlEventTouchUpInside];
        [self.background addSubview:self.sendMsgBtn];
        
        self.playBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.background.frame.size.width - 260) /2, self.imageToLoad.frame.size.height + 70, 260, 60)];
        [self.playBtn setImage:[UIImage imageNamed:@"Play"] forState:UIControlStateNormal];
        [self.playBtn setContentMode:UIViewContentModeScaleAspectFit];
        [self.playBtn addTarget:_mainVC action:@selector(playStory) forControlEvents:UIControlEventTouchUpInside];
        [self.background addSubview:self.playBtn];
        
        self.trackBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.background.frame.size.width - 260) /2, self.imageToLoad.frame.size.height + 140, 260, 60)];
        [self.trackBtn setImage:[UIImage imageNamed:@"Track"] forState:UIControlStateNormal];
        [self.trackBtn addTarget:self action:@selector(callDelivery) forControlEvents:UIControlEventTouchUpInside];
        [self.trackBtn setContentMode:UIViewContentModeScaleAspectFit];
        [self.background addSubview:self.trackBtn];

        
        
        // All different labels
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(320, 240, 450, 80)];
        [self.nameLabel setTextColor:[UIColor colorWithRed:240/255.0f green:177/255.0f blue:143/255.0f alpha:1.0f]];
        self.nameLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        self.nameLabel.font = [UIFont fontWithName:@"Mikado" size:72]; // BOLD ??
        [self.nameLabel setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
        [self.background addSubview:self.nameLabel];
        
        self.storyIDlabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 465, 200, 30)];
        [self.storyIDlabel setTextColor:[UIColor colorWithRed:158/255.0f green:181/255.0f blue:193/255.0f alpha:1.0f]];
        self.storyIDlabel.lineBreakMode = NSLineBreakByTruncatingTail;
        self.storyIDlabel.font = [UIFont fontWithName:@"Archer Book" size:12];
        [self.storyIDlabel.text capitalizedString];
        [self.background addSubview:self.storyIDlabel];
        
        self.statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(250, 530, 350, 100)];
        self.statusLabel.textAlignment = NSTextAlignmentLeft;
        self.statusLabel.numberOfLines = 0;
        [self.statusLabel setTextColor:[UIColor whiteColor]];
        self.statusLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        self.statusLabel.font = [UIFont fontWithName:@"BureauGrotesque" size:18];
        [self addSubview:self.statusLabel];
        
        self.lockImg = [[UIImageView alloc] initWithFrame:CGRectMake(self.statusLabel.frame.origin.x-35, 560, 30, 40)];
        [self.lockImg setImage:[UIImage imageNamed:@"locked"]];
        [self.lockImg setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:self.lockImg];

    }
    return self;
}











// Method called from carousel to update profile views

-(void)updateView:(ViewModel*)view Number:(NSInteger)number
{
    self.type = [[[_mainVC.dataFeed.dataArray objectForKey:@"redeemed"] objectAtIndex:number] objectForKey:@"type"];
    self.salutation = [[[_mainVC.dataFeed.dataArray objectForKey:@"redeemed"] objectAtIndex:number] objectForKey:@"salutation"];
    self.photo = [[[_mainVC.dataFeed.dataArray objectForKey:@"redeemed"] objectAtIndex:number] objectForKey:@"photo"];
    self.redeem_code = [[[_mainVC.dataFeed.dataArray objectForKey:@"redeemed"] objectAtIndex:number] objectForKey:@"redeem_code"];
    self.recipient_name = [[[_mainVC.dataFeed.dataArray objectForKey:@"redeemed"] objectAtIndex:number] objectForKey:@"recipient_name"];
    self.disguise_type = [[[_mainVC.dataFeed.dataArray objectForKey:@"redeemed"] objectAtIndex:number] objectForKey:@"disguise_type"];
    self.gender = [[[_mainVC.dataFeed.dataArray objectForKey:@"redeemed"] objectAtIndex:number] objectForKey:@"gender"];
    self.redeem_status = [[[_mainVC.dataFeed.dataArray objectForKey:@"redeemed"] objectAtIndex:number] objectForKey:@"redeem_status"];
    self.redeem_date = [[[_mainVC.dataFeed.dataArray objectForKey:@"redeemed"] objectAtIndex:number] objectForKey:@"redeem_date"];
    self.share_status = [[[_mainVC.dataFeed.dataArray objectForKey:@"redeemed"] objectAtIndex:number] objectForKey:@"share_status"];
    self.shared_image = [[[_mainVC.dataFeed.dataArray objectForKey:@"redeemed"] objectAtIndex:number] objectForKey:@"shared_image"];
    
    
    
    // Index of this view
    
    view.viewIndex = number;
    
    [view.nameLabel setText:self.recipient_name];
    [view.storyIDlabel setText:[NSString stringWithFormat:@"Story ID: %@",self.redeem_code]];
    
    
    
    
    
    // Status text depending on share_status status
    
    if (!self.share_status || [self.share_status isEqualToString:@"locked"])
    {
        [view.statusLabel setText:[NSString stringWithFormat:@"Messaging has not been authorised by %@'s parent or guardian yet",self.recipient_name]];
    }
    else
    {
        [view.statusLabel setText:[NSString stringWithFormat:@"Messaging has been authorised by %@'s parent or guardian yet",self.recipient_name]];
    }

    
    
    
    
    // Asynchronous photo loading
    

    __weak typeof(ViewModel)* weakSelf = view;
    
    
    NSMutableURLRequest * requestPhoto = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.photo]];
    [view.photoView setImageWithURLRequest:requestPhoto placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image)
     {
         
         
         // Costume type depending on gender
         
         if ([self.gender isEqualToString:@"male"])
         {
             [weakSelf.character setImage:[UIImage imageNamed:@"Bitmap_male_trans"]];
         }
         else
         {
             [weakSelf.character setImage:[UIImage imageNamed:@"Bitmap_female_trans"]];
         }
         
         // If succeeded, setting and cropping the photo with a male or female mask for the costume.
         
         WBMaskedImageView *imgView = [WBMaskedImageView new];
         imgView.originalImage = image;
         
         if ([self.gender isEqualToString:@"male"])
         {
             imgView.maskImage = [UIImage imageNamed:@"maleMask"];
             weakSelf.photoView.frame = CGRectMake(47, 110, 160, 160);
         }
         else
         {
             imgView.maskImage = [UIImage imageNamed:@"femaleMask"];
             weakSelf.photoView.frame = CGRectMake(25, 70, 210, 210);
         }
         
         [weakSelf.photoView setImage:imgView.image];
         
     } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
         NSLog(@"Error : %@", error);
     }];
    
    
    
    // Asynchronous central image loading
    
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.shared_image]];
    [view.imageToLoad setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image)
     {
         [weakSelf.imageToLoad setImage:image];
         
     } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
         NSLog(@"Error : %@", error);
     }];
    
    
}









// Method called with three parameters for track delivery button call.

-(void)callDelivery
{
    [_mainVC trackDelivery:self.redeem_status redeemDate:self.redeem_date share_status:self.share_status];
}







// Method to zoom and dezoom central image

-(void)zoomImage
{
    if (self.imageToLoad.tag == 1) // If tag egal 1 photo is in initial position.
    {
        [_mainVC hideBar]; // hide status bar
        
        self.imageToLoad.tag = 2;
        
        rectZoom = [self.imageToLoad.superview convertRect:self.imageToLoad.frame toView:[[UIApplication sharedApplication] delegate].window];
        
        self.imageToLoad.frame = rectZoom;
        
        [[[UIApplication sharedApplication] delegate].window addSubview:self.imageToLoad];
        
        [UIView animateWithDuration:0.7 delay:0.0f usingSpringWithDamping:0.7f initialSpringVelocity:8.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            self.imageToLoad.frame = [[UIApplication sharedApplication] delegate].window.frame;
            self.magGlassBtn.frame = CGRectMake(950, 20, 50, 50);
            
        } completion:nil];
        
    }
    else if (self.imageToLoad.tag == 2) // If tag egal 2, photo is in Full screen.
    {
        [_mainVC showBar]; // show status bar
        
        self.imageToLoad.tag = 1;
        
        [UIView animateWithDuration:0.7 delay:0.0f usingSpringWithDamping:0.7f initialSpringVelocity:8.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            self.imageToLoad.frame = rectZoom;
            self.magGlassBtn.frame = CGRectMake(self.imageToLoad.frame.size.width - 40, 15, 50, 50);
            
        } completion:^(BOOL finished) {
            
            self.imageToLoad.frame = CGRectMake((self.background.frame.size.width - 270) /2, 10, 270, 260);
            [self.background addSubview:self.imageToLoad];
            
        }];
    }
}








@end
