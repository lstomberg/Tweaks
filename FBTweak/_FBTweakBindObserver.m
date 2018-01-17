/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.
 
 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

#import <objc/runtime.h>

#import "FBTweak.h"
#import "_FBTweakBindObserver.h"

static NSString * const kFBTweakCurrentValueKeyPath = @"tweak.currentValue";

@implementation _FBTweakBindObserver {
  id<FBTweak> _tweak;
  _FBTweakBindObserverBlock _block;
  __weak id _object;
}

- (instancetype)initWithTweak:(id<FBTweak>)tweak block:(_FBTweakBindObserverBlock)block
{
  if ((self = [super init])) {
    NSAssert(tweak != nil, @"tweak is required");
    NSAssert(block != NULL, @"block is required");
    
    _tweak = tweak;
    _block = block;
    
    [self addObserver:self forKeyPath:kFBTweakCurrentValueKeyPath
              options:NSKeyValueObservingOptionNew context:nil];
  }
  
  return self;
}

- (void)dealloc
{
  [self removeObserver:self forKeyPath:kFBTweakCurrentValueKeyPath];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(_FBTweakBindObserver *)cell
                        change:(NSDictionary *)change context:(void *)context
{
  if (![keyPath isEqualToString:kFBTweakCurrentValueKeyPath]) {
    return;
  }

  __attribute__((objc_precise_lifetime)) id strongObject = _object;

  if (strongObject != nil) {
    _block(strongObject);
  }
}

- (void)attachToObject:(id)object
{
  NSAssert(_object == nil, @"can only attach to an object once");
  NSAssert(object != nil, @"object is required");
  
  _object = object;
  objc_setAssociatedObject(object, (__bridge void *)self, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
