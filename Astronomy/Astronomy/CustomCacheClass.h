//
//  CustomCacheClass.h
//  Astronomy
//
//  Created by Alexander Supe on 25.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomCacheClass : NSObject

- (id)getObjectForKey:(NSString *)key;
- (void)addObject:(id)object forKey:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
