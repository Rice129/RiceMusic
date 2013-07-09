//
//  PlayMusicManager.m
//  RiceMusic
//
//  Created by damin ding on 13-5-27.
//  Copyright (c) 2013年 damin ding. All rights reserved.
//

#import "PlayMusicManager.h"

@implementation PlayMusicManager

@synthesize musicPlayer = _musicPlayer;
@synthesize mediaItem   = _mediaItem;
@synthesize isPlay      = _isPlay;

#pragma mark - PrivateMethod

- (id)initWithPlayerType:(NSInteger)PlayerType LoadSong:(NSArray *)SongList
{
    self = [self init];
    if (self) {
        switch (PlayerType) {
            case 0:{
                _musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
				if([SongList count] > 0)
				{
					MPMediaItemCollection *_mediaCollection = [[MPMediaItemCollection alloc]initWithItems:SongList];
					self.mediaItem = _mediaCollection;

					[_musicPlayer setQueueWithItemCollection:_mediaItem];
					[_musicPlayer setRepeatMode:MPMusicRepeatModeAll];
				} else {
					[_musicPlayer setQueueWithItemCollection:nil];
					[_musicPlayer setRepeatMode:MPMusicRepeatModeAll];
				}
                break;
            }
            case 1:{
                _musicPlayer = [MPMusicPlayerController iPodMusicPlayer];
				if([SongList count] > 0)
				{
					MPMediaItemCollection *_mediaCollection = [[MPMediaItemCollection alloc]initWithItems:SongList];
					self.mediaItem = _mediaCollection;
					[_musicPlayer setQueueWithItemCollection:_mediaItem];
					[_musicPlayer setRepeatMode:MPMusicRepeatModeAll];
				} else {
					[_musicPlayer setQueueWithItemCollection:_mediaItem];
					[_musicPlayer setRepeatMode:MPMusicRepeatModeAll];
				}
                break;
            }
            default:
                break;
        }
    }
    return self;
}

- (void)reload:(NSMutableArray *)SongList
{
	if([SongList count] > 0)
	{
		MPMediaItemCollection *_mediaCollection = [[MPMediaItemCollection alloc]initWithItems:(NSArray *)SongList];
		_mediaItem = _mediaCollection;
		[_musicPlayer setQueueWithItemCollection:_mediaItem];
	}
}

- (void)playMusic
{
    [_musicPlayer play];
    _isPlay = YES;
}

- (void)pauseMusic
{
    [_musicPlayer pause];
}

- (void)stopPlay
{
    [_musicPlayer stop];
    _isPlay = NO;
}

- (void)playNext
{
    [_musicPlayer skipToNextItem];
}

- (void)playPre
{
    [_musicPlayer skipToPreviousItem];
}

- (void)clearMusicPlayer
{
    _mediaItem = nil;
    [_musicPlayer setQueueWithItemCollection:nil];
}

- (void)saveToData{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[_mediaItem items]];
	[[NSUserDefaults standardUserDefaults]setObject:data forKey:@"songList"];
	[[NSUserDefaults standardUserDefaults]synchronize];
}

@end

