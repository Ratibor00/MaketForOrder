//
//  BookingViewController.swift
//  MaketForOrder
//
//  Created by Ratibor on 28.12.2023.
//

import UIKit
import SnapKit

class BookingViewController: UIViewController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateScrollViewSize()
    }
    
    // MARK: - Private properties
    private let firstBlockView = FirstBlockView()
    private let secondBlockView = SecondBlockView()
    private let thirdBlockView = ThirdBlockView()
    private let fourthBlockView = FourthBlockView()
    private let fifthBlockView = FifthBlockView()
    
    lazy var sixthBlockView: SixthBlockView = {
        let view = SixthBlockView()
        view.bookingViewController = self
        return view
    }()
    
    private let seventhBlockView = SeventhBlockView()
    
    private let tabBar: UITabBar = {
        let tabBar = UITabBar()
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.backgroundColor = UIColor.white
        return tabBar
    }()
    
    private let tabBarButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 15
        button.backgroundColor = ColorConstants.colorBackgroundTabBarButton
        button.setTitle("К выбору номера", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        button.setTitleColor(ColorConstants.colorTabBarLabel, for: .normal)
        button.addTarget(self, action: #selector(setupTabBarTapped), for: .touchUpInside)
        return button
    }()
    
    let newTourist = FourthBlockView()
    var isTouristAdded = false
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()
}

// MARK: - Public methods
extension BookingViewController {
    internal func tapped() {
        let newTourist = FourthBlockView()
        
        guard isTouristAdded == false else { return }
        
        scrollView.addSubview(newTourist)
        newTourist.firstTuristLabel.text = "Третий турист"
        newTourist.frame = CGRect(x: 0, y: fifthBlockView.frame.origin.y + 8, width: scrollView.frame.width, height: 58)
        newTourist.alpha = 0.0
        newTourist.snp.makeConstraints { make in
            make.top.equalTo(fifthBlockView.snp.bottom).offset(8)
            make.width.equalToSuperview()
            make.height.equalTo(58)
        }
        
        sixthBlockView.snp.remakeConstraints { make in
            make.top.equalTo(newTourist.snp.bottom).offset(8)
            make.width.equalToSuperview()
            make.height.equalTo(58)
        }
        
        isTouristAdded = true
        
        UIView.animate(withDuration: 0.4) { [weak self] in
            self?.view.layoutIfNeeded()
            newTourist.alpha = 1.0
        }
    }
}

// MARK: - Private methods
private extension BookingViewController {
    func setupUI() {
        setupNavigationController()
        setupScrollView()
        setupBlock()
        setupTabBar()
        gestureTap()
    }
    
    func setupNavigationController() {
        self.title = "Бронирование"
        view.backgroundColor = ColorConstants.colorControllerBackground
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tabBar.frame.height, right: 0)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupBlock() {
        scrollView.addSubview(firstBlockView)
        firstBlockView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.width.equalToSuperview()
            make.height.equalTo(120)
        }
        
        scrollView.addSubview(secondBlockView)
        secondBlockView.snp.makeConstraints { make in
            make.top.equalTo(firstBlockView.snp.bottom).offset(8)
            make.width.equalToSuperview()
            make.height.equalTo(280)
        }
        
        scrollView.addSubview(thirdBlockView)
        thirdBlockView.snp.makeConstraints { make in
            make.top.equalTo(secondBlockView.snp.bottom).offset(8)
            make.width.equalToSuperview()
            make.height.equalTo(232)
        }
        
        scrollView.addSubview(fourthBlockView)
        fourthBlockView.snp.makeConstraints { make in
            make.top.equalTo(thirdBlockView.snp.bottom).offset(8)
            make.width.equalToSuperview()
            make.height.equalTo(58)
        }
        
        scrollView.addSubview(fifthBlockView)
        fifthBlockView.snp.makeConstraints { make in
            make.top.equalTo(fourthBlockView.snp.bottom).offset(8)
            make.width.equalToSuperview()
            make.height.equalTo(58)
        }
        
        scrollView.addSubview(sixthBlockView)
        sixthBlockView.snp.makeConstraints { make in
            make.top.equalTo(fifthBlockView.snp.bottom).offset(8)
            make.width.equalToSuperview()
            make.height.equalTo(58)
        }
        
        scrollView.addSubview(seventhBlockView)
        seventhBlockView.snp.makeConstraints { make in
            make.top.equalTo(sixthBlockView.snp.bottom).offset(8)
            make.width.equalToSuperview()
            make.height.equalTo(156)
        }
    }
    
    func setupTabBar() {
        view.addSubview(tabBar)
        tabBar.snp.makeConstraints { make in
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(88)
        }
        
        tabBar.addSubview(tabBarButton)
        tabBarButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(48)
        }
        seventhBlockView.totalPriceUpdatedHandler = { [weak self] totalPrice in
            self?.tabBarButton.setTitle(totalPrice, for: .normal)
        }
    }
    
    @objc func setupTabBarTapped() {
        let textField = [fourthBlockView.nameTextField,fourthBlockView.surnameTextField, fourthBlockView.dateBirthTextField, fourthBlockView.citizenTextField, fourthBlockView.paspotNumberTextField, fourthBlockView.validityPasportTextField, fifthBlockView.nameTextField, fifthBlockView.surnameTextField, fifthBlockView.dateBirthTextField, fifthBlockView.citizenTextField, fifthBlockView.paspotNumberTextField, fifthBlockView.validityPasportTextField]
        
        var allTetxtFieldHasText = true
        
        for textField in textField {
            if !textField.hasText {
                textField.backgroundColor = UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 0.15)
                allTetxtFieldHasText = false
                AlertManager.showAlert(title: "Внимание", message: "Необходимо заполнить все данные", viewController: self)
            } else {
                textField.backgroundColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
            }
        }
        
        if allTetxtFieldHasText {
            let nextVc = OrderPaidViewController()
            self.navigationController?.pushViewController(nextVc, animated: true)
        }
    }
    
    func updateScrollViewSize() {
        let contentHeight = seventhBlockView.frame.origin.y + seventhBlockView.frame.size.height + tabBar.frame.size.height + 10
        scrollView.contentSize = CGSize(width: view.bounds.width, height: contentHeight)
    }
    
    func gestureTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dissmisKey))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dissmisKey() {
        view.endEditing(true)
    }
}
