//
//  AppDelegate.h
//  RainyWords
//
//  Created by F1RSTst on 11/5/2558 BE.
//  Copyright © 2558 Indyzalab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RainyManager.h"
#import <CoreData/CoreData.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, strong) RainyManager *rnManager;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

