//
//  ConnectionsViewController.m
//  RainyWords
//
//  Created by Plan Trongsiriwat on 11/9/2558 BE.
//  Copyright © 2558 Indyzalab. All rights reserved.
//

#import "ConnectionsViewController.h"
#import "AppDelegate.h"

@interface ConnectionsViewController ()

@property (nonatomic, strong) AppDelegate *appDelegate;
@property (nonatomic, strong) NSMutableArray *arrConnectedDevices;

-(void)peerDidChangeStateWithNotification:(NSNotification *)notification;

@end

@implementation ConnectionsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [[_appDelegate rnManager] setupPeerAndSessionWithDisplayName:[UIDevice currentDevice].name];
    [[_appDelegate rnManager] advertiseSelf:_swVisible.isOn];
    
    [_txtName setDelegate:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(peerDidChangeStateWithNotification:)
                                                 name:@"MCDidChangeStateNotification"
                                               object:nil];
    
    _arrConnectedDevices = [[NSMutableArray alloc] init];
    [_tblConnectedDevices setDelegate:self];
    [_tblConnectedDevices setDataSource:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Public method implementation

- (IBAction)browseForDevices:(id)sender {
    [[_appDelegate rnManager] setupMCBrowser];
    [[[_appDelegate rnManager] browser] setDelegate:self];
    [self presentViewController:[[_appDelegate rnManager] browser] animated:YES completion:nil];
}

- (IBAction)toggleVisibility:(id)sender {
    [_appDelegate.rnManager advertiseSelf:_swVisible.isOn];
}

- (IBAction)disconnect:(id)sender {
    [_appDelegate.rnManager.session disconnect];
    
    _txtName.enabled = YES;
    
    [_arrConnectedDevices removeAllObjects];
    [_tblConnectedDevices reloadData];
}

#pragma mark - RNBrowserViewControllerDelegate method implementation

-(void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController{
    [_appDelegate.rnManager.browser dismissViewControllerAnimated:YES completion:nil];
}


-(void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController{
    [_appDelegate.rnManager.browser dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITextField Delegate method implementation

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_txtName resignFirstResponder];
    
    _appDelegate.rnManager.peerID = nil;
    _appDelegate.rnManager.session = nil;
    _appDelegate.rnManager.browser = nil;
    
    if ([_swVisible isOn]) {
        [_appDelegate.rnManager.advertiser stop];
    }
    _appDelegate.rnManager.advertiser = nil;
    
    
    [_appDelegate.rnManager setupPeerAndSessionWithDisplayName:_txtName.text];
    [_appDelegate.rnManager setupMCBrowser];
    [_appDelegate.rnManager advertiseSelf:_swVisible.isOn];
    
    return YES;
}

#pragma mark - Private method implementation

-(void)peerDidChangeStateWithNotification:(NSNotification *)notification{
    MCPeerID *peerID = [[notification userInfo] objectForKey:@"peerID"];
    NSString *peerDisplayName = peerID.displayName;
    MCSessionState state = [[[notification userInfo] objectForKey:@"state"] intValue];
    
    if (state != MCSessionStateConnecting) {
        if (state == MCSessionStateConnected) {
            [_arrConnectedDevices addObject:peerDisplayName];
        }
        else if (state == MCSessionStateNotConnected){
            if ([_arrConnectedDevices count] > 0) {
                int indexOfPeer = [_arrConnectedDevices indexOfObject:peerDisplayName];
                [_arrConnectedDevices removeObjectAtIndex:indexOfPeer];
            }
        }
        
        [_tblConnectedDevices reloadData];
        
        BOOL peersExist = ([[_appDelegate.rnManager.session connectedPeers] count] == 0);
        [_btnDisconnect setEnabled:!peersExist];
        [_txtName setEnabled:peersExist];
        
    }
}


#pragma mark - UITableView Delegate and Datasource method implementation

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_arrConnectedDevices count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    cell.textLabel.text = [_arrConnectedDevices objectAtIndex:indexPath.row];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}

@end
