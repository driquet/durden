//
//  DurdenAppDelegate.m
//  Durden
//

#import "DurdenAppDelegate.h"
#import "PTHotKeyCenter.h"

@implementation DurdenAppDelegate

@synthesize preferenceWindow = _preferenceWindow;
@synthesize durdenMenu = _durdenMenu;

@synthesize durdenStatusItem;

@synthesize durdenSRHalfLeftControl;
@synthesize durdenSRHalfRightControl;
@synthesize durdenSRHalfTopControl;
@synthesize durdenSRHalfBottomControl;
@synthesize durdenSRBottomLeftControl;
@synthesize durdenSRTopLeftControl;
@synthesize durdenSRTopRightControl;
@synthesize durdenSRBottomRightControl;
@synthesize durdenSRCenterControl;
@synthesize durdenSRFullscreenControl;

@synthesize durdenNSMIHalfLeft;
@synthesize durdenNSMIHalfRight;
@synthesize durdenNSMIHalfTop;
@synthesize durdenNSMIHalfBottom;
@synthesize durdenNSMIBottomLeft;
@synthesize durdenNSMITopLeft;
@synthesize durdenNSMITopRight;
@synthesize durdenNSMIBottomRight;
@synthesize durdenNSMICenter;
@synthesize durdenNSMIFullscreen;

    
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSStatusBar *theBar = [NSStatusBar systemStatusBar];
    
    self.durdenStatusItem = [theBar statusItemWithLength:NSVariableStatusItemLength];
        
    //[self.durdenStatusItem setTitle:@"Durden"];
    [self.durdenStatusItem setImage:[NSImage imageNamed:@"0.png"]];
    [self.durdenStatusItem setHighlightMode:YES];
    [self.durdenStatusItem setMenu:self.durdenMenu];
}


- (void)applicationWillTerminate:(NSNotification *)notification {
}


-(NSAppleScript*)_findScript:(NSString *)name {
    return [[NSAppleScript alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:name withExtension:@"scpt"] error:nil];
}


-(IBAction)moveHalfLeft:(PTHotKey *)hotKey {
    NSAppleScript *script = [self _findScript:@"left"];
    if(script != nil) [script executeAndReturnError:nil];
}

-(IBAction)moveHalfRight:(PTHotKey *)hotKey {
    NSAppleScript *script = [self _findScript:@"right"];
    if(script != nil) [script executeAndReturnError:nil];
}

-(IBAction)moveHalfTop:(PTHotKey *)hotKey {
    NSAppleScript *script = [self _findScript:@"top"];
    if(script != nil) [script executeAndReturnError:nil];
}

-(IBAction)moveHalfBottom:(PTHotKey *)hotKey {
    NSAppleScript *script = [self _findScript:@"bottom"];
    if(script != nil) [script executeAndReturnError:nil];
}

-(IBAction)moveTopLeft:(PTHotKey *)hotKey {
    NSAppleScript *script = [self _findScript:@"topleft"];
    if(script != nil) [script executeAndReturnError:nil];
}
-(IBAction)moveTopRight:(PTHotKey *)hotKey {
    NSAppleScript *script = [self _findScript:@"topright"];
    if(script != nil) [script executeAndReturnError:nil];
}
-(IBAction)moveBottomLeft:(PTHotKey *)hotKey {
    NSAppleScript *script = [self _findScript:@"bottomleft"];
    if(script != nil) [script executeAndReturnError:nil];
}
-(IBAction)moveBottomRight:(PTHotKey *)hotKey {
    NSAppleScript *script = [self _findScript:@"bottomright"];
    if(script != nil) [script executeAndReturnError:nil];
}

-(IBAction)centerWindow:(PTHotKey *)hotKey {
    NSAppleScript *script = [self _findScript:@"center"];
    if(script != nil) [script executeAndReturnError:nil];
}
-(IBAction)fullscreenWindow:(PTHotKey *)hotKey {
    NSAppleScript *script = [self _findScript:@"fullscreen"];
    if(script != nil) [script executeAndReturnError:nil];
}


-(void)_defineGlobalHotKey:(PTHotKey*)hotKey
              forSRControl:(SRRecorderControl*)sr
              withNSMI:(NSMenuItem*)nsmi
                withAction:(SEL)action {
	[sr setCanCaptureGlobalHotKeys:TRUE];
    
    [hotKey setTarget: self];
	[hotKey setAction: action];
    
    if([sr keyComboString] != nil) {
        KeyCombo kc = [sr keyCombo];
        [nsmi setKeyEquivalent:[SRStringForKeyCode(kc.code) lowercaseString]];
        [nsmi setKeyEquivalentModifierMask:kc.flags];
    } else {
        [nsmi setKeyEquivalent:@""];
        [nsmi setKeyEquivalentModifierMask:0];
    }
	
	[[PTHotKeyCenter sharedCenter] registerHotKey: hotKey];    
}

- (IBAction)defineHalfTopGlobalHotKey:(id)sender {
    
	if (globalHalfTop != nil) {
		[[PTHotKeyCenter sharedCenter] unregisterHotKey: globalHalfTop];
		[globalHalfTop release];
		globalHalfTop = nil;
	}
    
	globalHalfTop = [[PTHotKey alloc] initWithIdentifier:@"DurdenHalfTop"
                                                keyCombo:[PTKeyCombo keyComboWithKeyCode:[durdenSRHalfTopControl keyCombo].code
                                                                               modifiers:[durdenSRHalfTopControl cocoaToCarbonFlags: [durdenSRHalfTopControl keyCombo].flags]]];

	[self _defineGlobalHotKey:globalHalfTop
                 forSRControl:durdenSRHalfTopControl
                     withNSMI:durdenNSMIHalfTop
                   withAction:@selector(moveHalfTop:)];
}

- (IBAction)defineHalfBottomGlobalHotKey:(id)sender {
    
	if (globalHalfBottom != nil) {
		[[PTHotKeyCenter sharedCenter] unregisterHotKey: globalHalfBottom];
		[globalHalfBottom release];
		globalHalfBottom = nil;
	}
    
	globalHalfBottom = [[PTHotKey alloc] initWithIdentifier:@"DurdenHalfBottom"
                                                keyCombo:[PTKeyCombo keyComboWithKeyCode:[durdenSRHalfBottomControl keyCombo].code
                                                                               modifiers:[durdenSRHalfBottomControl cocoaToCarbonFlags: [durdenSRHalfBottomControl keyCombo].flags]]];

	[self _defineGlobalHotKey:globalHalfBottom
                 forSRControl:durdenSRHalfBottomControl
                     withNSMI:durdenNSMIHalfBottom
                   withAction:@selector(moveHalfBottom:)];
}

- (IBAction)defineHalfLeftGlobalHotKey:(id)sender {
    
	if (globalHalfLeft != nil) {
		[[PTHotKeyCenter sharedCenter] unregisterHotKey: globalHalfLeft];
		[globalHalfLeft release];
		globalHalfLeft = nil;
	}
    
	globalHalfLeft = [[PTHotKey alloc] initWithIdentifier:@"DurdenHalfLeft"
                                                   keyCombo:[PTKeyCombo keyComboWithKeyCode:[durdenSRHalfLeftControl keyCombo].code
                                                                                  modifiers:[durdenSRHalfLeftControl cocoaToCarbonFlags: [durdenSRHalfLeftControl keyCombo].flags]]];
  
	[self _defineGlobalHotKey:globalHalfLeft
                 forSRControl:durdenSRHalfLeftControl
                     withNSMI:durdenNSMIHalfLeft
                   withAction:@selector(moveHalfLeft:)];
}

- (IBAction)defineHalfRightGlobalHotKey:(id)sender {
    
	if (globalHalfRight != nil) {
		[[PTHotKeyCenter sharedCenter] unregisterHotKey: globalHalfRight];
		[globalHalfRight release];
		globalHalfRight = nil;
	}
    
	globalHalfRight = [[PTHotKey alloc] initWithIdentifier:@"DurdenHalfRight"
                                                 keyCombo:[PTKeyCombo keyComboWithKeyCode:[durdenSRHalfRightControl keyCombo].code
                                                                                modifiers:[durdenSRHalfRightControl cocoaToCarbonFlags: [durdenSRHalfRightControl keyCombo].flags]]];

	[self _defineGlobalHotKey:globalHalfRight
                 forSRControl:durdenSRHalfRightControl
                     withNSMI:durdenNSMIHalfRight
                   withAction:@selector(moveHalfRight:)];
}




- (IBAction)defineBottomLeftGlobalHotKey:(id)sender {
    
	if (globalBottomLeft != nil) {
		[[PTHotKeyCenter sharedCenter] unregisterHotKey: globalBottomLeft];
		[globalBottomLeft release];
		globalBottomLeft = nil;
	}
    
	globalBottomLeft = [[PTHotKey alloc] initWithIdentifier:@"DurdenBottomLeft"
                                                keyCombo:[PTKeyCombo keyComboWithKeyCode:[durdenSRBottomLeftControl keyCombo].code
                                                                               modifiers:[durdenSRBottomLeftControl cocoaToCarbonFlags: [durdenSRBottomLeftControl keyCombo].flags]]];

	[self _defineGlobalHotKey:globalBottomLeft
                 forSRControl:durdenSRBottomLeftControl
                     withNSMI:durdenNSMIBottomLeft
                   withAction:@selector(moveBottomLeft:)];
}

- (IBAction)defineTopLeftGlobalHotKey:(id)sender {
    
	if (globalTopLeft != nil) {
		[[PTHotKeyCenter sharedCenter] unregisterHotKey: globalTopLeft];
		[globalTopLeft release];
		globalTopLeft = nil;
	}
    
	globalTopLeft = [[PTHotKey alloc] initWithIdentifier:@"DurdenTopLeft"
                                                   keyCombo:[PTKeyCombo keyComboWithKeyCode:[durdenSRTopLeftControl keyCombo].code
                                                                                  modifiers:[durdenSRTopLeftControl cocoaToCarbonFlags: [durdenSRTopLeftControl keyCombo].flags]]];

	[self _defineGlobalHotKey:globalTopLeft
                 forSRControl:durdenSRTopLeftControl
                     withNSMI:durdenNSMITopLeft
                   withAction:@selector(moveTopLeft:)];
}

- (IBAction)defineTopRightGlobalHotKey:(id)sender {
    
	if (globalTopRight != nil) {
		[[PTHotKeyCenter sharedCenter] unregisterHotKey: globalTopRight];
		[globalTopRight release];
		globalTopRight = nil;
	}
    
	globalTopRight = [[PTHotKey alloc] initWithIdentifier:@"DurdenTopRight"
                                                keyCombo:[PTKeyCombo keyComboWithKeyCode:[durdenSRTopRightControl keyCombo].code
                                                                               modifiers:[durdenSRTopRightControl cocoaToCarbonFlags: [durdenSRTopRightControl keyCombo].flags]]];

	[self _defineGlobalHotKey:globalTopRight
                 forSRControl:durdenSRTopRightControl
                     withNSMI:durdenNSMITopRight
                   withAction:@selector(moveTopRight:)];
}

- (IBAction)defineBottomRightGlobalHotKey:(id)sender {
    
	if (globalBottomRight != nil) {
		[[PTHotKeyCenter sharedCenter] unregisterHotKey: globalBottomRight];
		[globalBottomRight release];
		globalBottomRight = nil;
	}
    
	globalBottomRight = [[PTHotKey alloc] initWithIdentifier:@"DurdenBottomRight"
                                                 keyCombo:[PTKeyCombo keyComboWithKeyCode:[durdenSRBottomRightControl keyCombo].code
                                                                                modifiers:[durdenSRBottomRightControl cocoaToCarbonFlags: [durdenSRBottomRightControl keyCombo].flags]]];
 
	[self _defineGlobalHotKey:globalBottomRight
                 forSRControl:durdenSRBottomRightControl
                     withNSMI:durdenNSMIBottomRight
                   withAction:@selector(moveBottomRight:)];
}

- (IBAction)defineCenterGlobalHotKey:(id)sender {
    
	if (globalCenter != nil) {
		[[PTHotKeyCenter sharedCenter] unregisterHotKey: globalCenter];
		[globalCenter release];
		globalCenter = nil;
	}
    
	globalCenter = [[PTHotKey alloc] initWithIdentifier:@"DurdenCenter"
                                                    keyCombo:[PTKeyCombo keyComboWithKeyCode:[durdenSRCenterControl keyCombo].code
                                                                                   modifiers:[durdenSRCenterControl cocoaToCarbonFlags: [durdenSRCenterControl keyCombo].flags]]];

	[self _defineGlobalHotKey:globalCenter
                 forSRControl:durdenSRCenterControl
                     withNSMI:durdenNSMICenter
                   withAction:@selector(centerWindow:)];
}

- (IBAction)defineFullscreenGlobalHotKey:(id)sender {
    
	if (globalFullscreen != nil) {
		[[PTHotKeyCenter sharedCenter] unregisterHotKey: globalFullscreen];
		[globalFullscreen release];
		globalFullscreen = nil;
	}
    
	globalFullscreen = [[PTHotKey alloc] initWithIdentifier:@"DurdenFullscreen"
                                               keyCombo:[PTKeyCombo keyComboWithKeyCode:[durdenSRFullscreenControl keyCombo].code
                                                                              modifiers:[durdenSRFullscreenControl cocoaToCarbonFlags: [durdenSRFullscreenControl keyCombo].flags]]];

	[self _defineGlobalHotKey:globalFullscreen
                 forSRControl:durdenSRFullscreenControl
                     withNSMI:durdenNSMIFullscreen
                   withAction:@selector(fullscreenWindow:)];
}


- (void)shortcutRecorder:(SRRecorderControl *)aRecorder keyComboDidChange:(KeyCombo)newKeyCombo {
	if (aRecorder == durdenSRHalfBottomControl) [self defineHalfBottomGlobalHotKey: aRecorder];
    else if(aRecorder == durdenSRHalfTopControl) [self defineHalfTopGlobalHotKey: aRecorder];
    else if(aRecorder == durdenSRHalfLeftControl) [self defineHalfLeftGlobalHotKey: aRecorder];
    else if(aRecorder == durdenSRHalfRightControl) [self defineHalfRightGlobalHotKey: aRecorder];
    else if (aRecorder == durdenSRBottomLeftControl) [self defineBottomLeftGlobalHotKey: aRecorder];
    else if(aRecorder == durdenSRTopLeftControl) [self defineTopLeftGlobalHotKey: aRecorder];
    else if(aRecorder == durdenSRTopRightControl) [self defineTopRightGlobalHotKey: aRecorder];
    else if(aRecorder == durdenSRBottomRightControl) [self defineBottomRightGlobalHotKey: aRecorder];
    else if(aRecorder == durdenSRCenterControl) [self defineCenterGlobalHotKey: aRecorder];
    else if(aRecorder == durdenSRFullscreenControl) [self defineFullscreenGlobalHotKey: aRecorder];
}




/*
- (void)hitHotKey:(PTHotKey *)hotKey {
	NSMutableAttributedString *logString = [globalHotKeyLogView textStorage];
	[[logString mutableString] appendString: [NSString stringWithFormat: @"%@ pressed. \n", [durdenSRControl keyComboString]]];
	[globalHotKeyLogView scrollPoint: NSMakePoint(0, [globalHotKeyLogView frame].size.height)];
}
 */




@end
