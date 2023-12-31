///////////////////////////////////////////////////////////////////////////////
//
// DESCRIPTION
//     your basic useful enums and defines
//
// COPYRIGHT
//    Copyright (c) 2001 - 2020 Wacom Co., Ltd.
//    All rights reserved
//
///////////////////////////////////////////////////////////////////////////////

enum EPointerType
{
    eUnknown = 0,        // should never happen
    ePen,                    // tip end of a stylus like device
    eCursor,                // any puck like device
    eEraser                // eraser end of a stylus like device
};

// capabilities masks
// Use these masks with the capabilities field of a proximity
// event to determine what fields in a Tablet Event are valid
// for this device.
#define        kTransducerDeviceIdBitMask                 0x0001
#define        kTransducerAbsXBitMask                         0x0002
#define        kTransducerAbsYBitMask                         0x0004
#define        kTransducerVendor1BitMask                    0x0008
#define        kTransducerVendor2BitMask                     0x0010
#define        kTransducerVendor3BitMask                     0x0020
#define        kTransducerButtonsBitMask                    0x0040
#define        kTransducerTiltXBitMask                     0x0080
#define        kTransducerTiltYBitMask                     0x0100
#define        kTransducerAbsZBitMask                         0x0200
#define        kTransducerPressureBitMask                     0x0400
#define        kTransducerTangentialPressureBitMask     0x0800
#define        kTransducerOrientInfoBitMask                 0x1000
#define        kTransducerRotationBitMask                     0x2000

///////////////////////////////////////////////////////////////////////////////
//    The following is a list of the old capability masks constant names and a
//  description of what has happened to them.
//    Some of them have only changed in name, and not in value and are listed as
//  a #defined to the new name.
//

//#define        kTransducerContextIdBitMask         kTransducerDeviceIdBitMask

// kTransducerContextStatusBitMask
// This mask had no relevence to the Tablet Event structure and should not be used.
// The old value of this mask is now used by kTransducerAbsXBitMask
                                     
// kTransducerTimeStampBitMask
// This mask had no relevence to the Tablet Event structure and should not be used.
// The old value of this mask is now used by kTransducerAbsYBitMask

// kTransducerItemsChangedBitMask
// This mask had no relevence to the Tablet Event structure and should not be used.
// The old value of this mask is now used by kTransducerVendor1BitMask
                                      
// kTransducerPacketSerialNumBitMask
// This mask had no relevence to the Tablet Event structure and should not be used.
// The old value of this mask is now used by kTransducerVendor2BitMask

// kTransducerCursorIndexBitMask
// This mask had no relevence to the Tablet Event structure and should not be used.
// The old value of this mask is now used by kTransducerVendor3BitMask

// kTransducerXAxisBitMask
// The value of this mask has changed to kTransducerAbsXBitMask
// The old value is now used by kTransducerTiltXBitMask

// kTransducerYAxisBitMask
// The value of this mask has changed to kTransducerAbsYBitMask
// The old value is now used by kTransducerTiltYBitMask

// kTransducerOrientInfoBitMask
// You really should start using kTransducerTiltXBitMask & kTransducerTiltXBitMask
// However kTransducerOrientInfoBitMask does still exist with the same value so that
// already shipping applications will still work.


//#define        kTransducerButtonStatesBitMask         kTransducerButtonsBitMaskk
//#define        kTransducerZAxisBitMask                 kTransducerAbsZBitMask
//#define        kTransducerTipPressureBitMask         kTransducerPressureBitMask
//#define        kTransducerBarrelPressureBitMask     kTransducerTangentialPressureBitMask
