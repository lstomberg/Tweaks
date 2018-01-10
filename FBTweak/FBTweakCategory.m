/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.
 
 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

#import "FBTweak.h"
#import "FBTweakCategory.h"
#import "FBTweakCollection.h"

@implementation FBTweakCategory {
  NSMutableArray *_orderedCollections;
  NSMutableDictionary *_namedCollections;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
  NSString *name = [coder decodeObjectForKey:@"name"];
  NSArray<FBTweakCollection *> *collections = [coder decodeObjectForKey:@"collections"];

  return [self initWithName:name tweakCollections:collections];
}

- (instancetype)initWithName:(NSString *)name
{
  return [self initWithName:name tweakCollections:@[]];
}

- (instancetype)initWithName:(NSString *)name
            tweakCollections:(NSArray<FBTweakCollection *> *)tweakCollections {
  if ((self = [super init])) {
    _name = [name copy];
    self.tweakCollections = tweakCollections;
  }
  return self;
}

- (void)setTweakCollections:(NSArray<FBTweakCollection *> *)tweakCollections {
  _orderedCollections = [tweakCollections mutableCopy];
  _namedCollections = [[NSMutableDictionary alloc] initWithCapacity:4];
  for (FBTweakCollection *tweakCollection in _orderedCollections) {
    [_namedCollections setObject:tweakCollection forKey:tweakCollection.name];
  }
}

- (void)encodeWithCoder:(NSCoder *)coder
{
  [coder encodeObject:_name forKey:@"name"];
  [coder encodeObject:_orderedCollections forKey:@"collections"];
}

- (FBTweakCollection *)tweakCollectionWithName:(NSString *)name
{
  return _namedCollections[name];
}

- (NSArray *)tweakCollections
{
  return [_orderedCollections copy];
}

- (void)addTweakCollection:(FBTweakCollection *)tweakCollection
{
  [_orderedCollections addObject:tweakCollection];
  [_namedCollections setObject:tweakCollection forKey:tweakCollection.name];
}

- (void)removeTweakCollection:(FBTweakCollection *)tweakCollection
{
  [_orderedCollections removeObject:tweakCollection];
  [_namedCollections removeObjectForKey:tweakCollection.name];
}

- (void)reset {
  for (FBTweakCollection *collection in self.tweakCollections) {
    for (FBTweak *tweak in collection.tweaks) {
      if (!tweak.isAction) {
        tweak.currentValue = nil;
      }
    }
  }
}

- (void)updateWithCompletion:(FBTweakCategoryUpdateBlock)completion {
  completion(nil);
}

@end
