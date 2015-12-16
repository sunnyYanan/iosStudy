//
//  CardMatchingGame.m
//  CardGame
//
//  Created by ZhangYanam on 15/11/9.
//  Copyright © 2015年 ZhangYanam. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
@property(nonatomic, readwrite) NSInteger score;
@property(nonatomic, strong) NSMutableArray *cards;
@end
@implementation CardMatchingGame

- (NSMutableArray*) cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

- (instancetype) initWithCount:(NSUInteger)count andDeck:(Deck *)deck
{
    self = [super init];
    if (self)
    {
        for (int i = 0; i < count; i++)
        {
            Card *card = [deck drawRandomCard];
            if (card)
            {
                [self.cards addObject:card];
            }else
            {
                self = nil;
                break;
            }
        }
    }
    return self;
}
- (Card *) getCardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count])?[self.cards objectAtIndex :index ]:nil;
    
}
#define MISMATCH_PENALTY 2;
#define CLICK_COST 1;
#define BONUS 4;

- (NSString *) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self.cards objectAtIndex:index];
    NSString *result = @"";
    if (![card matched])
    {
        if ([card chosen])
        {
            [card setChosen:false];
        }
        else
        {
            for (Card *otherCard in self.cards)
            {
                if (![otherCard matched] && [otherCard chosen] == true)
                {
                    int matchScore = [card match:@[otherCard]];
                    
                    if (matchScore) {
                        self.score += matchScore * BONUS;
                        
                        [card setMatched:true];
                        [otherCard setMatched:true];
                        result = [NSString stringWithFormat:@"匹配"];
                        break;
                        
                    }else {
                        
                        [otherCard setChosen:false];
                        result = [NSString stringWithFormat:@"不匹配"];
                        self.score -= MISMATCH_PENALTY;
                    }
                }
            }
            [card setChosen:true];
        }
        self.score -= CLICK_COST;
    }
    return result;
}

@end
