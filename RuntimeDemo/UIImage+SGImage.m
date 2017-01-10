//
//  UIImage+SGImage.m
//  RuntimeDemo
//
//  Created by kanewang on 2017/1/10.
//  Copyright © 2017年 kanewang. All rights reserved.
//

#import "UIImage+SGImage.h"
#import <objc/runtime.h>

@implementation UIImage (SGImage)

+ (instancetype)sg_imageNamed:(NSString *)name {
    
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if (version >= 7.0) {
        // 如果系统版本是7.0以上，使用另外一套文件名结尾是‘_os7’的扁平化图片
        return [UIImage sg_imageNamed:[name stringByAppendingString:@"_ios7"]];
    }
    return [UIImage sg_imageNamed:name];
}

+ (void)load {
    // 获取两个类的类方法
    Method m1 = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method m2 = class_getClassMethod([UIImage class], @selector(sg_imageNamed:));
    // 开始交换方法实现
    method_exchangeImplementations(m1, m2);
}

@end
