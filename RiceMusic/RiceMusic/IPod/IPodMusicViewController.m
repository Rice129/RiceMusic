//
//  IPodMusicViewController.m
//  RiceMusic
//
//  Created by damin ding on 13-5-25.
//  Copyright (c) 2013年 damin ding. All rights reserved.
//

#import "IPodMusicViewController.h"

@interface IPodMusicViewController ()

@end

@implementation IPodMusicViewController

@synthesize musicPlay     = _musicPlay;
@synthesize iPodMusicList = _iPodMusicList;
@synthesize editButton    = _editButton;

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
    UIColor * backColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"2.jpg"]];
    [self.view setBackgroundColor:backColor];
    
    _editButton = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleBordered target:self action:@selector(editMusicList:)];
    self.navigationItem.leftBarButtonItem = _editButton;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addMusicList:)];
    
    _musicPlay = [[PlayMusicManager alloc]initWithPlayerType:1 LoadSong:nil];
    [self initialMusicList];
    _iPodMusicList = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 400)];
    [_iPodMusicList setBackgroundColor:[UIColor grayColor]];
    [_iPodMusicList setDataSource:self];
    [_iPodMusicList setDelegate:self];
    [_iPodMusicList reloadData];
    [self.view addSubview:_iPodMusicList];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method

- (void)initialMusicList
{
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"songList"])
		[_musicPlay reload:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"songList"]]];
	[_iPodMusicList reloadData];
}

- (IBAction)editMusicList:(id)sender
{
    if(_musicPlay.isPlay)
		[_musicPlay stopPlay];	
	[_editButton setTitle:@"完成"];
	[_editButton setStyle:UIBarButtonItemStyleDone];
	[_editButton setAction:@selector(leaveEditMode)];
	[_iPodMusicList setEditing:YES];
}

- (void)leaveEditMode{
    [_editButton setTitle:@"編輯"];
	[_editButton setStyle:UIBarButtonItemStyleBordered];
	[_editButton setAction:@selector(editMusicList:)];
	[_iPodMusicList setEditing:NO];
	[_musicPlay saveToData];
}

- (IBAction)addMusicList:(id)sender{
    if (!_iPodMusicList.editing) {
        MPMediaPickerController *picker =
        [[MPMediaPickerController alloc] initWithMediaTypes: MPMediaTypeMusic];
        picker.delegate						= self;
        picker.allowsPickingMultipleItems	= YES;
        picker.prompt						= @"新增歌曲";
        [self presentViewController:picker animated:YES completion:nil];
    }
}

#pragma mark - MPMediaPickerControllerDelegate

- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection{
    BOOL isAdd = NO;
    NSMutableArray * mutableArray = [[NSMutableArray alloc]initWithArray:[_musicPlay.mediaItem items]];
    for (MPMediaItem * item in [mediaItemCollection items]) {
        if ([mutableArray containsObject:item] == NO) {
            [mutableArray addObject:item];
            isAdd = YES;
        }
    }
    if (isAdd == YES) {
        [_musicPlay stopPlay]; //一定要先停止, 不然會有問題
		[_musicPlay reload:mutableArray];
		[_musicPlay saveToData];
		[_iPodMusicList reloadData];

    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [_iPodMusicList dequeueReusableCellWithIdentifier:@"MusicList"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MusicList"];
    }
    cell.textLabel.text = [[[_musicPlay.mediaItem items] objectAtIndex:indexPath.row]valueForProperty:MPMediaItemPropertyTitle];
     [cell.textLabel setTextColor:[UIColor whiteColor]];
//    MPMediaItem * mediaItem = [[_musicPlay.mediaItem items]objectAtIndex:indexPath.row];
//    MPMediaItemArtwork *artwork = [mediaItem valueForProperty:MPMediaItemPropertyArtwork];
//	if(artwork)
//	{
//		UIImage *artworkImage = [artwork imageWithSize:CGSizeMake(320, 320)];
//        cell.imageView.image = artworkImage;
//	}   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_musicPlay.musicPlayer setNowPlayingItem:[[_musicPlay.mediaItem items] objectAtIndex:indexPath.row]];
    [_musicPlay playMusic];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
//    MPMediaItem * mediaItem = [[_musicPlay.mediaItem items]objectAtIndex:indexPath.row];
//    MPMediaItemArtwork *artwork = [mediaItem valueForProperty:MPMediaItemPropertyArtwork];
//	if(artwork)
//	{
//		UIImage *artworkImage = [artwork imageWithSize:CGSizeMake(320, 320)];
//		backgroundView.image = artworkImage;
//	}
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([_musicPlay.mediaItem count]>0) {
        return [_musicPlay.mediaItem count];
    }else {
        return 0;
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (_iPodMusicList.editing) {
//        return UITableViewCellEditingStyleDelete;
//    } else {
//        return UITableViewCellEditingStyleNone;
//    }
    return UITableViewCellEditingStyleDelete;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSMutableArray *tempArray = [[_musicPlay.mediaItem items]mutableCopy];
	
	[tempArray removeObjectAtIndex:indexPath.row];
	
	if([tempArray count]==0)
	{
		[_musicPlay clearMusicPlayer];
	}else
	{
		[_musicPlay reload:tempArray];
	}
	[_iPodMusicList reloadData];
}

@end
