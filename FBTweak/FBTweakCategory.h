/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.
 
 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class FBTweakCollection;

/// Block to be called when a category update operation has been completed.
typedef void (^FBTweakCategoryUpdateBlock)(NSError * _Nullable error);

/**
  @abstract A named grouping of collections.
 */
@interface FBTweakCategory : NSObject <NSCoding>

- (instancetype)init NS_UNAVAILABLE;

/**
  @abstract Creates a tweak category.
 */
- (instancetype)initWithName:(NSString *)name;

/**
 @abstract Creates a tweak category with an initial tweak collections.
 */
- (instancetype)initWithName:(NSString *)name tweakCollections:(NSArray<FBTweakCollection *> *)tweakCollections NS_DESIGNATED_INITIALIZER;

/**
  @abstract The name of the category.
 */
@property (nonatomic, copy, readonly) NSString *name;

/**
  @abstract The collections contained in this category.
 */
@property (nonatomic, copy) NSArray<FBTweakCollection *> *tweakCollections;

/**
  @abstract Fetches a collection by name.
  @param name The collection name to find.
 */
- (FBTweakCollection * _Nullable)tweakCollectionWithName:(NSString *)name;

/**
 @abstract Adds a tweak collection to the category.
 @param tweakCollection The tweak collection to add.
 */
- (void)addTweakCollection:(FBTweakCollection *)tweakCollection;

/**
 @abstract Removes a tweak collection from the category.
 @param tweakCollection The tweak collection to remove.
 */
- (void)removeTweakCollection:(FBTweakCollection *)tweakCollection;

/**
 @abstract Resets all tweaks in \c tweakCollections to their default value.
 */
- (void)reset;

/**
 @abstract Asynchronously updates \c tweakCollections to the latest value, and calls \c completion
 when done. Error is reported by the means of \c completion's \c error argument, which is set upon
 an error or \c nil otherwise.
 @param completion Completion block to be called when the update is complete.
 @discussion When the update operation is complete, is it expected that the \c tweakCollection will
 be up-to-date.
 */
- (void)updateWithCompletion:(FBTweakCategoryUpdateBlock)completion;

@end

NS_ASSUME_NONNULL_END
