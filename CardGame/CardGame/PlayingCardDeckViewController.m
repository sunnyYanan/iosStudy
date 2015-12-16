//
//  PlayingCardDeckViewController.m
//  CardGame
//
//  Created by ZhangYanam on 15/11/12.
//  Copyright © 2015年 ZhangYanam. All rights reserved.
//

#import "PlayingCardDeckViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardDeckViewController ()

@end

@implementation PlayingCardDeckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (Deck*) creatDeck{
    return [[PlayingCardDeck alloc]init];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
