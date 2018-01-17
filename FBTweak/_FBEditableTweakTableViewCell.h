/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.
 
 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

#import <UIKit/UIKit.h>

#import "FBTweak.h"
#import "_FBTweakTableViewCell.h"

/**
  @abstract A table cell to edit a tweak.
 */
@interface _FBEditableTweakTableViewCell : UITableViewCell <_FBTweakContainer>

//! @abstract The tweak to show in the cell.
@property (nonatomic, strong, readwrite) id<FBEditableTweak> tweak;

@end
