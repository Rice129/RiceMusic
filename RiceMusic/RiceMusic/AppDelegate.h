//
//  AppDelegate.h
//  RiceMusic
//
//  Created by damin ding on 13-5-25.
//  Copyright (c) 2013年 damin ding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain) UITabBarController * tabController;
@property (nonatomic, retain) UINavigationController * navController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
