//
//  RequestManager.h
//  RiceMusic
//
//  Created by damin ding on 13-5-27.
//  Copyright (c) 2013年 damin ding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestManager : NSObject

+ (RequestManager *)shareRequestManager;

- (void)asynchronRequest:(NSString *)strUrl
             didFinished:(void(^)(NSDictionary *dict))finishedBlock
               didFailed:(void(^)(NSError *error))failedBlock;

@end
