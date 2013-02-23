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

@implementation FirstViewController {
    NSMutableArray *itemArray;
    NSInteger addCount;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:NO];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"first";
            break;
        case 1:
            return @"second";
            break;
        default:
            break;
    }
    return nil;
}



#pragma mark UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section {
    itemArray = [[NSMutableArray alloc] initWithObjects:@"Spade",@"Club",@"Diamond",@"Heart", nil];
    return [itemArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = [itemArray objectAtIndex: indexPath.row];
    }else {
        cell.textLabel.text = @"bbbbak";
    }
    
    return cell;
}

-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath{
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        // Delete時の処理をここに書く
        NSLog(@"Delete");
    }else if(editingStyle == UITableViewCellEditingStyleInsert){
        // Insert時の処理をここに書く
    }
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    [_tableView setEditing:editing animated:YES];
    if (editing) {
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addRow:)];
        [self.navigationItem setLeftBarButtonItem:addButton animated:YES];
    }else {
        [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    }
}

- (void)addRow:(id)sender {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:itemArray.count inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [itemArray addObject:[NSString stringWithFormat:@"add cell%d",addCount]];
    addCount++;
    [_tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
}

#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        ThirdViewController *third = [[ThirdViewController alloc] init];
        [delegate.navController1 pushViewController:third animated:YES];
    }
    [tv deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 0){
        return 80.0;  // １番目のセクションの行の高さを30にする
    }else{
        return 100.0;  // それ以外の行の高さを50にする
    }
}


@end
