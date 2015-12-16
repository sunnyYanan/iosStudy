//
//  CardMatchingGame.h
//  CardGame
//
//  Created by ZhangYanam on 15/11/9.
//  Copyright © 2015年 ZhangYanam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

- (instancetype) initWithCount:(NSUInteger) count andDeck:(Deck*) deck;

- (Card *) getCardAtIndex:(NSUInteger) index;

- (NSString *) chooseCardAtIndex:(NSUInteger) index;

@property(nonatomic, readonly) NSInteger score;

@end
