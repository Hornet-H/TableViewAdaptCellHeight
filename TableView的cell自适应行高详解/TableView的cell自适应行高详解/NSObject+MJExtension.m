//
//  HFBaseViewController.h
//  TableView的cell自适应行高详解
//
//  Created by 黄来峰 on 16/9/26.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//



#import "NSObject+MJExtension.h"
@implementation NSObject (MJExtension)
+(id)parse:(id)responseObj{
    if ([responseObj isKindOfClass:[NSArray class]]) {
        return [self mj_objectArrayWithKeyValuesArray:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        return [self mj_objectWithKeyValues:responseObj];
    }
    return responseObj;
}
+(NSDictionary *)mj_objectClassInArray{
    return [self objClassInArray];
}
+(NSDictionary *)objClassInArray{
    return nil;
}
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return [self replaceKeyFromPropertyName];
}
+(NSDictionary *)replaceKeyFromPropertyName{
    return nil;
}
/** 通过加载Plist文件返回一个模型数组*/
+ (NSMutableArray *)objectArrayWithFilename:(NSString *)filename{
   return  [self mj_objectArrayWithFilename:filename];
}


@end
