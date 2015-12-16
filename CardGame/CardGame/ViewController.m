//
//  ViewController.m
//  CardGame
//
//  Created by ZhangYanam on 15/9/8.
//  Copyright (c) 2015年 ZhangYanam. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property(nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cards;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UIButton *reStartButton;
@end

@implementation ViewController

- (CardMatchingGame *) game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCount:[self.cards count] andDeck:[self creatDeck]];
    }
    return _game;
}

- (Deck*) creatDeck{
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)restartPress:(id)sender {
    self.game = nil;
    [self game];
    [self updateUI:@"重新开始"];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger currentIndex = [self.cards indexOfObject:sender];
    NSString * stateResult = [self.game chooseCardAtIndex:currentIndex];
    
    [self updateUI:stateResult];
}

- (void) updateUI :(NSString *) result{
    for (UIButton *button in self.cards) {
        NSUInteger index = [self.cards indexOfObject:button];
        Card *card = [self.game getCardAtIndex:index];
        [button setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[self backimageForCard:card] forState:UIControlStateNormal];
        
        button.enabled = ![card matched];
        
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"score: %ld", (long)self.game.score];
    self.stateLabel.text = result;
}

- (NSString *) titleForCard:(Card *)card {
    return [card chosen]?[card contents]:@"";
}

- (UIImage *) backimageForCard:(Card *)card {
    return [UIImage imageNamed:[card chosen]?@"front":@"back"];
}

@end
