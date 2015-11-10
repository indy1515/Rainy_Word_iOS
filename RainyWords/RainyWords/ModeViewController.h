//
//  ModeViewController.h
//  RainyWords
//
//  Created by F1RSTst on 11/8/2558 BE.
//  Copyright © 2558 Indyzalab. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ClientListViewController.h"

#import "ConnectionsViewController.h"

/*@interface ModeViewController : UIViewController <ClientListViewControllerDelegate,ConnectionsViewControllerDelegate> */

@interface ModeViewController : UIViewController <ConnectionsViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *modeLabel;
@property (weak, nonatomic) IBOutlet UIButton *easyBtn;
@property (weak, nonatomic) IBOutlet UIButton *intBtn;
@property (weak, nonatomic) IBOutlet UIButton *hardBtn;
@property (weak, nonatomic) IBOutlet UIButton *crazyBtn;

@end
