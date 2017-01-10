//
//  Person.m
//  RuntimeDemo
//
//  Created by kanewang on 2017/1/10.
//  Copyright © 2017年 kanewang. All rights reserved.
//

#import "Person.h"
#import "NSObject+SGArchive.h"

@implementation Person


+ (instancetype)personWithInfo:(NSDictionary *)personInfo {
    
    Person *p = [[self alloc] init];
    p.name = personInfo[@"name"];
    p.age = [personInfo[@"age"] intValue];
    p.gender = [personInfo[@"gender"] intValue];
    p.job = personInfo[@"job"];
    
    return p;
}

- (void)doSomethingAtMoring:(NSString *)something {
    
    NSLog(@"早上起来 ： %@", something);
    
}
- (void)doSomethingAtNight:(NSString *)something {
    
    NSLog(@"晚上睡觉前 ： %@", something);
}

- (NSString*)description {
    
    return [NSString stringWithFormat:@"\nname : %@ \nage : %d \ngender : %d \njob : %@",self.name,self.age,self.gender,self.job];
}

/*
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super init]) {
     
        _name = [aDecoder decodeObjectForKey:@"name"];
        _age = [[aDecoder decodeObjectForKey:@"age"] intValue];
        _gender = [[aDecoder decodeObjectForKey:@"gender"] intValue];
        _job = [aDecoder decodeObjectForKey:@"job"];
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:@(_age) forKey:@"age"];
    [aCoder encodeObject:@(_gender) forKey:@"gender"];
    [aCoder encodeObject:_job forKey:@"job"];
}
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super init]) {
        
        [self decode:aDecoder];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [self encode:aCoder];
}

@end
