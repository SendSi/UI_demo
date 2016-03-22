//
//  Video_Model.m
//  UI_demo
//
//  Created by scuplt on 16-3-22.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "Video_Model.h"

@implementation Video_Model
-(NSString *)description{
    return [NSString stringWithFormat:@"<%@ : %p>{videoId:%@,name : %@,length : %@,videoURL : %@, imageURL : %@,desc : %@,teacher : %@}",[self class],self ,self.videoId,self.name,self.length,self.videoURL,self.imageURL,self.desc,self.teacher];
}
@end
