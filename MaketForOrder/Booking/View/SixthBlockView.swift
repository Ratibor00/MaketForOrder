//
//  SixthBlockView.swift
//  MaketForOrder
//
//  Created by Ratibor on 28.12.2023.
//

import UIKit
import SnapKit

class SixthBlockView: UIView {
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private properties
    weak var bookingViewController: BookingViewController?
    
    private let turistAddLabel: UILabel = {
        let label = UILabel()
        label.text = "Добавить туриста"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 22)
        label.textColor = UIColor.black
        return label
    }()
    
    private let viewAddButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "buttonAdd"), for: .normal)
        button.backgroundColor = UIColor(red: 13/255.0, green: 114/255.0, blue: 255/255.0, alpha: 1.0)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(tappedAddView), for: .touchUpInside)
        return button
    }()
}

// MARK: - Private methods
private extension SixthBlockView {
    func initialize() {
        self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.layer.cornerRadius = 15
        
        addSubview(turistAddLabel)
        turistAddLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(182)
            make.height.equalTo(26)
        }
        
        addSubview(viewAddButton)
        viewAddButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.leading.equalTo(turistAddLabel.snp.trailing).offset(129)
            make.width.equalTo(32)
            make.height.equalTo(32)
        }
    }
    
    @objc func tappedAddView() {
        if let bookingVC = bookingViewController {
            bookingVC.tapped()
        } else {
            print("Booking view controller is nil!")
        }
    }
}
