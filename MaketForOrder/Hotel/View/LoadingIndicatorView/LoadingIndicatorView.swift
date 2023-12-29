//
//  LoadingIndicatorView.swift
//  MaketForOrder
//
//  Created by Ratibor on 27.12.2023.
//

import UIKit
import SnapKit

class LoadingIndicatorView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Private properties
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        return indicator
    }()
    
    // MARK: - Public methods
    func startAnimation() {
        activityIndicator.startAnimating()
    }
    
    func stopAnimation() {
        activityIndicator.stopAnimating()
    }
}

// MARK: - Private methods
private extension LoadingIndicatorView {
    func setupUI() {
        setupIndicator()
    }
    
    func setupIndicator() {
        addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
