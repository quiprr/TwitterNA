#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TFNTwitterStatus : NSObject
@property(readonly, nonatomic) bool isPromoted;
@end

@interface TFNDataViewItem : NSObject
@property(retain, nonatomic) id _Nullable item;
@end

@interface TFNItemsDataViewController : NSObject
@property(copy, nonatomic) NSArray * _Nullable sections;
- (id _Nullable)itemAtIndexPath:(id _Nullable)arg1;
@end

@interface T1URTFooterViewModel : NSObject
@property(nonatomic, readonly) NSURL * _Nullable url;
@end

@interface TFNTwitterModuleFooter : NSObject
@property(nonatomic, readonly) NSURL * _Nullable url;
@end

@interface T1URTTimelineUserItemViewModel : NSObject
@property(readonly, nonatomic) NSString * _Nullable scribeComponent;
@end

@interface TFSTwitterEntityURL : NSObject
@property(readonly, copy, nonatomic) NSString * _Nullable expandedURL;
@end