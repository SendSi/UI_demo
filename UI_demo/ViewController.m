//
//  ViewController.m
//  UI_demo
//
//  Created by scuplt on 16-3-20.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "ViewController.h"
#import "userInfo_Model.h"
@interface ViewController ()
- (IBAction)clickLogin;
@property (weak, nonatomic) IBOutlet UITextField *userText;
@property (weak, nonatomic) IBOutlet UITextField *pwdText;
@property (weak, nonatomic) IBOutlet UILabel *loginResult;
@end

@implementation ViewController

- (IBAction)clickLogin {
    [self getConn];
}
-(void)getConn{
    NSString *str=[NSString stringWithFormat:@"http://localhost/login.php?username=%@&password=%@",self.userText.text,self.pwdText.text];
    str=[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];//当url中有 中文时,用此句转义
    
    //str=  [str stringByRemovingPercentEncoding];    //当有 特殊字符时,转义  %^&**
    
    NSURL *url=[NSURL URLWithString:str];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if(connectionError==nil){
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            NSLog(@"dict=%@",dict);
            
            userInfo_Model *user=[[userInfo_Model alloc] init];
            [user setValuesForKeysWithDictionary:dict];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.loginResult.text=@"完成登录";
            }];
        }
        else {//当出现错误时,会 给友情 提示
            NSLog(@"bad");//必须使用dispatch,这样才能 至此为 主线线
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView *views=[[UIAlertView alloc] initWithTitle:@"提示" message:@"网络不给力" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil     , nil];
                [views show ];
            });
        }
    }];
    
}
@end














