//
//  DetailViewController.m
//  yyNote
//
//  Created by ZhangYanam on 15/12/16.
//  Copyright © 2015年 ZhangYanam. All rights reserved.
//

#import "DetailViewController.h"
#define animationDuration 0.2

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editDone;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item
- (void) registerForKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasHidden) name:UIKeyboardDidHideNotification object:nil];
}
- (void) clearRegisterForKeyboardNotications {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void) keyboardWasShown:(NSNotification*) aNotification {
    NSDictionary* info = [aNotification userInfo];
    NSValue* aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    float keyboardHeight = [aValue CGRectValue].size.height;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [self.noteDetail setFrame:CGRectMake(0, self.noteDetail.frame.origin.y
, self.noteDetail.frame.size.width, self.view.frame.size.height-keyboardHeight - 70)];
}
- (void) keyboardWasHidden {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [self.noteDetail setFrame:CGRectMake(0, self.noteDetail.frame.origin.y, self.noteDetail.frame.size.width, self.view.frame.size.height - 70)];
    [UIView commitAnimations];
    
//    NSLog(@"haha: %f",[[UIApplication sharedApplication]statusBarFrame].size.height);
}
- (IBAction)editFinish:(id)sender {
    [_noteDetail resignFirstResponder];
    
    //保存文件
    //获取路径
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *ourDocumentPath = [documentPaths objectAtIndex:0];
    
    NSArray<NSString*> *names = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:ourDocumentPath error:nil];
    
    for (int i = 0; i!=[names count]; i++) {
        if ([[names objectAtIndex:i] isEqualToString:[self.detailItem description]]) {
            NSString *fileName = [ourDocumentPath stringByAppendingPathComponent:[names objectAtIndex:i]];
            BOOL res=[self.noteDetail.text writeToFile:fileName atomically:YES encoding:NSUTF8StringEncoding error:nil];
            if (res) {
                NSLog(@"文件写入成功");
            }else
                NSLog(@"文件写入失败");
            
            break;
        }
    }
}

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        //获取路径
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *ourDocumentPath = [documentPaths objectAtIndex:0];
        //file path
        NSString *fileName = [ourDocumentPath stringByAppendingPathComponent:[self.detailItem description]];
        NSLog(@"DETAIL FILE PATH:%@",fileName);
        //read data
        NSString *data=[NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
        
//        NSString *temp = [NSString stringWithFormat:(@"%@",[self.detailItem description])];
//        temp = [temp stringByAppendingString:@"\n"];
        self.noteDetail.text = data;
//        NSLog(@"%@",self.noteDetail);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    //去除上方空白
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self registerForKeyboardNotifications];
    
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
