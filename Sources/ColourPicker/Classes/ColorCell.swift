//
//  ColorCell.swift
//  ColourPicker
//
//  Created by William Lumley on 8/12/20.
//

import Foundation

class ColorCell: NSCollectionViewItem {

    // MARK: - Properties

    var color: NSColor? {
        didSet {
            self.view.layer?.backgroundColor = self.color?.cgColor
        }
    }
    //private let colorView = NSView()

    // MARK: - NSCollectionViewItem

    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = NSView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.wantsLayer = true
    }
}
