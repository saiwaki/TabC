//
//  SecondViewController.m
//  TabC
//
//  Created by Hitoshi Saiwaki on 2013/02/16.
//  Copyright (c) 2013年 Hitoshi Saiwaki. All rights reserved.
//

#import "SecondViewController.h"
#import "FourViewController.h"
#import "AppDelegate.h"
#import "SixViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
        as = [[UIActionSheet alloc] initWithTitle:@"Title"
                                         delegate:self
                                cancelButtonTitle:@"cancel"
                           destructiveButtonTitle:@"Red"
                                otherButtonTitles:@"Normal1",@"nomarl2", nil];
        av = [[UIAlertView alloc] initWithTitle:@"Title"
                                        message:@"action"
                                       delegate:self
                              cancelButtonTitle:@"cancel"
                              otherButtonTitles:@"B1",@"B2", nil];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)modalButton:(id)sender {
    FourViewController *four = [[FourViewController alloc] init];
    [self presentViewController:four animated:YES completion:nil];
}

- (IBAction)nextButton:(id)sender {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    SixViewController *six = [[SixViewController alloc] init];
    [delegate.navController2 pushViewController:six animated:YES];
}

#pragma ActionSheetView Test
- (IBAction)acionsheetButton:(id)sender {
    [as showInView:[UIApplication sharedApplication].keyWindow];
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            NSLog(@"Red");
            break;
            
        case 1:
            NSLog(@"Normal1");
            break;
            
        case 2:
            NSLog(@"Normal2");
            break;
            
        default:
            break;
    }
}

#pragma AlertView Test
- (IBAction)alertButton:(id)sender {
    [av show];
}

- (IBAction)pullDownButton:(id)sender {
    tbb = [[UITableView alloc] init];
    tbb.frame = CGRectMake(0, -200, 320, 100);
    tbb.delegate = self;
    tbb.dataSource = self;
    [self.view addSubview:tbb];

    
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationDelegate:self];
	tbb.frame = CGRectMake(0, 0, 320, 100);
	[UIView commitAnimations];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 1: // Button1が押されたとき
            NSLog(@"Button1");
            break;
            
        case 2: // Button2が押されたとき
            NSLog(@"Button2");
            break;
            
        default: // キャンセルが押されたとき
            NSLog(@"Cancel");
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"aaaaa";
    } else if (indexPath.row == 1){
        cell.textLabel.text = @"bbbbb";
    }else {
        cell.textLabel.text = @"ccccc";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tv deselectRowAtIndexPath:indexPath animated:YES];
}

@end