//
//  DurdenWindowController.m
//  Durden
//
//  Created by Arnaud Fontaine on 26/04/12.
//  Copyright (c) 2012 INRIA. All rights reserved.
//

#import "DurdenWindowController.h"

@interface DurdenWindowController ()

@end

@implementation DurdenWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

-(IBAction)showWindow:(id)sender {
    [[NSApplication sharedApplication] activateIgnoringOtherApps:TRUE];
    [super showWindow:sender];
}

@end
