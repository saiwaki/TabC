//
//  ThirdViewController.h
//  TabC
//
//  Created by Hitoshi Saiwaki on 2013/02/16.
//  Copyright (c) 2013年 Hitoshi Saiwaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate>

- (IBAction)nextButton:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *fieldText;
@property (strong, nonatomic) IBOutlet UITextView *fieldViewText;

@end
