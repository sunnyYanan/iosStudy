//
//  PlayingCard.m
//  CardGame
//
//  Created by ZhangYanam on 15/9/23.
//  Copyright (c) 2015年 ZhangYanam. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int) match:(NSArray*)otherCards
{
    int score = 0;
    for(PlayingCard *card in otherCards) {
        if ([card rank] == self.rank) {
            score += 4;
        }
        else if ([[card suit] isEqualToString:self.suit]) {
            score += 1;
        }
    }
    
    return score;
}
- (NSString *)contents {
    NSArray *rankString = [PlayingCard rankStrings];
    return [rankString[self.rank] stringByAppendingString:self.suit];
}

+(NSArray*) rankStrings {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}
+(NSUInteger) maxRank {
    return [[self rankStrings] count]-1;
}

-(void) setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@synthesize suit = _suit;
+(NSArray*) validSuits {
    return @[@"♥︎",@"♠︎",@"♣︎ ",@"♦︎"];
}
-(NSString*) suit {
    return _suit?_suit:@"?";
}
-(void) setSuit:(NSString*)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

@end
