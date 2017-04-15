//
//  NSObject+SelectorCarsh.m
//  SelectorCarsh
//
//  Created by runlin on 17/4/13.
//  Copyright © 2017年 gavin. All rights reserved.
//

#import "NSObject+SelectorCarsh.h"
#import <objc/runtime.h>

const char *CUSTOM_PROPERTY = "CUSTOM_PROPERTY";

@implementation NSObject (SelectorCarsh)


+ (void)load{
    [self method_chang:[self class] withSEL:@selector(methodSignatureForSelector:) withNewClass:[self class] withNeworiginalSEL:@selector(customMethodSignatureForSelector:)];
    [self method_chang:[self class] withSEL:@selector(forwardInvocation:) withNewClass:[self class] withNeworiginalSEL:@selector(customForwardInvocation:)];
}


+ (void)method_chang:(Class)originalClass withSEL:(SEL)originalSEL withNewClass:(Class)newClass withNeworiginalSEL:(SEL)newSEL{
    Method methodOriginal = class_getInstanceMethod(originalClass, originalSEL);
    Method methodNew = class_getInstanceMethod(newClass, newSEL);
    
    method_exchangeImplementations(methodOriginal, methodNew);
}



- (NSMethodSignature *)customMethodSignatureForSelector:(SEL)aSelector{
    if (![self respondsToSelector:aSelector]) {
        NSString *errorName = NSStringFromSelector(aSelector);
        NSMethodSignature *methodSignature = [self customMethodSignatureForSelector:aSelector];
        if (class_addMethod([self class], aSelector, (IMP)dynamicMethod, "v@:@")) {
            objc_setAssociatedObject(self, CUSTOM_PROPERTY, errorName, OBJC_ASSOCIATION_COPY_NONATOMIC);
            NSLog(@"seccuess");
        }
        
        if (!methodSignature) {
            methodSignature = [self customMethodSignatureForSelector:aSelector];
        }
        return methodSignature;
        
    }else{
        return [self customMethodSignatureForSelector:aSelector];
    }
}


- (void)customForwardInvocation:(NSInvocation *)invocation{
    SEL selector = [invocation selector];
    if ([self respondsToSelector:selector]) {
        [invocation invokeWithTarget:self];
    }else{
        [self customForwardInvocation:invocation];
    }
}


void dynamicMethod(id self,SEL _cmd , NSString *str){
    NSString *name = NSStringFromClass([self class]);
    NSString *errorName = objc_getAssociatedObject(self, CUSTOM_PROPERTY);
    NSLog(@"%@%@里%@%@",@"⚠️：  ", name , errorName,@"方法未实现");
}




@end
