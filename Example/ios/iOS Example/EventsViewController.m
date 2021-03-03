#import "EventsViewController.h"
#import "HubjsTracker.h"


@interface EventsViewController ()
@end


@implementation EventsViewController


- (void)viewDidLoad {
  [super viewDidLoad];
  
  [[HubjsTracker sharedInstance] sendViews:@"menu", @"events", nil];
}


- (IBAction)sendEventAction:(id)sender {
  
  // Send a custom event tp Hubjs  
  [[HubjsTracker sharedInstance] sendEventWithCategory:@"TestCategory" action:@"Play" name:@"Song12" value:@(2)];
  
}


@end
