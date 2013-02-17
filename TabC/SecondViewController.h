//
//  SecondViewController.h
//  TabC
//
//  Created by Hitoshi Saiwaki on 2013/02/16.
//  Copyright (c) 2013年 Hitoshi Saiwaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UIActionSheetDelegate> {
    UIActionSheet *as;
    UIAlertView *av;
}

- (IBAction)modalButton:(id)sender;
- (IBAction)nextButton:(id)sender;
- (IBAction)acionsheetButton:(id)sender;
- (IBAction)alertButton:(id)sender;



@end
