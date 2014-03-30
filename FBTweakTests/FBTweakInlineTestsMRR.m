/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.
 
 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

#import <XCTest/XCTest.h>

#import "FBTweakInline.h"

#if __has_feature(objc_arc)
#error ARC is disallowed.
#endif

@interface FBTweakInlineTestsMRR : XCTestCase

@end

@implementation FBTweakInlineTestsMRR

- (void)testValueTypes
{
  __attribute__((unused)) short testShort = FBTweakValue(@"Short", @"Short", @"Short", -1);
  XCTAssertEqual(testShort, (short)-1, @"Short %d", testShort);

  __attribute__((unused)) unsigned short testUnsignedShort = FBTweakValue(@"Unsigned Short", @"Unsigned Short", @"Unsigned Short", 1);
  XCTAssertEqual(testUnsignedShort, (unsigned short)1, @"Unsigned Short %d", testUnsignedShort);

  __attribute__((unused)) int testInt = FBTweakValue(@"Int", @"Int", @"Int", -1);
  XCTAssertEqual(testInt, (int)-1, @"Int %d", testInt);

  __attribute__((unused)) unsigned int testUnsignedInt = FBTweakValue(@"Unsigned Int", @"Unsigned Int", @"Unsigned Int", 1);
  XCTAssertEqual(testUnsignedInt, (unsigned int)1, @"Unsigned Int %d", testUnsignedInt);

  __attribute__((unused)) long long testLongLong = FBTweakValue(@"Long Long", @"Long Long", @"Long Long", -1);
  XCTAssertEqual(testLongLong, (long long)-1, @"Long Long %d", testLongLong);

  __attribute__((unused)) unsigned long long testUnsignedLongLong = FBTweakValue(@"Unsigned Long Long", @"Unsigned Long Long", @"Unsigned Long Long", 1);
  XCTAssertEqual(testUnsignedLongLong, (unsigned long long)1, @"Unsigned Long Long %d", testUnsignedLongLong);

  __attribute__((unused)) float testFloat = FBTweakValue(@"Float", @"Float", @"Float", 1.0);
  XCTAssertEqual(testFloat, (float)1.0, @"Float %f", testFloat);

  __attribute__((unused)) BOOL testBool = FBTweakValue(@"BOOL", @"BOOL", @"BOOL", YES);
  XCTAssertEqual(testBool, (BOOL)YES, @"Bool %d", testBool);

  __attribute__((unused)) const char *testString = FBTweakValue(@"String", @"String", @"String", "one");
  XCTAssertEqual(strcmp(testString, "one"), 0, @"String %s", testString);

  __attribute__((unused)) NSString *testNSString = FBTweakValue(@"NSString", @"NSString", @"NSString", @"one");
  XCTAssertEqualObjects(testNSString, @"one", @"NSString %@", testNSString);
}

- (void)testBind
{
  NSMutableURLRequest *v = [[NSMutableURLRequest alloc] init];
  FBTweakBind(v, timeoutInterval, @"URL", @"Request", @"Bind", 5.0);
  XCTAssertEqual(v.timeoutInterval, (NSTimeInterval)5.0, @"request %@", v);

  FBTweak *m = FBTweakInline(@"URL", @"Request", @"Bind", 5.0);
  m.currentValue = @(20.0);
  XCTAssertEqual(v.timeoutInterval, (NSTimeInterval)20.0, @"request %@ %@", v, m);
}

@end