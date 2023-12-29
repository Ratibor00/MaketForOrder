//
//  PageControl.swift
//  MaketForOrder
//
//  Created by Ratibor on 27.12.2023.
//

import UIKit

class PageControl: UIPageControl {

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
}

// MARK: Private methods
private extension PageControl {
    func setupUI() {
        setupPageControl()
    }
    
    func setupPageControl() {
        self.pageIndicatorTintColor = ColorConstants.colorPageControlTint
        self.currentPageIndicatorTintColor = ColorConstants.colorStandartBlack
        self.backgroundColor = ColorConstants.colorStarndartWhite
        self.layer.cornerRadius = 5
        self.hidesForSinglePage = true
    }
}
