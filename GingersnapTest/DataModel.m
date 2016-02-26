//
//  Datafeed.m
//  GingersnapTest
//
//  Created by Karim Koriche on 31/01/2016.
//  Copyright © 2016 Karim Koriche. All rights reserved.
//

#import "ViewController.h"
#import "DataModel.h"
#import "AFNetworking/AFHTTPSessionManager.h"

@implementation DataModel


- (void)LoadFeed:(NSString*)urlString
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        
        // Retrieve data from feed in dataArray
        
        self.dataArray = [[NSMutableDictionary alloc] initWithDictionary:responseObject];
        
        
        // Access to parent class for Carousel initialisation after loading succeeded
        // Need to know exactly how many view will be created
        
        [_mainVC initCarousel];
        
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}


@end
