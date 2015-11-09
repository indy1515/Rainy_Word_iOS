//
//  ViewController.m
//  RainyWords
//
//  Created by F1RSTst on 11/5/2558 BE.
//  Copyright © 2558 Indyzalab. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize titleLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.titleLabel sizeToFit];
//    [titleLabel sizeToFit];
//    self.titleLabel.sizeToFit();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
