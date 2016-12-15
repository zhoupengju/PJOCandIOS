
//
//  ViewController1.m
//  OCandIOSTest
//
//  Created by 周鹏钜 on 16/12/15.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 () <UIWebViewDelegate>

@property (nonatomic, copy) NSString *urlText;

@property (nonatomic, copy) NSString *urlImg;

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];

    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self loadData];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:scrollView.bounds];
    [scrollView addSubview:webView];
    
    webView.delegate = self;
    webView.scrollView.bounces = NO;
    webView.scrollView.showsHorizontalScrollIndicator = NO;
    webView.scrollView.scrollEnabled = NO;
    webView.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
    
    NSString * htmlcontent = [NSString stringWithFormat:@"<div id=\"webview_content_wrapper\">%@</div>", self.urlText];
    
    NSString * htmlStr = [NSString stringWithFormat:@"<head><style>img { height: auto; width: auto/9; width:100%%; }</style></head>%@",htmlcontent];
    
    [webView stringByEvaluatingJavaScriptFromString:@"ResizeImages();"];
    [webView stringByEvaluatingJavaScriptFromString: @"document.documentElement.style.webkitUserSelect='none';"];
    
//    NSLog(@"%@", htmlStr);
    [webView loadHTMLString:htmlStr baseURL:nil];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {

    NSString *clientheight_str = [webView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"];
    float clientheight = [clientheight_str floatValue];
    //设置到WebView上
    webView.frame = CGRectMake(0, 0, WIDTH, clientheight+20);
    //获取WebView最佳尺寸（点）
    CGSize frame = [webView sizeThatFits:webView.frame.size];
    //获取内容实际高度（像素）
    NSString * height_str= [webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('webview_content_wrapper').offsetHeight + parseInt(window.getComputedStyle(document.getElementsByTagName('body')[0]).getPropertyValue('margin-top'))  + parseInt(window.getComputedStyle(document.getElementsByTagName('body')[0]).getPropertyValue('margin-bottom'))"];
    float height = [height_str floatValue];
    //内容实际高度（像素）* 点和像素的比
    height = height * frame.height / clientheight;
    
    self.scrollView.contentSize = CGSizeMake(WIDTH, height-20);
    NSLog(@"%f", height);
}

- (void)loadData {

    self.urlText = @"<p style=\"text-indent:24.1pt;background:white;\">\r\n\t<b><span style=\"font-size:14px;color:#000000;\">【课程背景】<\/span><\/b> \r\n<\/p>\r\n<p class=\"MsoNoSpacing\" style=\"text-indent:21.0pt;\">\r\n\t<span style=\"font-size:14px;color:#000000;\">2016年<\/span><span style=\"font-size:14px;color:#000000;\">5<\/span><span style=\"font-size:14px;color:#000000;\">月<\/span><span style=\"font-size:14px;color:#000000;\">1<\/span><span style=\"font-size:14px;color:#000000;\">日，<\/span><span style=\"font-size:14px;color:#000000;\">“<\/span><span style=\"font-size:14px;color:#000000;\">营改增<\/span><span style=\"font-size:14px;color:#000000;\">”<\/span><span style=\"font-size:14px;color:#000000;\">全面试点正式推广实施，营业税逐步退出了我国税收的历史舞台，超过了<\/span><span style=\"font-size:14px;color:#000000;\">1000<\/span><span style=\"font-size:14px;color:#000000;\">万户的“新”试点企业不仅仅是主管税务机关从地方税务局变更为国家税务局，也不仅仅是将计算缴纳价内税的营业税改为计算缴纳价外税的增值税，更是颠覆了以往对应税劳务和服务的定价、销售、采购、以及日常经营；对于“老”增值税纳税人，增值税的抵扣范围扩大，兼营、混合销售、视同销售等行为都有了重新的定位，增值税发票的管控更加严格，“营改增”对所有企业的账务处理、纳税申报、财税规划都已经产生了质的变化。<\/span><span><\/span> \r\n<\/p>\r\n<p class=\"MsoNoSpacing\" style=\"text-indent:21.0pt;\">\r\n\t<span style=\"font-size:14px;color:#000000;\">作为全面“营改增”实施的第一年，<\/span><span style=\"font-size:14px;color:#000000;\">2016<\/span><span style=\"font-size:14px;color:#000000;\">年企业所得税汇算清缴工作既涉及到营业税和增值税业务的差异调整，又涉及到诸多法律法规的衔接和业务的过渡，这都将为广大的企业财税工作者带来巨大的机遇与挑战！<\/span><span><\/span> \r\n<\/p>\r\n<p class=\"MsoNoSpacing\" style=\"text-indent:21.0pt;\">\r\n\t<span style=\"font-size:14px;color:#000000;\">乐上财税推出的汇算清缴系列课程针对“营改增”后企业主要涉税经济业务，贴近企业的业务需求，注重实际账务问题的解决，以汇算清缴工作为主线，帮您更好地理解和掌握重要政策规定，把握好纳税的尺度，切实提高纳税申报的质量，有效防范和控制税务风险，避免不必要的税务处罚和税务负担。<\/span><span><\/span> \r\n<\/p>\r\n<p style=\"text-indent:21.1pt;background:white;\">\r\n\t<b><span style=\"font-size:14px;color:#000000;\">【课程内容】<\/span><span><\/span><\/b> \r\n<\/p>\r\n<p class=\"MsoNoSpacing\" style=\"text-indent:21.0pt;\">\r\n\t<span style=\"font-size:14px;color:#000000;\">1、扣除的基本原则<\/span><span><\/span> \r\n<\/p>\r\n<p class=\"MsoNoSpacing\" style=\"text-indent:21.0pt;\">\r\n\t<span style=\"font-size:14px;color:#000000;\">2、允许税前扣除项目的确认与计量<\/span><span><\/span> \r\n<\/p>\r\n<p class=\"MsoNoSpacing\" style=\"text-indent:21.0pt;\">\r\n\t<span style=\"font-size:14px;color:#000000;\">3、扣除类需要调整的具体项目<\/span><span><\/span> \r\n<\/p>\r\n<p style=\"text-indent:21.1pt;background:white;\">\r\n\t<b><span style=\"font-size:14px;color:#000000;\">【适合人群】<\/span><span><\/span><\/b> \r\n<\/p>\r\n<p style=\"text-indent:21.0pt;background:white;\">\r\n\t<span style=\"font-size:14px;color:#000000;\">★ 会计、会计主管、税务专员、税务主管<\/span><span><\/span> \r\n<\/p>";
    
    self.urlImg = @"<img alt=\"\" src=\"http:\/\/files.ileup.com\/swfupload\/attached\/image\/20161110\/20161110113614_893.png\" \/><img alt=\"\" src=\"http:\/\/files.ileup.com\/swfupload\/attached\/image\/20161110\/20161110113614_916.png\" \/><img alt=\"\" src=\"http:\/\/files.ileup.com\/swfupload\/attached\/image\/20161110\/20161110113614_992.png\" \/><img alt=\"\" src=\"http:\/\/files.ileup.com\/swfupload\/attached\/image\/20161110\/20161110113614_206.png\" \/><img alt=\"\" src=\"http:\/\/files.ileup.com\/swfupload\/attached\/image\/20161111\/20161111171242_265.png\" \/> \r\n<p>\r\n\t&nbsp;\r\n<\/p>";
}

@end
