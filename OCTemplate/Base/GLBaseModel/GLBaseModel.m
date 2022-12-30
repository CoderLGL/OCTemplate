//
//  GLBaseModel.m
//  SSZ
//
//  Created by edz on 2020/4/9.
//  Copyright © 2020 LGL. All rights reserved.
//

#import "GLBaseModel.h"


@implementation GLBaseModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID" : @"id"};
}

// 解决烦人的NSNull( 结合 MJExtension)
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    
    if (oldValue == [NSNull null]) {
        if ([oldValue isKindOfClass:[NSArray class]]) {
            return @[];
        }else if([oldValue isKindOfClass:[NSDictionary class]]){
            return @{};
        }else{
            return @"";
        }
    }
    return oldValue;
}

@end
