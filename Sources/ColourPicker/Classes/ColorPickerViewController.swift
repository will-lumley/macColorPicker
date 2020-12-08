//
//  ColourPickerViewController.swift
//  ColourPicker
//
//  Created by William Lumley on 25/2/20.
//

import Cocoa

class ColorPickerViewController: NSViewController
{
    // MARK: - Properties
    private let collectionView = NSCollectionView()
    
    // MARK: - NSViewController

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func loadView() {
        self.view = NSView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    private func setup() {
        //self.collectionView.
    }
}
