//
//  ModeViewController.m
//  RainyWords
//
//  Created by F1RSTst on 11/8/2558 BE.
//  Copyright © 2558 Indyzalab. All rights reserved.
//

#import "ModeViewController.h"

@interface ModeViewController ()

@end

@implementation ModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.easyBtn addTarget:self
                 action:@selector(onClickEasyButton:)
          forControlEvents:UIControlEventTouchUpInside];
    
    [self.intBtn addTarget:self
                    action:@selector(onClickIntermediateButton:)
          forControlEvents:UIControlEventTouchUpInside];
    
    [self.hardBtn addTarget:self
                    action:@selector(onClickHardButton:)
          forControlEvents:UIControlEventTouchUpInside];
    
    [self.crazyBtn addTarget:self
                    action:@selector(onClickCrazyButton:)
          forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) onClickEasyButton:(UIGestureRecognizer *) recognizer{
    NSLog(@"Easy button click");
    [self toConnectionsController:Nil ];

}
- (void) onClickIntermediateButton:(UIGestureRecognizer *) recognizer{
    NSLog(@"Intermediate button click");
    [self toConnectionsController:Nil ];
}
-(void) onClickHardButton:(UIGestureRecognizer *) recognizer{
    NSLog(@"Hard Button click");
    [self toConnectionsController:Nil ];
}
-(void) onClickCrazyButton:(UIGestureRecognizer *) recognizer{
    NSLog(@"Crazy Button click");
    [self toConnectionsController:Nil ];
}

/* - (void)toClientList:(UIGestureRecognizer *)recognizer {
    ClientListViewController *VC2 = [self.storyboard instantiateViewControllerWithIdentifier:@"ClientListViewController"];
    VC2.delegate = self;
//    VC2.parentViewControllerType = [[ViewControllerType alloc] initWithType:MAIN_VIEW_CONTROLLER extra:VIEW_CONTROLLER_TYPE_EXTRA_BUSSTOP];
    [self presentViewController:VC2 animated:NO completion:^{
        //  [loadingView startAnimating];
        NSLog(@"Presenting Search View Controller");
    }];
} */


- (void)toConnectionsController:(UIGestureRecognizer *)recognizer {
    ConnectionsViewController *VC2 = [self.storyboard instantiateViewControllerWithIdentifier:@"ConnectionsViewController"];
    VC2.delegate = self;
    //    VC2.parentViewControllerType = [[ViewControllerType alloc] initWithType:MAIN_VIEW_CONTROLLER extra:VIEW_CONTROLLER_TYPE_EXTRA_BUSSTOP];
    [self presentViewController:VC2 animated:NO completion:^{
        //  [loadingView startAnimating];
        NSLog(@"Presenting Search View Controller");
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
