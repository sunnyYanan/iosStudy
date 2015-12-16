//
//  Card.m
//  CardGame
//
//  Created by ZhangYanam on 15/9/8.
//  Copyright (c) 2015年 ZhangYanam. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int) match:(NSArray *)otherCards{
    int score = 0;
    for(Card * card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
