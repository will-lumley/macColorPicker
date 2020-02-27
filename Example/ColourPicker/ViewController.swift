//
//  ViewController.swift
//  ColourPicker
//
//  Created by will-lumley on 02/19/2020.
//  Copyright (c) 2020 will-lumley. All rights reserved.
//

import Cocoa
import ColourPicker

class ViewController: NSViewController
{
    override var representedObject: Any? { didSet {} }
    
    @IBOutlet weak var colourPicker: ColourPicker!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.colourPicker.selectedColor = NSColor.green
    }
}

