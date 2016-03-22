//
//  myXML_C.m
//  UI_demo
//
//  Created by scuplt on 16-3-21.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "myXML_C.h"

@interface myXML_C ()<NSXMLParserDelegate>
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation myXML_C

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self LoadXML];
}

-(void) LoadXML{
    NSURL *url=[NSURL URLWithString:@"http:"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:10.0];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if(connectionError==nil){
            NSXMLParser *parser=[[NSXMLParser alloc ]init];
            parser.delegate=self;
            [parser parse];
        }else{
            
        }
    }];
}

#pragma mark -xml代理
-(void)parserDidStartDocument:(NSXMLParser *)parser{
    //开始解析
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    //开始对元素
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    //拼接字符串
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    //结束对元素
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
    //结束解析
}
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    //出现错误
}

@end












