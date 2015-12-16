//
//  Deck.h
//  CardGame
//
//  Created by ZhangYanam on 15/9/23.
//  Copyright (c) 2015年 ZhangYanam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
-(Card *) drawRandomCard;
-(void) addCard:(Card*) card atTop:(BOOL)atTop;
-(void) addcard:(Card*) card;
@end
