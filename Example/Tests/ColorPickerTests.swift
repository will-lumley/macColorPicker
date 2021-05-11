//
//  ColorPicker.swift
//  ColorPicker
//
//  Created by William Lumley on 19/02/20.
//  Copyright © 2020 William Lumley. All rights reserved.
//

import XCTest
import macColorPicker

class ColorPickerTests: XCTestCase {

    // MARK: - Types

    enum BackgroundExpectation: String {
        case willOpenColorPicker = "willOpenColorPicker"
        case didOpenColorPicker = "didOpenColorPicker"
        case didSelectColor = "didSelectColor"
    }

    // MARK: - Properties

    private let colorPicker = ColorPicker()

    private var willOpenColorPickerExpectation: XCTestExpectation?
    private var didOpenColorPickerExpectation: XCTestExpectation?
    private var didSelectColorExpectation: XCTestExpectation?

    // MARK: - Tests

    override func setUp() {
        super.setUp()

        self.colorPicker.animationDuration = nil
        self.colorPicker.delegate = self
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testColors() {
        let colors: [NSColor] = [
            .green,
            .blue,
            .red
        ]

        self.colorPicker.colors = colors

        XCTAssert(self.colorPicker.colors == colors)
    }

    func testSelectedColor() {
        let color = NSColor.green

        self.didSelectColorExpectation = self.expectation(description: BackgroundExpectation.didSelectColor.rawValue)

        self.colorPicker.selectedColor = color
        self.colorPicker.delegate?.didSelectColor?(self.colorPicker, color: color)

        // Check that the property is being stored correctly
        XCTAssert(self.colorPicker.selectedColor == color)

        // Check that the background color is being updated properly
        XCTAssert(self.colorPicker.layer?.backgroundColor == color.cgColor)

        // Check that the delegate function was called
        self.waitForExpectations(timeout: 1, handler: nil)
    }

    func testColorPickerDelegate() {
        self.willOpenColorPickerExpectation = self.expectation(description: BackgroundExpectation.willOpenColorPicker.rawValue)
        self.didOpenColorPickerExpectation = self.expectation(description: BackgroundExpectation.didOpenColorPicker.rawValue)

        self.colorPicker.mouseUp(with: NSEvent())

        self.waitForExpectations(timeout: 1, handler: nil)
    }
}

// MARK: - ColorPickerDelegate

extension ColorPickerTests: ColorPickerDelegate {
    
    func willOpenColorPicker(_ sender: ColorPicker) {
        self.willOpenColorPickerExpectation?.fulfill()
    }

    func didOpenColorPicker(_ sender: ColorPicker) {
        self.didOpenColorPickerExpectation?.fulfill()
    }

    func didSelectColor(_ sender: ColorPicker, color: NSColor) {
        self.didSelectColorExpectation?.fulfill()
    }
}
