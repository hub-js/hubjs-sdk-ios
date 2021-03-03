#import "OptOutViewController.h"
#import "HubjsTracker.h"


@interface OptOutViewController ()
@end


@implementation OptOutViewController


- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.optOutSwitch.on = ![HubjsTracker sharedInstance].optOut;
  
}


- (IBAction)sendOptOutAction:(id)sender {
  
  UISwitch *option = (UISwitch*)sender;
  
  if (option.on) {
    
    [HubjsTracker sharedInstance].optOut = NO;
    
  } else {
    
    [HubjsTracker sharedInstance].optOut = YES;
    
  }
  
}


@end
