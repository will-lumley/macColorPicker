//
//  ColorCell.swift
//  ColourPicker
//
//  Created by William Lumley on 8/12/20.
//

import Foundation

class ColorCell: NSCollectionViewItem {

    // MARK: - Properties

    override var isSelected: Bool {
        didSet {
            updateAppearance()
        }
    }

    var color: NSColor? {
        didSet {
            self.view.layer?.backgroundColor = self.color?.cgColor
        }
    }

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

    override func viewDidAppear() {
        super.viewDidAppear()

        self.view.wantsLayer = true
        self.view.layer?.cornerRadius = self.view.bounds.width / 2
    }

    func updateAppearance() {
        self.view.wantsLayer = true

        if isSelected {
            self.view.layer?.borderWidth = 2.0
            self.view.layer?.borderColor = NSColor.white.cgColor
        } else {
            self.view.layer?.borderWidth = 0.0
            self.view.layer?.borderColor = nil
        }
    }
}
