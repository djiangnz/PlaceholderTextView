//
//  ViewController.m
//  PlaceholderTextView
//
//  Created by dianyi jiang on 11/10/15.
//  Copyright © 2015 dianyi jiang. All rights reserved.
//

#import "ViewController.h"
#import "PlaceholderTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    PlaceholderTextView *txtview = [[PlaceholderTextView alloc] initWithFrame:CGRectMake(0, 50, 300, 200)];
    txtview.placeholderText = @"placeholder";
    
    txtview.placeholderColor = [UIColor redColor];
    
    txtview.backgroundColor = [UIColor blueColor];
    txtview.font = [UIFont systemFontOfSize:30];
    
    [self.view addSubview:txtview];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
