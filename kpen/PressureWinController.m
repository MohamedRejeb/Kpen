///////////////////////////////////////////////////////////////////////////////
//
// DESCRIPTION
//     Implementation file for PressureWinController class.
//
// COPYRIGHT
//    Copyright (c) 2001 - 2020 Wacom Co., Ltd.
//    All rights reserved
//
///////////////////////////////////////////////////////////////////////////////

#import "PressureWinController.h"
#import "WTView.h"

@implementation PressureWinController

- (id) init
{
    self = [super init];
    if (self)
    {
        // Initialization code here.
        
        // Must want to know when WTCView's data has been updated
        [[NSNotificationCenter defaultCenter] addObserver:self
               selector:@selector(wtvUpdatedStats:)
               name:WTViewUpdatedNotification
               object:wtvTabletDraw];
    }
    return self;
}

///////////////////////////////////////////////////////////////////////////////

- (void) awakeFromNib
{
   [wtvTabletDraw setForeColor:[clrForeColor color]];
   
   // Set check marks of Pressure Menu Items
   if ([wtvTabletDraw mAdjustOpacity])
   {
       [mnuOpacity setState:NSControlStateValueOn];
   }
   else
   {
      [mnuOpacity setState:NSControlStateValueOn];
   }
   
   if ([wtvTabletDraw mAdjustSize])
   {
       [mnuOpacity setState:NSControlStateValueOn];
   }
   else
   {
       [mnuLineSize setState:NSControlStateValueOff];
   }
   
   // Set check marks for Events menu
   if ([wtvTabletDraw mCaptureMouseMoves])
   {
       [mnuCaptureMouseMoves setState:NSControlStateValueOn];
   }
   else
   {
       [mnuCaptureMouseMoves setState:NSControlStateValueOff];
   }
   
   if ([wtvTabletDraw mUpdateStatsDuringDrag])
   {
       [mnuUpdateStatsDuringDrag setState:NSControlStateValueOn];
   }
   else
   {
       [mnuUpdateStatsDuringDrag setState:NSControlStateValueOff];
   }
}

///////////////////////////////////////////////////////////////////////////////

- (IBAction) opacityMenuAction:(id)sender_I
{
    if([sender_I state] == NSControlStateValueOn)
   {
       [sender_I setState:NSControlStateValueOff];
      [wtvTabletDraw setAdjustOpacity:NO];
   }
   else
   {
       [sender_I setState:NSControlStateValueOn];
      [wtvTabletDraw setAdjustOpacity:YES];
   }
}

///////////////////////////////////////////////////////////////////////////////

- (IBAction) lineSizeMenuAction:(id)sender_I
{
    if([sender_I state] == NSControlStateValueOn)
   {
       [sender_I setState:NSControlStateValueOff];
      [wtvTabletDraw setAdjustSize:NO];
   }
   else
   {
       [sender_I setState:NSControlStateValueOn];
      [wtvTabletDraw setAdjustSize:YES];
   }
}

///////////////////////////////////////////////////////////////////////////////

- (IBAction) captureMouseMovesAction:(id)sender_I
{
    if([sender_I state] == NSControlStateValueOn)
   {
       [sender_I setState:NSControlStateValueOff];
      [wtvTabletDraw setCaptureMouseMoves:NO];
   }
   else
   {
       [sender_I setState:NSControlStateValueOn];
      [wtvTabletDraw setCaptureMouseMoves:YES];
   }
}

///////////////////////////////////////////////////////////////////////////////

- (IBAction) updateStatsDuringDragAction:(id)sender_I
{
    if([sender_I state] == NSControlStateValueOn)
   {
       [sender_I setState:NSControlStateValueOff];
      [wtvTabletDraw setUpdateStatsDuringDrag:NO];
   }
   else
   {
       [sender_I setState:NSControlStateValueOn];
      [wtvTabletDraw setUpdateStatsDuringDrag:YES];
   }
}

///////////////////////////////////////////////////////////////////////////////

- (IBAction) openColorPanel:(id)sender_I
{
   [sender_I activate:NO];
}

///////////////////////////////////////////////////////////////////////////////

- (IBAction) changeColor:(id)sender
{
   [wtvTabletDraw setForeColor: [sender color]];
}

///////////////////////////////////////////////////////////////////////////////

-(void) wtvUpdatedStats:(NSNotification *)theNotification_I
{
#pragma unused(theNotification_I)

   switch([wtvTabletDraw mEventType])
   {
        case NSEventTypeLeftMouseDown:
        case NSEventTypeRightMouseDown:
         [txtEventType setStringValue:@"Mouse Down"];
      break;
      
        case NSEventTypeLeftMouseUp:
        case NSEventTypeRightMouseUp:
         [txtEventType setStringValue:@"Mouse Up"];
      break;
      
        case NSEventTypeLeftMouseDragged:
        case NSEventTypeRightMouseDragged:
         [txtEventType setStringValue:@"Mouse Drag"];
      break;
      
        case NSEventTypeMouseMoved:
         [txtEventType setStringValue:@"Mouse Move"];
      break;
   }
   
   [txtDeviceID setIntValue:[wtvTabletDraw mDeviceID]];
   [txtMouseX setFloatValue:[wtvTabletDraw mMouseX]];
   [txtMouseY setFloatValue:[wtvTabletDraw mMouseY]];
   [txtPressure setFloatValue:[wtvTabletDraw mPressure]];
   [txtRawTabletPressure setFloatValue:[wtvTabletDraw mTabletRawPressure]];
   [txtScaledTabletPressure setFloatValue:[wtvTabletDraw mTabletScaledPressure]];
   [txtAbsoulteX setIntValue:[wtvTabletDraw mAbsX]];
   [txtAbsoulteY setIntValue:[wtvTabletDraw mAbsY]];
   [txtTiltX setFloatValue:[wtvTabletDraw mTiltX]];
   [txtTiltY setFloatValue:[wtvTabletDraw mTiltY]];
   [txtRotationDegrees setFloatValue:[wtvTabletDraw mRotDeg]];
   [txtRotationRadians setFloatValue:[wtvTabletDraw mRotRad]];
   
   [clrForeColor setColor:[wtvTabletDraw mForeColor]];
}
@end
