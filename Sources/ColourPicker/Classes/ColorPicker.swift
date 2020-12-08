//
//  ColourPicker.swift
//  ColourPicker
//
//  Created by William Lumley on 19/02/20.
//  Copyright © 2020 William Lumley. All rights reserved.
//

@IBDesignable open class ColorPicker: NSView
{
    // MARK: - Properties
    
    /// The NSPopover that will contain our view that allows users to select different colours
    private let popover = NSPopover()
    
    /// The colour that has been selected, and is displaying, in our ColourPicker
    public var selectedColor: NSColor? {
        //When the SelectedColor is set, update the ColourPicker's background colour
        didSet {
            self.wantsLayer = true
            self.layer?.backgroundColor = self.selectedColor?.cgColor
        }
    }
    
    //MARK: - ColourPicker
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    open override func mouseUp(with event: NSEvent) {
        let colourPickerViewController = ColorPickerViewController()
        
        self.popover.contentSize = NSSize(width: 200.0, height: 100.0)
        self.popover.contentViewController = colourPickerViewController
        self.popover.behavior = .transient
        self.popover.animates = true
        
        self.popover.show(relativeTo: self.bounds, of: self, preferredEdge: .minY)
    }
    
    fileprivate func setup() {
        
    }
}
