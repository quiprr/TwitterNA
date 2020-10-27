#import "TwitterNA.h"
// Some of this code is derived from https://github.com/haoict/twitter-no-ads/blob/master/Tweak.xm.

%hook TFNItemsDataViewController

- (id)tableViewCellForItem:(id)arg1 atIndexPath:(id)arg2
{
	UITableViewCell *cell = %orig;
	id item = [self itemAtIndexPath: arg2];
	NSString *clsNm = NSStringFromClass([item classForCoder]);
	id i = [self itemAtIndexPath: arg2];
	if ([i respondsToSelector: @selector(isPromoted)] && [i performSelector: @selector(isPromoted)]) [cell setHidden: YES];

	if ([clsNm isEqualToString:@"TFNTwitterModuleFooter"] && [((TFNTwitterModuleFooter *)item).url.absoluteString containsString:@"connect_people"])
	{
		[cell setHidden: YES];
		return cell;
	}

	if ([clsNm isEqualToString:@"T1URTFooterViewModel"] && [((T1URTFooterViewModel *)item).url.absoluteString containsString:@"connect_people"] )
	{
		[cell setHidden: YES];
		return cell;
	}

	if ([clsNm isEqualToString:@"T1Twitter.URTTimelineTrendViewModel"] || [clsNm isEqualToString:@"T1Twitter.URTTimelineEventSummaryViewModel"] || [clsNm isEqualToString:@"T1URTTimelineMessageItemViewModel"])
	{
		[cell setHidden: YES];
		return cell;
	}

	if ([clsNm isEqualToString:@"TFNTwitterUser"] && [NSStringFromClass([self class]) isEqualToString:@"T1HomeTimelineItemsViewController"])
	{
		[cell setHidden: YES];
		return cell;
	}

	if ([clsNm isEqualToString:@"T1URTTimelineUserItemViewModel"] && [((T1URTTimelineUserItemViewModel *)item).scribeComponent isEqualToString:@"suggest_who_to_follow"])
	{
		[cell setHidden: YES];
		return cell;
	}

	if ([clsNm isEqualToString:@"T1Twitter.URTModuleHeaderViewModel"])
	{
		[cell setHidden: YES];
		return cell;
	}

	if ([clsNm isEqualToString:@"T1Twitter.URTTimelineTrendViewModel"] || [clsNm isEqualToString:@"T1Twitter.URTTimelineEventSummaryViewModel"] || [clsNm isEqualToString:@"T1URTTimelineMessageItemViewModel"])
	{
		return 0;
	}

	return cell;	
}

- (double)tableView: (id)arg1 heightForRowAtIndexPath: (id)arg2
{
	id i = [self itemAtIndexPath: arg2];
	if([i respondsToSelector: @selector(isPromoted)] && [i performSelector: @selector(isPromoted)]) return 0;
	return %orig;
}

%end