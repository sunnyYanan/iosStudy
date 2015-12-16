//
//  Card.h
//  CardGame
//
//  Created by ZhangYanam on 15/9/8.
//  Copyright (c) 2015年 ZhangYanam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong) NSString* contents;
@property(nonatomic) BOOL matched;
@property(nonatomic) BOOL chosen;

-(int) match:(NSArray*)otherCards;

@end
