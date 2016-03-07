//
//  yyNoteUITests.m
//  yyNoteUITests
//
//  Created by ZhangYanam on 15/12/16.
//  Copyright © 2015年 ZhangYanam. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface yyNoteUITests : XCTestCase

@end

@implementation yyNoteUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *masterNavigationBar = app.navigationBars[@"Master"];
    XCUIElement *addButton = masterNavigationBar.buttons[@"Add"];
    [addButton tap];
    [addButton tap];
    [masterNavigationBar.buttons[@"Edit"] tap];
    
    XCUIElementQuery *tablesQuery = app.tables;
    [tablesQuery.buttons[@"Delete 2016-01-06 16:01:83 +0800"] tap];
    
    XCUIElement *deleteButton = tablesQuery.buttons[@"Delete"];
    [deleteButton tap];
    [tablesQuery.buttons[@"Delete 2016-01-06 16:01:89 +0800"] tap];
    [deleteButton tap];
    
}

@end
