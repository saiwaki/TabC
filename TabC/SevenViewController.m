//
//  SevenViewController.m
//  TabC
//
//  Created by Hitoshi Saiwaki on 2013/02/16.
//  Copyright (c) 2013年 Hitoshi Saiwaki. All rights reserved.
//

#import "SevenViewController.h"

@interface SevenViewController ()

@end

@implementation SevenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Seven", @"Seven");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        

    }
    return self;
}

- (void)viewDidLoad
{
//    UIPickerView *piv = [[UIPickerView alloc]init];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView*)pickerView
numberOfRowsInComponent:(NSInteger)component{
    return 15;  // 1列目は10行
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return @"電子回路";
}

- (void)showPicker {
    _picker.frame = CGRectMake(0, 420, 320, 216);
    [self.view addSubview:_picker];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationDelegate:self];
    _picker.frame = CGRectMake(0, 204, 320, 216);
    [UIView commitAnimations];
    
    if (!self.navigationItem.rightBarButtonItem) {
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
        [self.navigationItem setRightBarButtonItem:doneButton animated:YES];        
    }
}

- (void)hidePicker {
	// ピッカーが下に隠れるアニメーション
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.4];
	[UIView setAnimationDelegate:self];
	_picker.frame = CGRectMake(0, 420, 320, 216);
	[UIView commitAnimations];
    
	// doneボタンを消す
	[self.navigationItem setRightBarButtonItem:nil animated:YES];
}

- (void)done:(id)sender {
	// ピッカーしまう
	[self hidePicker];
	
	// doneボタン消す
    [self.navigationItem setRightBarButtonItem:nil animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField endEditing:YES];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == _tF) {
        [self showPicker];
        return NO;
    }else{
        return YES;
    }

}


@end
