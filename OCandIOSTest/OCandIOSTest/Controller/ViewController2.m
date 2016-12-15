//
//  ViewController2.m
//  OCandIOSTest
//
//  Created by 周鹏钜 on 16/12/15.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 () <UIWebViewDelegate, JSObjcDelegate>

@property (nonatomic, strong) JSContext *jsContext;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    
    webView.delegate = self;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"newsDetail" ofType:@"html"];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {

    JSContext *jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    self.jsContext = jsContext;
    jsContext[@"zhoupengju"] = self;
    jsContext.exceptionHandler = ^(JSContext *context, JSValue *exception) {
    
        context.exception = exception;
        NSLog(@"异常信息: %@", exception);
    };
}

- (void)callcallBack {

    NSLog(@"callcallBack");
    
    // 传值
    JSValue *Callback = self.jsContext[@"Callback"];
    [Callback callWithArguments:@[@"猜猜我是谁!"]];
}

- (void)passValueCall:(NSString *)callString {

    // 调用html里面的回调
    JSValue *Callback = self.jsContext[@"alerCallback"];
    [Callback callWithArguments:@[callString]];
    
    // 直接添加提示框
    NSString *str = @"alert('OC添加JS提示成功')";
    [self.jsContext evaluateScript:str];
}

@end
