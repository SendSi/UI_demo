//
//  myXML_C.h
//  UI_demo
//
//  Created by scuplt on 16-3-21.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video_Model.h"

@interface myXML_C : UITableViewController
/**  父类的 数组 array    */
@property (nonatomic,strong) NSArray *videoList;

-(IBAction)loadData;

@end
