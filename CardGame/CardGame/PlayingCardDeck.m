//
//  PlayingCardDeck.m
//  CardGame
//
//  Created by ZhangYanam on 15/9/23.
//  Copyright (c) 2015年 ZhangYanam. All rights reserved.
//

#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

-(instancetype) init {
    self = [super init];
    if(self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                [self addcard:card];
            }
        }
    }
    return self;
}

@end
