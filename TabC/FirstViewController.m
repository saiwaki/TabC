//
//  FirstViewController.m
//  TabC
//
//  Created by Hitoshi Saiwaki on 2013/02/16.
//  Copyright (c) 2013年 Hitoshi Saiwaki. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
#import "ThirdViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
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

#pragma mark UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    ThirdViewController *third = [[ThirdViewController alloc] init];
    [delegate.navController1 pushViewController:third animated:YES];
}


@end
