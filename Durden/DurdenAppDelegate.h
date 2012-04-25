//
//  DurdenAppDelegate.h
//  Durden
//


#import <Cocoa/Cocoa.h>
#import "ShortcutRecorder/ShortcutRecorder.h"
#import "PTHotKey.h"

@interface DurdenAppDelegate : NSObject <NSApplicationDelegate> {
	PTHotKey *globalHalfLeft;
	PTHotKey *globalHalfRight;
	PTHotKey *globalHalfTop;
	PTHotKey *globalHalfBottom;
	PTHotKey *globalBottomLeft;
	PTHotKey *globalTopLeft;
	PTHotKey *globalTopRight;
	PTHotKey *globalBottomRight;
	PTHotKey *globalCenter;
	PTHotKey *globalFullscreen;
}

@property (assign) IBOutlet NSWindow *preferenceWindow;
@property (assign) IBOutlet NSMenu *durdenMenu;

@property (assign) IBOutlet SRRecorderControl *durdenSRHalfLeftControl;
@property (assign) IBOutlet SRRecorderControl *durdenSRHalfRightControl;
@property (assign) IBOutlet SRRecorderControl *durdenSRHalfTopControl;
@property (assign) IBOutlet SRRecorderControl *durdenSRHalfBottomControl;
@property (assign) IBOutlet SRRecorderControl *durdenSRBottomLeftControl;
@property (assign) IBOutlet SRRecorderControl *durdenSRTopLeftControl;
@property (assign) IBOutlet SRRecorderControl *durdenSRTopRightControl;
@property (assign) IBOutlet SRRecorderControl *durdenSRBottomRightControl;
@property (assign) IBOutlet SRRecorderControl *durdenSRCenterControl;
@property (assign) IBOutlet SRRecorderControl *durdenSRFullscreenControl;

@property (retain) NSStatusItem *durdenStatusItem;




-(IBAction)moveHalfLeft:(id)sender;
-(IBAction)moveHalfRight:(id)sender;
-(IBAction)moveHalfTop:(id)sender;
-(IBAction)moveHalfBottom:(id)sender;

-(IBAction)moveTopLeft:(id)sender;
-(IBAction)moveTopRight:(id)sender;
-(IBAction)moveBottomLeft:(id)sender;
-(IBAction)moveBottomRight:(id)sender;

-(IBAction)centerWindow:(id)sender;
-(IBAction)fullscreenWindow:(id)sender;


@end
