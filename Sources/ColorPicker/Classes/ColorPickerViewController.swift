//
//  ColourPickerViewController.swift
//  ColourPicker
//
//  Created by William Lumley on 25/2/20.
//

import Cocoa

protocol ColorPickerDelegate {
    func didSelectColor(_ color: NSColor)
}

open class ColorPickerViewController: NSViewController {

    // MARK: - Properties

    /// The colours that we are displaying to the user
    var colors: [NSColor] {
        didSet {
            self.collectionView.reloadData()
        }
    }

    /// The delegate for our ColorPicker
    private var delegate: ColorPickerDelegate?

    /// The ScrollView for our CollectionView
    private let scrollView = NSScrollView()
    
    /// The CollectionView that displays our colours
    private let collectionView = NSCollectionView()
    
    /// The layout for our CollectionView
    private var collectionViewLayout: NSCollectionViewFlowLayout {
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 20, height: 20)
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.minimumLineSpacing = 10.0

        return flowLayout
    }

    /// The cell identifier that we're using with our CollectionView
    private let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "ColorCellIdentifier")

    // MARK: - NSViewController
    init(delegate: ColorPickerDelegate?, colors: [NSColor]) {
        self.delegate = delegate
        self.colors = colors

        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder: NSCoder) {
        self.colors = NSColor.allSystemColors
        super.init(coder: coder)
    }

    open override func loadView() {
        self.view = NSView()
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
    }

    open override func viewDidAppear() {
        super.viewDidAppear()

        self.configureCollectionViewPresentation()
        self.configureCollectionView()
    }

    private func configureCollectionViewPresentation() {
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.scrollView)
        
        let constraints = [
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
        ]
        NSLayoutConstraint.activate(constraints)

        self.scrollView.documentView = self.collectionView
    }

    private func configureCollectionView() {
        self.collectionView.collectionViewLayout = self.collectionViewLayout
        self.collectionView.allowsMultipleSelection = false
        self.collectionView.backgroundColors = [.clear]
        self.collectionView.isSelectable = true

        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        self.collectionView.register(ColorCell.self, forItemWithIdentifier: self.cellIdentifier)
    }

}

// MARK: - NSCollectionViewDataSource

extension ColorPickerViewController: NSCollectionViewDataSource {

    public func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }

    public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.colors.count
    }
    
    public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: self.cellIdentifier, for: indexPath) as! ColorCell

        let color = self.colors[indexPath.item]
        item.color = color

        return item
    }

}

// MARK: - NSCollectionViewDelegate

extension ColorPickerViewController: NSCollectionViewDelegate {

    public func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        guard let indexPath = indexPaths.first else {
            return
        }

        let color = self.colors[indexPath.item]
        self.delegate?.didSelectColor(color)
    }

}
