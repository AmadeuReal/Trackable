//
//  Tests.swift
//  TrackableTests
//
//  Created by Amadeu Martos on 30/10/2018.
//  Copyright © 2018 Amadeu Real. All rights reserved.
//

import XCTest
@testable import Trackable

class TimeTrackingSpec: XCTestCase {
  func testTrackIntValue() {
    let trackableInt = Trackable<Int>(with: 0)
    XCTAssertEqual(trackableInt.value, 0)
    trackableInt.value = 1
    XCTAssertNotEqual(trackableInt.value, 0)
  }

  func testTrackIntValue_SetInterval() {
    let trackableInt = Trackable<Int>(with: 0, timeInterval: 3)
    trackableInt.value = 1
    XCTAssertEqual(trackableInt.value, 0)
  }

  func testTrackIntValue_SetInterval_Updating() {
    let trackableInt = Trackable<Int>(with: 0, timeInterval: 2)
    let expectation = XCTestExpectation(description: "Updating value")
    Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
      timer.invalidate()
      trackableInt.value = 1
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 4)
    XCTAssertEqual(trackableInt.value, 1)
  }

  func testTrackOptionalValue() {
    let trackableInt = Trackable<Int?>(with: nil)
    XCTAssertNil(trackableInt.value)
    trackableInt.value = 0
    XCTAssertNotNil(trackableInt.value)
  }

  func testShouldGetTriggerWhenValueChanges() {
    let trackableInt = Trackable<Int>(with: 0, timeInterval: 2)
    let expectation = XCTestExpectation(description: "Updating value")
    Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
      timer.invalidate()
      trackableInt.value = 1
    }
    trackableInt.onValueChange = { value in
      if value == 1 {
        expectation.fulfill()
      }
    }
    wait(for: [expectation], timeout: 4)
    XCTAssertEqual(trackableInt.value, 1)
  }
}
