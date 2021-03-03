@import HubjsTracker;

#import "ObjectiveCCompatibilityChecker.h"

@implementation ObjectiveCCompatibilityChecker

- (void)check {
    HubjsTracker *hubjsTracker = [[HubjsTracker alloc] initWithSiteId:@"5" baseURL:[NSURL URLWithString:@"http://example.com/tracking.php"] userAgent:nil];
    [hubjsTracker trackWithView:@[@"example"] url:nil];
    [hubjsTracker trackWithEventWithCategory:@"category" action:@"action" name:nil number:nil url:nil];
    [hubjsTracker trackSearchWithQuery:@"custom search string" category:@"custom search category" resultCount:15 url:nil];
    [hubjsTracker dispatch];
    hubjsTracker.logger = [[DefaultLogger alloc] initWithMinLevel:LogLevelVerbose];
    [hubjsTracker trackCampaignWithName:@"campaign_name" keyword:@"campaign_keyword"];
    hubjsTracker.userId = @"Just a custom id";
}

- (void)checkDeprecated {
    HubjsTracker *hubjsTracker = [[HubjsTracker alloc] initWithSiteId:@"5" baseURL:[NSURL URLWithString:@"http://example.com/tracking.php"] userAgent:nil];
    [hubjsTracker trackWithEventWithCategory:@"category" action:@"action" name:nil number:nil url:nil];
}

@end
