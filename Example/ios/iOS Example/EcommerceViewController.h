#import <UIKit/UIKit.h>

@interface EcommerceViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *numberOfItemsTextField;
@property (weak, nonatomic) IBOutlet UILabel *totalCostLabel;
@property (weak, nonatomic) IBOutlet UILabel *taxLabel;
@property (weak, nonatomic) IBOutlet UILabel *shippingCostLabel;


- (IBAction)stepNumberOfItemsAction:(UIStepper *)sender;
- (IBAction)purchaseAction:(id)sender;

@end
