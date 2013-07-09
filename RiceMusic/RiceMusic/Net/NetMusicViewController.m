//
//  NetMusicViewController.m
//  RiceMusic
//
//  Created by damin ding on 13-5-25.
//  Copyright (c) 2013年 damin ding. All rights reserved.
//

#import "NetMusicViewController.h"
#import "RequestManager.h"

@interface NetMusicViewController ()

@end

@implementation NetMusicViewController

@synthesize playMusic    = _playMusic;
@synthesize netMusicList = _netMusicList;

#pragma mark - LifeCycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIColor * backGroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"2.jpg"]];
    [self.view setBackgroundColor:backGroundColor];
    NSArray * title = [NSArray arrayWithObjects:@"最新",@"全部", nil];
    UISegmentedControl * musicButton = [[UISegmentedControl alloc]initWithItems:title];
    [musicButton addTarget:self action:@selector(selectSegment:) forControlEvents:UIControlEventValueChanged];
    [musicButton setFrame:CGRectMake(10, 10, 100, 30)];
    [self.view addSubview:musicButton];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PrivateMethod

- (void)selectSegment: (id)segControl
{
    UISegmentedControl * segment = (UISegmentedControl *)segControl;
    NSString * musicurlString;
    switch (segment.selectedSegmentIndex) {
        case 0:{
            musicurlString=[NSString stringWithFormat:@"http://music.qq.com/musicbox/shop/v3/data/hit/hit_newsong.js"];
            break;
        }
        case 1:{
//            musicurlString=[NSString stringWithFormat:@"http://music.qq.com/musicbox/shop/v3/data/hit/hit_all.js"];
            musicurlString = [NSString stringWithFormat:@"https://api.douban.com/v2/book/1220562"];
            break;
        }
        default:
            break;
    }
//    NSString * pathCache = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES)objectAtIndex:0];
//    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSLog(@"%@",pathCache);
//    NSLog(@"%@",cachePath);
//    AVAudioPlayer * avAudoi = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://m1.file.xiami.com/74/3074/15540/190662_198578_l.mp3"]] error:nil];
//    avAudoi.url = [NSURL URLWithString:[NSString stringWithFormat:@"http://mu8.bdstatic.com/player/t/c/GBGDyBJU.css"]];
//    [avAudoi prepareToPlay];
//    [avAudoi play];
//    PlayerViewController * moviePlay = [[PlayerViewController alloc]initWithContentURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://vod.feifeikan.com:8080/vod/coshipott,TWSX1000000000000900.m3u8?fmt=x264_0k_mpegts&sora=1&timecode=0&sk=A163F5CCE84ECEC7039FEEAB6DE6D2C0&UUID=eb5b8345-fca6-4859-9c57-fdc7a6f0a067&userCode=default&userName=default&spCode=484581254562&productCode=1&resourceCode=11677&subId=123&resourceName=&authType=2"]]];
//    [moviePlay.moviePlayer.backgroundView setBackgroundColor:[UIColor purpleColor]];
//    [moviePlay.moviePlayer play];
//    [self presentModalViewController:moviePlay animated:YES];
//    [[RequestManager shareRequestManager] asynchronRequest:musicurlString
//                                               didFinished:^(NSDictionary * dict){
//                                                   if (dict) {
//                                                       
//                                                   }
//                                               }
//                                                 didFailed:^(NSError * error){}];
}

@end
