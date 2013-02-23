//
//  ThirdViewController.m
//  TabC
//
//  Created by Hitoshi Saiwaki on 2013/02/16.
//  Copyright (c) 2013年 Hitoshi Saiwaki. All rights reserved.
//

#import "ThirdViewController.h"
#import "AppDelegate.h"
#import "FiveViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController {
    UIBarButtonItem *rightBtn;
}

@synthesize fieldText = _fieldText;
@synthesize fieldViewText = _fieldViewText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"Third";
        rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"Tweet" style:UIBarButtonItemStyleBordered target:self action:@selector(hoge:)];
        self.navigationItem.rightBarButtonItem = rightBtn;
        
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        btn.frame = CGRectMake(10, 10, 100, 30);
//        [btn setTitle:@"please push" forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(hoge:) forControlEvents:UIControlEventTouchDown];
//        [self.view addSubview:btn];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.fieldText.clearButtonMode = UITextFieldViewModeAlways;
    self.fieldText.placeholder = @"test";
    
    NSRange range = NSMakeRange(self.fieldViewText.text.length - 1, 1);
    [self.fieldViewText scrollRangeToVisible:range];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextButton:(id)sender {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    FiveViewController *five = [[FiveViewController alloc] init];

    [self.fieldText resignFirstResponder];
    [self.fieldViewText resignFirstResponder];
    
    [delegate.navController1 pushViewController:five animated:YES];
}

- (void)hoge:(id)sender {
    NSLog(@"push");
    [self.fieldViewText resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField endEditing:YES];
    NSMutableString *str = [textField.text mutableCopy];
    NSLog(@"%@",str);
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    NSLog(@"%@",textView.text);
    return YES;
}


@end
