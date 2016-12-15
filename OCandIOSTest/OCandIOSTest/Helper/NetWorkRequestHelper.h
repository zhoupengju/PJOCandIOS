//
//  NetWorkRequestHelper.h
//  OCandIOSTest
//
//  Created by 周鹏钜 on 16/12/14.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkRequestHelper : NSObject

+ (void)getDataSuccessBlock:(void(^)(NSDictionary *dict))successBlock;

@end
