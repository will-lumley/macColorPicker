//
//  ColorPickerDelegate.swift
//  ColorPicker
//
//  Created by William Lumley on 13/12/20.
//

import Foundation

/// This protocol is used to allow communication from the ColorPicker to the developers project
internal protocol ColorPickerDelegate {
    func didSelectColor(_ color: NSColor)
}
