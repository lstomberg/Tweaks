/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.

 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

#import <UIKit/UIKit.h>

@protocol FBTweak;

@protocol _FBTweakContainer

//! @abstract The tweak held by the container.
@property (nonatomic, strong, readwrite) id<FBTweak> tweak;

@end

/**
 @abstract A table cell to show a non-editable tweak.
 */
@interface _FBTweakTableViewCell : UITableViewCell <_FBTweakContainer>

- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end

