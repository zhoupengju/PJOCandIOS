//
//  NetWorkRequestHelper.m
//  OCandIOSTest
//
//  Created by 周鹏钜 on 16/12/14.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "NetWorkRequestHelper.h"

@implementation NetWorkRequestHelper

+(void)getDataSuccessBlock:(void (^)(NSDictionary *))successBlock {

    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"http://c.3g.163.com/nc/article/BMU8KHQD00964J4O/full.html"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        successBlock(json[@"BMU8KHQD00964J4O"]);
    }];
    
    [dataTask resume];
}

@end
