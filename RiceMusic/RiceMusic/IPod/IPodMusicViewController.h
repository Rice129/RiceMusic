//
//  IPodMusicViewController.h
//  RiceMusic
//
//  Created by damin ding on 13-5-25.
//  Copyright (c) 2013年 damin ding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "PlayMusicManager.h"

@interface IPodMusicViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,MPMediaPickerControllerDelegate>

@property (nonatomic, retain) PlayMusicManager * musicPlay;
@property (nonatomic, retain) UITableView      * iPodMusicList;
@property (nonatomic, retain) UIBarButtonItem  * editButton;

@end
