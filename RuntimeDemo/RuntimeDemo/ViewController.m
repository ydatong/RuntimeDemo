//
//  ViewController.m
//  RuntimeDemo
//
//  Created by kanewang on 2017/1/10.
//  Copyright © 2017年 kanewang. All rights reserved.
//

#import "ViewController.h"
#import "UITextView+SGPlacehodler.h"
#import "Person.h"
#import "NSObject+SGModel.h"
#import <objc/runtime.h>
#import "UIImage+SGImage.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     分类添加属性
     */
    UITextView *textView = [[UITextView alloc] init];
    textView.placeholder = @"Runtime为分类添加属性";
    NSLog(@"%@",textView.placeholder);
    
    /**
     方法交换
     */
    Person *shuige = [[Person alloc] init];
    [shuige doSomethingAtMoring:@"跑步"]; //早上跑步
    [shuige doSomethingAtNight:@"写代码"]; //晚上写代码
    
    //通过 class_getInstanceMethod 函数获取到对象的方对应的Method结构体
    Method m1 = class_getInstanceMethod([Person class], @selector(doSomethingAtMoring:));
    Method m2 = class_getInstanceMethod([Person class], @selector(doSomethingAtNight:));
    //获取到两个我们想要交换的method之后，调用下面的函数对两个method进行交换
    method_exchangeImplementations(m1, m2);
    
    [shuige doSomethingAtMoring:@"跑步"];
    [shuige doSomethingAtNight:@"写代码"];
    
    _imageView.image = [UIImage imageNamed:@"image"];
    
    /**
     字典转模型
     */
    NSDictionary *personInfo = @{@"name":@"shuige",
                                 @"age":@27,
                                 @"gender":@1,
                                 @"job":@"iOS Developer"};
    
    shuige = [Person personWithInfo:personInfo];
    NSLog(@"Person 字典生成模型-------- \n %@",shuige);

    shuige = [Person sg_modelWithModelInfo:personInfo];
    NSLog(@"NSObject分类 字典转模型-------- \n%@",shuige);
    
    
    /*
     对象归解档
     */
    NSData *objData = [NSKeyedArchiver archivedDataWithRootObject:shuige];
    shuige = [NSKeyedUnarchiver unarchiveObjectWithData:objData];
    NSLog(@"对象归解档--------- \n%@",shuige);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
