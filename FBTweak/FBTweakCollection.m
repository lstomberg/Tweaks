/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.
 
 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

#import "FBTweakCollection.h"
#import "FBTweak.h"

NS_ASSUME_NONNULL_BEGIN

@implementation FBTweakCollection {
  NSMutableArray<id<FBTweak>> *_orderedTweaks;
  NSMutableDictionary<NSString *, id<FBTweak>> *_identifierTweaks;
}

- (instancetype)initWithName:(NSString *)name {
  return [self initWithName:name tweaks:@[]];
}

- (instancetype)initWithName:(NSString *)name tweaks:(NSArray<id<FBTweak>> *)tweaks {
  if ((self = [super init])) {
    _name = [name copy];
    _orderedTweaks = [tweaks mutableCopy];
    _identifierTweaks = [NSMutableDictionary dictionary];

    for (id<FBTweak> tweak in _orderedTweaks) {
      [_identifierTweaks setObject:tweak forKey:tweak.identifier];
    }
  }

  return self;
}

- (id<FBTweak> _Nullable)tweakWithIdentifier:(NSString *)identifier {
  return _identifierTweaks[identifier];
}

- (NSArray<id<FBTweak>> *)tweaks {
  return [_orderedTweaks copy];
}

- (void)addTweak:(id<FBTweak>)tweak {
  [_orderedTweaks addObject:tweak];
  [_identifierTweaks setObject:tweak forKey:tweak.identifier];
}

- (void)removeTweak:(id<FBTweak>)tweak {
  [_orderedTweaks removeObject:tweak];
  [_identifierTweaks removeObjectForKey:tweak.identifier];
}

@end

NS_ASSUME_NONNULL_END
