//
//  ColorPickerViewControllerDelegate.swift
//  ColorPicker
//
//  Created by William Lumley on 13/12/20.
//

import Foundation

/// This protocol is used internally to allow communication from the ColorPickerViewController to the ColorPicker
internal protocol ColorPickerViewControllerDelegate {
    func didSelectColor(_ color: NSColor)
}
