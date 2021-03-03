#import "ExceptionViewController.h"
#import "HubjsTracker.h"


@interface ExceptionViewController ()
@end


@implementation ExceptionViewController


- (IBAction)sendExceptionAction:(id)sender {
  
  // Send an exception event to the Hubjs server
  [[HubjsTracker sharedInstance] sendExceptionWithDescription:@"Send a fake exception from my app" isFatal:NO];
  
}


@end
