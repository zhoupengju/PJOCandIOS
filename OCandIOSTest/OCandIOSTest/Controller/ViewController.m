//
//  ViewController.m
//  OCandIOSTest
//
//  Created by 周鹏钜 on 16/12/14.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "ViewController.h"
#import "NetWorkRequestHelper.h"

@interface ViewController () <UIWebViewDelegate>

@property (nonatomic, strong) WKWebView *webView;

@end

/**
 *  1. WKWebView有bug, 使用它调用css不起作用
    2.
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    WKWebView 这个控件有bug, 使用要注意
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    webView.delegate = self;
    webView.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:webView];

    [NetWorkRequestHelper getDataSuccessBlock:^(NSDictionary *dict) {
        
        // 1. 保存内容
        NSString *bodyHtml = dict[@"body"];
        
        // 2. 标题
        NSString *title = dict[@"title"];
        NSString *titleHtml = [NSString stringWithFormat:@"<div id=\"mainTitle\">%@</div>", title];
        
        // 3. 时间
        NSString *ptime = dict[@"ptime"];
        
        // 4. 来源
        NSString *source = dict[@"source"];
        NSString *subTitleHtml = [NSString stringWithFormat:@"<div id=\"subTitle\"><span class=\"time\">%@</span>%@<span></span></div>", ptime, source];
        // <span> 在CSS定义中属于一个行内元素,在行内定义一个区域，也就是一行内可以被 <span> 划分成好几个区域，从而实现某种特定效果
        
        // 5. 取出图片
        NSArray *arrayImg = dict[@"img"];
        for (NSDictionary *imgDict in arrayImg) {
        
            NSString *ref = imgDict[@"ref"];
//            NSString *imgHtml = [NSString stringWithFormat:@"<div class=\"all-img\"><img src=\"%@\"><div>%@</div></div>", imgDict[@"src"], imgDict[@"alt"]];
            NSString *imgHtml = [NSString stringWithFormat:@"<div class=\"all-img\"><img src=\"%@\"><div>%@</div></div>", @"http://cdnq.duitang.com/uploads/item/201504/30/20150430194055_3reS2.jpeg", imgDict[@"alt"]];

            bodyHtml = [bodyHtml stringByReplacingOccurrencesOfString:ref withString:imgHtml];
        }
        
        // 加载css的URL路径
        NSURL *css = [[NSBundle mainBundle] URLForResource:@"newsDetail" withExtension:@"css"];

        NSString *cssHtml = [NSString stringWithFormat:@"<link href=\"%@\" rel=\"stylesheet\">", css];
        
        
        // 加载js的URL路径
        NSURL *js = [[NSBundle mainBundle] URLForResource:@"newsDetail" withExtension:@"js"];
        NSString *jsHtml = [NSString stringWithFormat:@"<script src=%@></script>", js];
        
        NSString *html = [NSString stringWithFormat:@"<html><head>%@</head><body>%@%@%@%@</body></html>", cssHtml, titleHtml, subTitleHtml, bodyHtml, jsHtml];
        NSLog(@"%@", html);
        
        [webView loadHTMLString:html baseURL:nil];
    }];
}

#pragma mark - UIWebViewDelegate
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSLog(@"%@", [[request URL] absoluteString]);
    NSString *requestString = [[request URL] absoluteString];
    
    NSString *urlHeader = @"zpj:///";
    NSRange range = [requestString rangeOfString:urlHeader];
    NSUInteger location = range.location;
    if (location != NSNotFound) {
    
        NSString *str = [requestString substringFromIndex:(range.location + range.length)];
        SEL sel = NSSelectorFromString(str);
        [self performSelector:sel withObject:nil afterDelay:0.0];
    }

    return YES; // 控制是否要做网络请求, 可以拦截请求
}

#pragma mark - 访问相册
- (void)openCamera {

    NSLog(@"我要去访问相册了");
}

#pragma mark - 测试 1 代码
- (void)htmlTest1 {

    [self.view addSubview:self.webView];
    
    [NetWorkRequestHelper getDataSuccessBlock:^(NSDictionary *dict) {
        
        // 1. 保存内容
        NSString *bodyHtml = dict[@"body"];
        
        // 2. 标题
        NSString *title = dict[@"title"];
        NSString *titleHtml = [NSString stringWithFormat:@"<div id=\"mainTitle\">%@</div>", title];
        
        // 3. 时间
        NSString *ptime = dict[@"ptime"];
        
        // 4. 来源
        NSString *source = dict[@"source"];
        NSString *subTitleHtml = [NSString stringWithFormat:@"<div id=\"subTitle\">%@ %@</div>", ptime, source];
        
        // 5. 取出图片
        NSArray *arrayImg = dict[@"img"];
        for (NSDictionary *imgDict in arrayImg) {
            
            NSString *ref = imgDict[@"ref"];
            NSString *imgHtml = [NSString stringWithFormat:@"<div><img src=%@><div>%@</div></div>", imgDict[@"src"], imgDict[@"alt"]];
            
            bodyHtml = [bodyHtml stringByReplacingOccurrencesOfString:ref withString:imgHtml];
        }
        
        NSString *html = [NSString stringWithFormat:@"<html><head></head><body>%@%@%@</body></html>", titleHtml, subTitleHtml, bodyHtml];
        
        [_webView loadHTMLString:html baseURL:nil];
    }];
}

@end
