//
//  ColourPicker.swift
//  ColourPicker
//
//  Created by William Lumley on 19/02/20.
//  Copyright © 2020 William Lumley. All rights reserved.
//

@IBDesignable open class ColorPicker: NSView {

    // MARK: - Public Properties

    /// The colours that we are displaying to the user
    public var colors = NSColor.allSystemColors {
        didSet {
            self.colorPickerViewController.colors = self.colors
        }
    }

    /// The colour that has been selected, and is displaying, in our ColourPicker
    public var selectedColor: NSColor? {
        //When the SelectedColor is set, update the ColourPicker's background colour
        didSet {
            self.wantsLayer = true
            self.layer?.backgroundColor = self.selectedColor?.cgColor
        }
    }

    /// If true, the popover will dismiss when a color has been selected
    public var dismissUponColorSelect = true

    /// The border radius that will surround the selected color's cell
    public var selectedCellBorderRadius = CGFloat(2.0)

    /// The border color that will surround the selected color's cell
    public var selectedCellBorderColor = NSColor.white.cgColor

    /// The size of our popover
    public var popoverContentSize = NSSize(width: 200, height: 100)

    /// The layout for our collection view
    public var colorCollectionViewLayout: NSCollectionViewLayout

    /// The delegate that lets the developer of events
    public var delegate: ColorPickerDelegate?

    /// The edge that the ColorCollectionView will open on your ColorPicker
    public var preferredOpeningEdge: NSRectEdge = .minY

    // MARK: - Private Properties

    /// The ViewController that manages the color selection
    private var colorPickerViewController: ColorPickerViewController
    
    /// The NSPopover that will contain our view that allows users to select different colours
    private let popover = NSPopover()

    /// The default layout for our CollectionView, if the develop does not choose one
    private class var defaultCollectionViewLayout: NSCollectionViewFlowLayout {
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 20, height: 20)
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.minimumLineSpacing = 10.0

        return flowLayout
    }

    // MARK: - ColourPicker
    init() {
        self.colorPickerViewController = ColorPickerViewController(colors: self.colors,
                                                                   borderRadius: self.selectedCellBorderRadius,
                                                                   borderColor: self.selectedCellBorderColor)

        self.colorCollectionViewLayout = ColorPicker.defaultCollectionViewLayout

        super.init(frame: .zero)
        
        self.setup()
    }

    init(colors: [NSColor]) {
        self.colorPickerViewController = ColorPickerViewController(colors: self.colors,
                                                                   borderRadius: self.selectedCellBorderRadius,
                                                                   borderColor: self.selectedCellBorderColor)

        self.colorCollectionViewLayout = ColorPicker.defaultCollectionViewLayout

        super.init(frame: .zero)
        
        self.setup()
    }

    init(colors: [NSColor], collectionViewLayout: NSCollectionViewLayout) {
        self.colorPickerViewController = ColorPickerViewController(colors: self.colors,
                                                                   borderRadius: self.selectedCellBorderRadius,
                                                                   borderColor: self.selectedCellBorderColor)

        self.colorCollectionViewLayout = collectionViewLayout

        super.init(frame: .zero)
        
        self.setup()
    }

    public override init(frame frameRect: NSRect) {
        self.colorPickerViewController = ColorPickerViewController(colors: self.colors,
                                                                   borderRadius: self.selectedCellBorderRadius,
                                                                   borderColor: self.selectedCellBorderColor)

        self.colorCollectionViewLayout = ColorPicker.defaultCollectionViewLayout

        super.init(frame: frameRect)
        
        self.setup()
    }

    public required init?(coder: NSCoder) {
        self.colorPickerViewController = ColorPickerViewController(colors: self.colors,
                                                                   borderRadius: self.selectedCellBorderRadius,
                                                                   borderColor: self.selectedCellBorderColor)

        self.colorCollectionViewLayout = ColorPicker.defaultCollectionViewLayout

        super.init(coder: coder)
        
        self.setup()
    }

    open override func mouseUp(with event: NSEvent) {
        self.popover.contentSize = self.popoverContentSize
        self.popover.contentViewController = self.colorPickerViewController
        self.popover.behavior = .transient
        self.popover.animates = true

        self.delegate?.willOpenColorPicker()
        self.popover.show(relativeTo: self.bounds, of: self, preferredEdge: self.preferredOpeningEdge)
        self.delegate?.didOpenColorPicker()
    }
    
    fileprivate func setup() {
        self.colorPickerViewController.delegate = self

        self.wantsLayer = true
        self.layer?.cornerRadius = 12
    }
}

// MARK: - ColorPickerViewControllerDelegate

extension ColorPicker: ColorPickerViewControllerDelegate {

    func didSelectColor(_ color: NSColor) {
        self.selectedColor = color

        if self.dismissUponColorSelect {
            self.popover.close()
        }

        self.delegate?.didSelectColor(color)
    }

}
