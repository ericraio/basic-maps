#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface AppController : NSObject

@property (assign) IBOutlet NSView* customView;
@property (assign) IBOutlet NSTextField* nameTextField;
- (IBAction)setLocation:(id)aSender;
@end


@implementation AppController
@end
