import XCTest

import hellolibTests

var tests = [XCTestCaseEntry]()
tests += hellolibTests.allTests()
XCTMain(tests)
