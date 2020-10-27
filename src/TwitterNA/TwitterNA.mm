#import "TwitterNA.h"

%hook TFNItemsDataViewController

- (id)tableViewCellForItem: (id)v1 atIndexPath: (id)v2
{
	UITableViewCell *cell = %orig;
	id i = [[self itemsInternalDataViewItemAtValidIndexPath: v2] item];
	if([i respondsToSelector: @selector(isPromoted)] && [i performSelector: @selector(isPromoted)]) [cell setHidden: YES];
	return cell;	
}

- (double)tableView: (id)arg1 heightForRowAtIndexPath: (id)arg2
{
	id i = [self itemAtIndexPath: arg2];
	if([i respondsToSelector: @selector(isPromoted)] && [i performSelector: @selector(isPromoted)]) return 0;
	return %orig;
}

%end