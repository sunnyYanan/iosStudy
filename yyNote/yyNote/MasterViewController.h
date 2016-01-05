//
//  MasterViewController.h
//  yyNote
//
//  Created by ZhangYanam on 15/12/16.
//  Copyright © 2015年 ZhangYanam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end

