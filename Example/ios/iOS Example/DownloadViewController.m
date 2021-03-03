#import "DownloadViewController.h"
#import "HubjsTracker.h"

@implementation DownloadViewController

- (IBAction)downloadAction:(id)sender {

  [[HubjsTracker sharedInstance] sendDownload:@"http://dn.se/some/content/image.png"];
  
}

@end
