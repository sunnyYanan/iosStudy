//
//  DetailViewController.h
//  yyNote
//
//  Created by ZhangYanam on 15/12/16.
//  Copyright © 2015年 ZhangYanam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UITextView *noteDetail;

@end

