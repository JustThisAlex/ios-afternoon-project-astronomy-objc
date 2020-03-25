//
//  CustomCacheClass.m
//  Astronomy
//
//  Created by Alexander Supe on 25.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import "CustomCacheClass.h"

@interface CustomCacheClass ()

@property NSCache *cache;

@end

@implementation CustomCacheClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cache  = [NSCache new];
    }
    return self;
}

- (id)getObjectForKey:(NSString *)key {
    return [self.cache objectForKey:key];
}

- (void)addObject:(id)object forKey:(NSString *)key {
    [self.cache setObject:object forKey:key];
}

@end
