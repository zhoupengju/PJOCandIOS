//
//  ViewController2.h
//  OCandIOSTest
//
//  Created by 周鹏钜 on 16/12/15.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JSObjcDelegate <JSExport>

- (void)callcallBack;

- (void)passValueCall:(NSString *)callString;

@end

@interface ViewController2 : UIViewController

@end
