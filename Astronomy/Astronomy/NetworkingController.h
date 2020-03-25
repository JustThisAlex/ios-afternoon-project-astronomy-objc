//
//  NetworkingController.h
//  Astronomy
//
//  Created by Alexander Supe on 25.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Photo;

@interface NetworkingController : NSObject

- (void)getImagesForSol:(int)sol
             completion:(void (^)( NSMutableArray<Photo *> * _Nullable photos, BOOL success))completionHandler;

@end

NS_ASSUME_NONNULL_END
