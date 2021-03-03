#import "EcommerceViewController.h"
#import "HubjsTransaction.h"
#import "HubjsTransactionBuilder.h"
#import "HubjsTracker.h"


static NSUInteger const ItemPrice = 1;


@implementation EcommerceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}


- (void)viewDidLoad {
  [super viewDidLoad];
  
  [[HubjsTracker sharedInstance] sendViews:@"menu", @"transaction", nil];
  
  // Start with one items
  self.numberOfItemsTextField.text = @"1";
  
  [self calculateCost];
  
}


- (IBAction)stepNumberOfItemsAction:(UIStepper *)sender {
  
  self.numberOfItemsTextField.text = [NSString stringWithFormat:@"%.0f", sender.value];
  
  [self calculateCost];
  
}


- (IBAction)purchaseAction:(id)sender {
  
  HubjsTransaction *transaction = [HubjsTransaction transactionWithBuilder:^(HubjsTransactionBuilder *builder) {

    builder.identifier = [NSString stringWithFormat:@"Trans-%d", arc4random_uniform(1000)];
    builder.grandTotal = @([self.totalCostLabel.text floatValue]);
    builder.tax = @([self.taxLabel.text floatValue]);
    builder.shippingCost = @([self.shippingCostLabel.text floatValue]);
    builder.discount = nil;
    builder.subTotal = @([builder.grandTotal floatValue] - [builder.shippingCost floatValue]);
    
    //[builder addItemWithSku:@"SKU123"];
    

    [builder addItemWithSku:@"SKU123"
                       name:@"Cookies"
                    category:@"Food"
                       price:1.0
                    quantity:[self.numberOfItemsTextField.text integerValue]];

  }];
  
  [[HubjsTracker sharedInstance] sendTransaction:transaction];
}


- (void)calculateCost {
  
  int numberOfItems = (int)[self.numberOfItemsTextField.text integerValue];
  
  int totalCost = numberOfItems * ItemPrice;
  
  self.totalCostLabel.text = [NSString stringWithFormat:@"%d", totalCost];
  self.taxLabel.text = [NSString stringWithFormat:@"%.1f", totalCost * 0.3];
  self.shippingCostLabel.text = [NSString stringWithFormat:@"%.1f", MAX(1, (numberOfItems / 3)) * 0.1];
  
}



@end
