
//  userInfo_Model.m
//  UI_demo
//
//  Created by scuplt on 16-3-20.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "userInfo_Model.h"

@implementation userInfo_Model

-(NSString *)description{
    return [NSString stringWithFormat:@"<%@ : %p>{userId : %@,userName : %@,userImage : %@}",[self class],self,self.userId,self.userName,self.userImage];
}
@end
