//
//  FifthBlockView.swift
//  MaketForOrder
//
//  Created by Ratibor on 28.12.2023.
//

import UIKit
import SnapKit

class FifthBlockView: FourthBlockView {
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Private methods
private extension FifthBlockView {
    func setupUI() {
        self.firstTuristLabel.text = "Второй турист"
    }
}
