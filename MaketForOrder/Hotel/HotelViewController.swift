//
//  HotelViewController.swift
//  MaketForOrder
//
//  Created by Ratibor on 27.12.2023.
//

import UIKit
import SnapKit

class HotelViewController: UIViewController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: Private properties
    private let customTabBar = CustomTabBar()
    private let firstView = FirstView()
    private let secondView = SecondView()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()
}

// MARK: Private methods
private extension HotelViewController {
    func setupUI() {
        setupNavigationBar()
        setupScrollView()
        setupFirstView()
        setupSecondView()
        setupTabBar()
    }
    
    func setupNavigationBar() {
        self.title = "Отель"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        view.backgroundColor = ColorConstants.colorControllerBackground
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: customTabBar.frame.height, right: 0)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupFirstView() {
        scrollView.addSubview(firstView)
        firstView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalToSuperview()
        }
    }
    
    func setupSecondView() {
        scrollView.addSubview(secondView)
        secondView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(firstView.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-65)
        }
    }
    
    func setupTabBar() {
        view.addSubview(customTabBar)
        customTabBar.tabBarButtonTappedHandler = { [weak self] in
            let nextVC = RoomTableViewController()
            self?.navigationController?.pushViewController(nextVC, animated: true)
        }
        customTabBar.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
