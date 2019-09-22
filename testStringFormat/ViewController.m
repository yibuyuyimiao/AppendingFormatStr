//
//  ViewController.m
//  testStringFormat
//
//  Created by DLD on 2019/9/20.
//  Copyright © 2019 cx. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "CXBussinessModel.h"

@interface ViewController ()

/**
 模型数组
 */
@property(nonatomic,strong)NSArray*stringArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray*array = [NSMutableArray array];
    
    for (int i = 0; i< 10000; i++) {
        
        CXBussinessModel*bussness = [[CXBussinessModel alloc]init];
        bussness.IDString = @"123456";
        [array addObject:bussness];
        
    }
    self.stringArray = array;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CFAbsoluteTime startTime =CFAbsoluteTimeGetCurrent();
    
    NSString*AppendingFormatStr = @"";
    for (int i = 0; i < self.stringArray.count; i++) {
        
        CXBussinessModel*bussness = self.stringArray[i];
        
        AppendingFormatStr = [AppendingFormatStr stringByAppendingFormat:@",%@",bussness.IDString];
        
    }
    CFAbsoluteTime linkTime = (CFAbsoluteTimeGetCurrent() - startTime);
    NSLog(@"10000个用stringByAppendingFormat耗时%f ms\n", linkTime *1000.0);
    
    
    CFAbsoluteTime startTime1 = CFAbsoluteTimeGetCurrent();
    NSMutableArray*stringArray =[NSMutableArray array];
    for (int i = 0; i < self.stringArray.count; i++) {
        CXBussinessModel*bussness = self.stringArray[i];
        [stringArray addObject:bussness.IDString];
    }
    NSString*JoinedString = @"";
    JoinedString = [stringArray componentsJoinedByString:@","];
    
    CFAbsoluteTime linkTime1 = (CFAbsoluteTimeGetCurrent() - startTime1);
    NSLog(@"10000个用stringByAppendingFormat耗时 %f ms\n", linkTime1 *1000.0);
   
   
}

@end
