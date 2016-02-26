//
//  Datafeed.h
//  GingersnapTest
//
//  Created by Karim Koriche on 31/01/2016.
//  Copyright © 2016 Karim Koriche. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewModel.h"

@class ViewController;

@interface DataModel : NSObject


@property (nonatomic, strong) NSMutableDictionary * dataArray;

@property(nonatomic,strong) ViewController * mainVC;

- (void)LoadFeed:(NSString*)url;



@end
