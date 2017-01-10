//
//  UITextView+SGPlacehodler.m
//  RuntimeDemo
//
//  Created by kanewang on 2017/1/10.
//  Copyright © 2017年 kanewang. All rights reserved.
//

#import "UITextView+SGPlacehodler.h"
#import <objc/runtime.h>

char *kSGTextViewPlaceholder = "SGTextViewPlacehoder";

@implementation UITextView (SGPlacehodler)

//set方法
- (void)setPlaceholder:(NSString *)placeholder {
    //  将传进来的值，通过 objc_setAssociatedObject 关联到textview
    objc_setAssociatedObject(self, &kSGTextViewPlaceholder, placeholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//get方法
- (NSString*)placeholder {
    //通过key，获取到与textview关联的placeholder
    return objc_getAssociatedObject(self, &kSGTextViewPlaceholder);
}
@end
