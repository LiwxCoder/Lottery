
// ------------------------------------------
// Single.h
// REMARKS: Single.h单例宏定义的使用方法
/**
单例宏定义的使用方法:
 比如自定义单例对象为WXFileTools类
 
 // WXFileTools类中使用方法参考代码
 // ------------------------------------------
 // WXFileTools.h
 #import <Foundation/Foundation.h>
 #import "Single.h"
 
 @interface WXFileTools : NSObject
 SingleH(FileTools)
 @end
 
 
 // ------------------------------------------
 // WXFileTools.m
 #import "WXFileTools.h"
 
 @implementation WXFileTools
 SingleM(FileTools)
 @end
 
 // ------------------------------------------
 
 */

/** 宏定义头文件的实例对象方法,用##动态连接方法名 */
#define SingleH(name) +(instancetype)share##name;

/** 预编译宏判断当前是ARC环境还是MRC环境 */
#if __has_feature(objc_arc)

/** ARC编译以下代码段 ARC需重写实现以下方法 */

/** ARC环境宏定义单例对象 */
/** 修改单例对象的类型是id类型 */
#define SingleM(name) static id *_instance;\
\
/** 提供类方法,类方法命名: share + 类名 */\
+ (instancetype)share##name\
{\
return [[self alloc] init];\
}\
\
/** 重写allocWithZone方法,用一次性代码dispatch_once方法创建唯一一个对象 */\
+ (instancetype)allocWithZone:(struct _NSZone *)zone\
{\
/** dispatch_once方法创建唯一一个对象 */\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];\
});\
\
return _instance;\
}\
\
/** 因外部可能会调用copy和mutableCopy方法 */\
- (id)copyWithZone:(NSZone *)zone\
{\
return _instance;\
}\
\
- (id)mutableCopyWithZone:(NSZone *)zone\
{\
return _instance;\
}

#else

/** MRC编译以下代码段 MRC需重写实现以下方法 */

/** MRC宏定义单例对象 */
/** 修改单例对象的类型是id类型 */
#define SingleM(name) static id *_instance;\
\
/** 提供类方法,类方法命名: share + 类名 */\
+ (instancetype)share##name\
{\
    return [[self alloc] init];\
}\
\
/** 重写allocWithZone方法,用一次性代码dispatch_once方法创建唯一一个对象 */\
+ (instancetype)allocWithZone:(struct _NSZone *)zone\
{\
    /** dispatch_once方法创建唯一一个对象 */\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [super allocWithZone:zone];\
    });\
    \
    return _instance;\
}\
\
/** 因外部可能会调用copy和mutableCopy方法 */\
- (id)copyWithZone:(NSZone *)zone\
{\
    return _instance;\
}\
\
- (id)mutableCopyWithZone:(NSZone *)zone\
{\
    return _instance;\
}\
/** MRC下需重写以下三个方法,release / retain / retainCount方法 */\
/** 在MRC环境下，如果用户retain了一次，那么直接返回instance变量，不对引用计数器+1如果用户release了一次，那么什么都不做，因为单例模式在整个程序运行过程中都拥有且只有一份，程序退出之后被释放，所以不需要对引用计数器操作 */\
- (oneway void)release\
{\
  \
}\
\
- (instancetype)retain\
{\
    return _instance;\
}\
/** 惯用法，有经验的程序员通过打印retainCount这个值可以猜到这是一个单例 */\
- (NSUInteger)retainCount\
{\
    return MAXFLOAT;\
}

#endif


