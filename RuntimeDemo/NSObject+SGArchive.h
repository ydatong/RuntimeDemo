//
//  NSObject+SGArchive.h
//  RuntimeDemo
//
//  Created by kanewang on 2017/1/10.
//  Copyright © 2017年 kanewang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SGArchive)

//解档
- (void)decode:(NSCoder *)aDecoder;

//归档
- (void)encode:(NSCoder *)aCoder;

@end
