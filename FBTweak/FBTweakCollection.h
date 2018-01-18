/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.
 
 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FBTweak;

/**
 @abstract A named collection of Tweaks.
 */
@interface FBTweakCollection : NSObject

- (instancetype)init NS_UNAVAILABLE;

/**
 @abstract Creates an empty Tweak collection.
 */
- (instancetype)initWithName:(NSString *)name;

/**
 @abstract Creates a tweak category with an initial Tweak array.
 */
- (instancetype)initWithName:(NSString *)name tweaks:(NSArray<id<FBTweak>> *)tweaks NS_DESIGNATED_INITIALIZER;

/**
 @abstract The name of the collection.
 */
@property (readonly, nonatomic) NSString *name;

/**
 @abstract The Tweaks contained in this collection.
 */
@property (readonly, nonatomic) NSArray<id<FBTweak>> *tweaks;

/**
 @abstract Fetches a Tweak by identifier. Returns \c nil no Tweak with \c identifier can be found.
 @param Identifier The Tweak identifier to find.
 */
- (id<FBTweak> _Nullable)tweakWithIdentifier:(NSString *)identifier;

/**
 @abstract Adds a Tweak to the collection.
 @param tweak The Tweak to add.
 */
- (void)addTweak:(id<FBTweak>)tweak;

/**
 @abstract Removes a Tweak from the collection.
 @param tweak The Tweak to remove.
 */
- (void)removeTweak:(id<FBTweak>)tweak;

@end

NS_ASSUME_NONNULL_END
