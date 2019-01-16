//
//  DataHeaderFooter.swift
//  SwiftDataTables
//
//  Created by Pavan Kataria on 22/02/2017.
//  Copyright © 2017 Pavan Kataria. All rights reserved.
//

import UIKit

class DataHeaderFooter: UICollectionReusableView {

    //MARK: - Properties
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var sortingImageView: UIImageView!

    //MARK: - Events
    var didTapEvent: (() -> Void)? = nil

    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(DataHeaderFooter.didTapView))
        self.addGestureRecognizer(tapGesture)
    }
    
    func setup(viewModel: DataHeaderFooterViewModel, bgColor: UIColor, fgColor: UIColor) {
        self.titleLabel.text = viewModel.data
        self.titleLabel.textColor = fgColor
        self.sortingImageView.image = viewModel.imageForSortingElement
        self.backgroundColor = bgColor
        self.titleLabel.backgroundColor = bgColor
        self.sortingImageView.backgroundColor = bgColor
    }
    
    @objc func didTapView(){
        if let _ = sortingImageView.image {
            self.didTapEvent?()
        }
    }
}
