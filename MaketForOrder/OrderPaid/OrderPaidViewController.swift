//
//  OrderPaidViewController.swift
//  MaketForOrder
//
//  Created by Ratibor on 28.12.2023.
//

import UIKit

class OrderPaidViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateOrderNumber()
    }
    
    // MARK: - Private properties
    private let customTabBar = CustomTabBar()
    
    private let partyPopperImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "party")
        return imageView
    }()
    
    private let acceptedLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваш заказ принят в работу"
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        label.textAlignment = .center
        label.textColor = ColorConstants.colorStandartBlack
        return label
    }()
    
    private let infoAcceptedLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
}

// MARK: - Private methods
private extension OrderPaidViewController {
    func setupUI() {
        setupNavigationController()
        setupPartyImage()
        setupAcceptdInfoLabel()
        setupTabBar()
    }
    
    func setupNavigationController() {
        self.title = "Заказ оплачен"
        view.backgroundColor = .white
    }
    
    func setupPartyImage() {
        view.addSubview(partyPopperImage)
        partyPopperImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(122)
            make.leading.equalToSuperview().offset(140)
            make.height.equalTo(94)
            make.width.equalTo(94)
        }
    }
    
    func setupAcceptdInfoLabel() {
        view.addSubview(acceptedLabel)
        acceptedLabel.snp.makeConstraints { make in
            make.top.equalTo(partyPopperImage.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(26)
        }
        
        view.addSubview(infoAcceptedLabel)
        infoAcceptedLabel.snp.makeConstraints { make in
            make.top.equalTo(acceptedLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(23)
            make.trailing.equalToSuperview().offset(-23)
            make.height.equalTo(95)
        }
        
    }
    
    func setupTabBar() {
        view.addSubview(customTabBar)
        customTabBar.setTabBarLabelText(text: "Супер")
        customTabBar.tabBarButtonTappedHandler = {
            self.navigationController?.popToRootViewController(animated: true)
        }
        customTabBar.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func updateOrderNumber() {
        let randomNumber = Int.random(in: 000001...999999)
        infoAcceptedLabel.text = "Подтверждение заказа №\(randomNumber) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление."
    }
}
