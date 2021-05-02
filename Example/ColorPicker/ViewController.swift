//
//  ViewController.swift
//  ColorPicker
//
//  Created by will-lumley on 02/19/2020.
//  Copyright (c) 2020 will-lumley. All rights reserved.
//

import Cocoa
import macColorPicker

class ViewController: NSViewController{
    override var representedObject: Any? { didSet {} }
    
    @IBOutlet weak var colorPicker: ColorPicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.colorPicker.delegate = self
        self.colorPicker.selectedColor = NSColor.green
    }
}

extension ViewController: ColorPickerDelegate {

    func willOpenColorPicker() {
        print("willOpenColorPicker")
    }
    
    func didOpenColorPicker() {
        print("didOpenColorPicker")
    }
    
    func didSelectColor(_ color: NSColor) {
        print("Color Selected: \(color)")
    }

}
