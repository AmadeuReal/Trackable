//
//  Trackable.swift
//  Trackable
//
//  Created by Amadeu Martos on 30/10/2018.
//  Copyright © 2018 Amadeu Real. All rights reserved.
//

import Foundation

open class Trackable<T> {

  public typealias Element = T
  public typealias ChangeClosure = (Element) -> Void

  private var shouldCheck: Bool = true
  private var lastUpdate: Date
  public var value: Element {
    set {
      performChange(to: newValue)
    }
    get {
      return internalElement
    }
  }

  public var onValueChange: ChangeClosure?
  private var internalElement: Element
  private var secondsToUpdate: TimeInterval

  init(with element: Element, timeInterval: TimeInterval = 0) {
    lastUpdate = Date()
    internalElement = element
    secondsToUpdate = timeInterval
  }

  private func performChange(to newValue: Element) {
    if shouldCheck {
      guard isAllowedToUpdate else {
        return
      }
    }
    lastUpdate = Date()
    internalElement = newValue
    onValueChange?(newValue)
  }

  private var isAllowedToUpdate: Bool {
    return abs(lastUpdate.timeIntervalSinceNow) > secondsToUpdate
  }
}
