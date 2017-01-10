//
//  NSObject+SGModel.m
//  RuntimeDemo
//
//  Created by kanewang on 2017/1/10.
//  Copyright © 2017年 kanewang. All rights reserved.
//

#import "NSObject+SGModel.h"
#import <objc/message.h>
#import <objc/runtime.h>

@implementation NSObject (SGModel)


+ (instancetype)sg_modelWithModelInfo:(NSDictionary *)modelInfo {
    
    id model = [[self alloc] init];
    
    unsigned int outCount;
    //获取属性列表
    objc_property_t *propert_list = class_copyPropertyList([self class], &outCount);
    //存放属性名称的数组
    NSMutableArray *nameArray = [NSMutableArray arrayWithCapacity:0];
    
    for (unsigned int i = 0 ; i < outCount; i++) {
        objc_property_t proerty = propert_list[i];
        //遍历属性列表 将objc_property_t结构体的名称转换为NSString
        NSString *proertyName = [NSString stringWithUTF8String:property_getName(proerty)];
        [nameArray addObject:proertyName];
    }
    
    //遍历模型字典
    [modelInfo enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
       //如果属性名称数组中存在key，说明属性存在，用KVC给模型赋值
        if ([nameArray containsObject:key]) {
            [model setValue:obj forKey:key];
        }
    }];
    
    return model;
}

@end
