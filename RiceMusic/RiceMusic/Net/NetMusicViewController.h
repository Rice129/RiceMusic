//
//  NetMusicViewController.h
//  RiceMusic
//
//  Created by damin ding on 13-5-25.
//  Copyright (c) 2013年 damin ding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayMusicManager.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "PlayerViewController.h"


@interface NetMusicViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain)PlayMusicManager * playMusic;
@property (nonatomic, retain)UITableView      * netMusicList;

@end
