/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.

 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

#import <UIKit/UIKit.h>

@protocol FBEditableTweak;

/**
  @abstract Displays a view to edit a tweak with color value.
 */
@interface _FBEditableTweakColorViewController : UIViewController

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil NS_UNAVAILABLE;

/**
  @abstract Create a RGB view controller.
  @param tweak The tweak with color value to edit.
 */
- (instancetype)initWithEditableTweak:(id<FBEditableTweak>)tweak NS_DESIGNATED_INITIALIZER;

//! @abstract The color tweak to display in the view controller.
@property (nonatomic, strong, readonly) id<FBEditableTweak>tweak;

@end
