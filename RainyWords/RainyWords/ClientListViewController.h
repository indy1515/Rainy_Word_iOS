//
//  ClientListViewController.h
//  RainyWords
//
//  Created by F1RSTst on 11/8/2558 BE.
//  Copyright © 2558 Indyzalab. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ClientListViewControllerDelegate <NSObject>

@end
@interface ClientListViewController : UIViewController


@property (nonatomic,strong) id<ClientListViewControllerDelegate> delegate;
@end
