//
//  ViewController.swift
//  ColourPicker
//
//  Created by will-lumley on 02/19/2020.
//  Copyright (c) 2020 will-lumley. All rights reserved.
//

import Cocoa
import ColorPicker

class ViewController: NSViewController
{
    override var representedObject: Any? { didSet {} }
    
    @IBOutlet weak var colorPicker: ColorPicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.colorPicker.selectedColor = NSColor.green
    }
}

