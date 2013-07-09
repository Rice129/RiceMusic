//
//  MusicModel.h
//  RiceMusic
//
//  Created by damin ding on 13-5-27.
//  Copyright (c) 2013年 damin ding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicModel : NSObject

@property(retain,nonatomic)NSString *mSongUrl;      //链接URL
@property(retain,nonatomic)NSString *mSongName;     //歌曲名称
@property(retain,nonatomic)NSString *mSingerName;   //歌手姓名
@property(retain,nonatomic)NSString *mAlbumName;    //专辑链接
@property(retain,nonatomic)NSString *mAlbumLink;    //专辑链接
@property(retain,nonatomic)NSString *mSongLrcUrl;   //链接URL
@property(retain,nonatomic)NSString *mPlaytime;     //时长

@end
