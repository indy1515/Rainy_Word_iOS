//
//  ConnectionsViewController.h
//  RainyWords
//
//  Created by Plan Trongsiriwat on 11/9/2558 BE.
//  Copyright © 2558 Indyzalab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@protocol ConnectionsViewControllerDelegate <NSObject>

@end

@interface ConnectionsViewController : UIViewController <MCBrowserViewControllerDelegate, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UISwitch *swVisible;
@property (weak, nonatomic) IBOutlet UITableView *tblConnectedDevices;
@property (weak, nonatomic) IBOutlet UIButton *btnDisconnect;

@property (nonatomic,strong) id<ConnectionsViewControllerDelegate> delegate;

- (IBAction)browseForDevices:(id)sender;
- (IBAction)toggleVisibility:(id)sender;
- (IBAction)disconnect:(id)sender;

@end
