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

class ColorPickerViewController: NSViewController
{
    // MARK: - Properties

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
    
    /// The colours that we are displaying to the user
    private let colours = [
        NSColor.black,
        NSColor.darkGray,
        NSColor.lightGray,
        NSColor.white,
        NSColor.gray,
        NSColor.red,
        NSColor.green,
        NSColor.blue,
        NSColor.cyan,
        NSColor.yellow,
        NSColor.magenta,
        NSColor.orange,
        NSColor.purple,
        NSColor.brown
    ]

    /// The cell identifier that we're using with our CollectionView
    private let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "ColorCellIdentifier")

    // MARK: - NSViewController
    init(delegate: ColorPickerDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

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
    }

    override func viewDidAppear() {
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

    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.colours.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: self.cellIdentifier, for: indexPath) as! ColorCell

        let color = self.colours[indexPath.item]
        item.color = color

        return item
    }

}

// MARK: - NSCollectionViewDelegate

extension ColorPickerViewController: NSCollectionViewDelegate {

    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        guard let indexPath = indexPaths.first else {
            return
        }

        let color = self.colours[indexPath.item]
        self.delegate?.didSelectColor(color)
    }

}
