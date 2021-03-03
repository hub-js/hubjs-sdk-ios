#import "SocialViewController.h"
#import "HubjsTracker.h"


@interface SocialViewController ()
@end


@implementation SocialViewController


- (IBAction)sendSocialInteractionAction:(id)sender {
  
  // Send social interacations to Hubjs
  [[HubjsTracker sharedInstance] sendSocialInteraction:@"like" target:@"Hubjs app" forNetwork:@"Facebook"];
    
}


@end
