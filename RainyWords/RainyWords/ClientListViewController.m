//
//  ClientListViewController.m
//  RainyWords
//
//  Created by F1RSTst on 11/8/2558 BE.
//  Copyright © 2558 Indyzalab. All rights reserved.
//

#import "ClientListViewController.h"

@interface ClientListViewController (){
    NSMutableArray* firstTableData;
    NSMutableArray* intermediateTableData;
}

@end

@implementation ClientListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    firstTableData = [[NSMutableArray alloc] init];
    [firstTableData addObject:@"First"];
    [firstTableData addObject:@"First"];
    [firstTableData addObject:@"First"];
    [firstTableData addObject:@"First"];
    
    [super viewDidLoad];
    intermediateTableData =[[NSMutableArray alloc] init];
    [intermediateTableData addObject:@"Intermediate"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of rows is the number of time zones in the region for the specified section.
    return firstTableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"ClientListCell";
    NSInteger index = indexPath.row;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:MyIdentifier];
    }
    
    // Here we use the provided setImageWithURL: method to load the web image
  
    cell.textLabel.text = firstTableData[index];
    return cell;
}


//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    // The header for the section is the region name -- get this from the region at the section index.
//    Region *region = [regions objectAtIndex:section];
//    return [region name];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
