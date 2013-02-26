//
//  SevenViewController.h
//  TabC
//
//  Created by Hitoshi Saiwaki on 2013/02/16.
//  Copyright (c) 2013年 Hitoshi Saiwaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SevenViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, NSURLConnectionDelegate>{
    IBOutlet UITextField *ttF;
}

@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UITextField *tF;
@property (strong, nonatomic) IBOutlet UITextField *numberField;

@end
