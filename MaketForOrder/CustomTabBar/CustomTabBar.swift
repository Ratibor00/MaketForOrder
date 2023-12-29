//
//  CustomTabBar.swift
//  MaketForOrder
//
//  Created by Ratibor on 27.12.2023.
//

import UIKit
import SnapKit

class CustomTabBar: UITabBar{
    
    // MARK: Public
    var tabBarButtonTappedHandler: (() -> Void)?
    
    // MARK: Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private properties
    private let tabBarButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 15
        button.backgroundColor = ColorConstants.colorBackgroundTabBarButton
        button.setTitle("К выбору номера", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        button.setTitleColor(ColorConstants.colorTabBarLabel, for: .normal)
        button.addTarget(self, action: #selector(tabBarButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: Public methods
    func setTabBarLabelText(text: String) {
        tabBarButton.setTitle(text, for: .normal)
    }
}

// MARK: - Private methods
private extension CustomTabBar {
    func setupUI() {
        setupTabBarButton()
    }
    
    func setupTabBarButton() {
        addSubview(tabBarButton)
        tabBarButton.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(8)
            make.leading.equalTo(snp.leading).offset(16)
            make.trailing.equalTo(snp.trailing).offset(-16)
            make.bottom.equalTo(snp.bottom).offset(-28)
            make.height.equalTo(48)
        }
    }
    
    @objc func tabBarButtonTapped() {
        tabBarButtonTappedHandler?()
    }
}
