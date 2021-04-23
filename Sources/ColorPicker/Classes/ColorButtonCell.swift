//
//  ColorCell.swift
//  ColourPicker
//
//  Created by William Lumley on 8/12/20.
//

import Foundation

class ColorButtonCell: NSCollectionViewItem {

    // MARK: - Properties

    private var button: NSButton?
    var action: (() -> ())?

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

        self.button = NSButton(title: "Custom Color", target: self, action: #selector(buttonTapped))
        guard let button = self.button else {
            return
        }

        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)

        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            button.topAnchor.constraint(equalTo: self.view.topAnchor),
            button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}

private extension ColorButtonCell {

    @objc
    func buttonTapped() {
        action?()
    }

}
