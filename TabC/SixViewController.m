//
//  SixViewController.m
//  TabC
//
//  Created by Hitoshi Saiwaki on 2013/02/16.
//  Copyright (c) 2013年 Hitoshi Saiwaki. All rights reserved.
//

#import "SixViewController.h"

@interface SixViewController ()

@end

@implementation SixViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.navigationItem.title = @"Six";
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSURL *url = [NSURL URLWithString:@"https://qiita.com/api/v1/users/kenohata@github"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSURLConnection *connect = [[NSURLConnection alloc]initWithRequest:req delegate:self];
    if (connect) {
        NSLog(@"start loading");
    }
}

- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data
{
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSLog(@"%@",json);
    
    CGRect rect = CGRectMake(65, 37, 250, 100);
    UITextView *tv = [[UITextView alloc]initWithFrame:rect];
    tv.editable = NO;
    tv.text = [json objectForKey:@"profile_image_url"];
    [self.view addSubview:tv];
    
    CGRect rr = CGRectMake(70, 10, 300, 30);
    UILabel *lv = [[UILabel alloc]initWithFrame:rr];
    lv.text = [json objectForKey:@"name"];
    [self.view addSubview:lv];

    NSURL *url = [NSURL URLWithString:[json objectForKey:@"profile_image_url"]];
    NSData  *tmp_data  = [NSData dataWithContentsOfURL:url];
    UIImage *profileImage = [UIImage imageWithData:tmp_data];
    CGRect tmp_rect   = CGRectMake(10, 20, 50, 50);
    UIImageView *iv = [[UIImageView alloc] initWithFrame:tmp_rect];
    iv.image = profileImage;
    [self.view addSubview:iv];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
