//
//  myXML_LoadData.m
//  UI_demo
//
//  Created by scuplt on 16-3-22.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myXML_LoadData.h"
@interface myXML_LoadData()<NSXMLParserDelegate>
/** 可变数组  子类 */
@property (nonatomic,strong) NSMutableArray *dataList;
/**  来回拼接 字符串   */
@property (nonatomic,strong) NSMutableString *elementString;

/**  videl Model对象   */
@property (nonatomic,strong) Video_Model *v_model;

@end


@implementation myXML_LoadData

-(IBAction)loadData{
    [super loadData];//这是个父类 方法
    
    //url
    NSURL *url=[NSURL URLWithString:@"http://localhost/videos.php"];
    //request
    NSURLRequest *request= [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSXMLParser *parser= [[NSXMLParser alloc] initWithData:data];
        parser.delegate=self;
        [parser parse];
    }];
}

-(void)parserDidStartDocument:(NSXMLParser *)parser{
    //开始解析
    //dataList
    if(self.dataList==nil)
        self.dataList=[NSMutableArray array];
    else
        [self.dataList removeAllObjects];
    
    //elementString 可变字符串
    if(self.elementString==nil)
        self.elementString=[NSMutableString string];
    else
        [self.elementString setString:@""];//不要置为nil.
    
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    //对元素 开始 节点
    NSLog(@"开始节点 :::%@    %@",elementName ,attributeDict);//elementName,attributeDict 都是这个方法 自带的值
    if([elementName isEqualToString:@"video"])//对video 以下的节点 开始
    {
        self.v_model=[[Video_Model alloc] init];
        self.v_model.videoId=attributeDict[@"videoId"];//拿到videoId
    }
    
    //对每个节点都要 置为""
    [self.elementString setString:@""];
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    [self.elementString appendString:string];//拼接 ing
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    NSLog(@"结束节点 :::%@",elementName);
    if([elementName isEqualToString:@"video"])
    {
        [self.dataList addObject:self.v_model];
    }
    else if([elementName isEqualToString:@"videos"]){
        [self.v_model setValue:self.elementString forKey:elementName];
    }
}
-(void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"解析结束 ::: %@ --> %@",self.dataList,[NSThread currentThread]);
    dispatch_async(dispatch_get_main_queue(), ^{//把其 置于主线程,
        self.videoList=[self.dataList copy];
        //[关闭刷新 控件 刷新];
        [self.refreshControl endRefreshing];
    });
}
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    NSLog(@"出错了%@",parseError.localizedDescription);
    //   NSLog(@"%@", parseError.localizedDescription);
}

@end











