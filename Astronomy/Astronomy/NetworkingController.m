//
//  NetworkingController.m
//  Astronomy
//
//  Created by Alexander Supe on 25.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import "NetworkingController.h"
#import "Astronomy-Swift.h"

@implementation NetworkingController
- (void)getImagesForSol:(int)sol completion:(void (^)(NSMutableArray<Photo *> * _Nullable, BOOL))completionHandler {
    NSString *urlString = [NSString stringWithFormat:@"https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=%d&api_key=IK5EXzl5H70cLbyq5Jyp4bM8eN9icJNHzpBygHiF", sol];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completionHandler(nil, false);
            return;
        };
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSArray<NSDictionary *> *arr = dict[@"photos"];
        if (arr.count == 0) {
            completionHandler(nil, false);
            return;
        }
        NSMutableArray<Photo *> *photos = [NSMutableArray new];
        for (NSDictionary *element in arr) {
            [photos addObject:[[Photo alloc] init:element]];
        }
        NSLog(@"%@", photos[0].url);
        completionHandler(photos, true);
        
    }];
    [task resume];
}

@end
