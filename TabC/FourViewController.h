//
//  FourViewController.h
//  TabC
//
//  Created by Hitoshi Saiwaki on 2013/02/16.
//  Copyright (c) 2013年 Hitoshi Saiwaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FourViewController : UIViewController<UIWebViewDelegate>

- (IBAction)closeButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIWebView *wv;
@property (strong, nonatomic) IBOutlet UIToolbar *toolBar;

@end
