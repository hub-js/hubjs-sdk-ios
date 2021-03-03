#import <UIKit/UIKit.h>

@interface OptOutViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *optOutSwitch;

- (IBAction)sendOptOutAction:(id)sender;

@end
