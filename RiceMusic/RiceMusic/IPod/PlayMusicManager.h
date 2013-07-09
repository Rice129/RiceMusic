//
//  PlayMusicManager.h
//  RiceMusic
//
//  Created by damin ding on 13-5-27.
//  Copyright (c) 2013年 damin ding. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface PlayMusicManager : NSObject

@property (nonatomic, retain)MPMusicPlayerController * musicPlayer;
@property (nonatomic, retain)MPMediaItemCollection * mediaItem;
@property (nonatomic, assign)BOOL   isPlay;

- (id)initWithPlayerType:(NSInteger)PlayerType LoadSong:(NSArray *)SongList;
- (void)playMusic;
- (void)pauseMusic;
- (void)stopPlay;
- (void)playNext;
- (void)playPre;
- (void)clearMusicPlayer;//清空播放容器
- (void)saveToData;//儲存
- (void)reload:(NSArray *)SongList;//重置播放容器

@end
