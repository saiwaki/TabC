//
//  SecondViewController.h
//  TabC
//
//  Created by Hitoshi Saiwaki on 2013/02/16.
//  Copyright (c) 2013年 Hitoshi Saiwaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UIActionSheetDelegate, UITableViewDataSource, UITableViewDelegate> {
    UIActionSheet *as;
    UIAlertView *av;
    UITableView *tbb;
}

- (IBAction)modalButton:(id)sender;
- (IBAction)nextButton:(id)sender;
- (IBAction)acionsheetButton:(id)sender;
- (IBAction)alertButton:(id)sender;
- (IBAction)pullDownButton:(id)sender;
- (IBAction)axtButton:(id)sender;



@end
