//
//  PlayingCard.h
//  CardGame
//
//  Created by ZhangYanam on 15/9/23.
//  Copyright (c) 2015年 ZhangYanam. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property(strong, nonatomic) NSString *suit;
@property(nonatomic) NSUInteger rank;

+ (NSArray*) validSuits;
+ (NSUInteger) maxRank;

@end
