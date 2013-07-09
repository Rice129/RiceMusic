//
//  RequestManager.m
//  RiceMusic
//
//  Created by damin ding on 13-5-27.
//  Copyright (c) 2013年 damin ding. All rights reserved.
//

#import "RequestManager.h"

@implementation RequestManager

static RequestManager * shareRequestManager = nil;

+ (RequestManager *)shareRequestManager
{
    @synchronized(self){
        if (shareRequestManager == nil) {
            shareRequestManager = [[RequestManager alloc] init];
        }
    }
    return shareRequestManager;
}

- (void)asynchronRequest:(NSString *)strUrl
                 didFinished:(void(^)(NSDictionary *dict))finishedBlock
                   didFailed:(void(^)(NSError *error))failedBlock{
    NSString * strUrlRequest = [[NSString stringWithString:strUrl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:strUrlRequest]];
//    [request setHTTPMethod:@"POST"];
    NSHTTPURLResponse * urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSMutableDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments|NSJSONReadingMutableContainers error:&error];
    if (dict) {
        finishedBlock(dict);
    } else {
        failedBlock(error);
    }
    NSLog(@"The result string is :%@",dict);
}



@end
