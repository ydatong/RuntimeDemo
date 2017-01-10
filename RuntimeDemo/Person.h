//
//  Person.h
//  RuntimeDemo
//
//  Created by kanewang on 2017/1/10.
//  Copyright © 2017年 kanewang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) int gender;
@property (nonatomic, copy) NSString *job;

+ (instancetype)personWithInfo:(NSDictionary*)personInfo;

//晚上做的事
- (void)doSomethingAtMoring:(NSString*)something;
//白天做的事
- (void)doSomethingAtNight:(NSString*)something;

@end
