//
//  RoomTableViewCell.swift
//  MaketForOrder
//
//  Created by Ratibor on 27.12.2023.
//

import UIKit


class RoomTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private properties
    var rooms: Room?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = ColorConstants.colorPageControlTint
        pageControl.currentPageIndicatorTintColor = ColorConstants.colorStandartBlack
        pageControl.backgroundColor = ColorConstants.colorStarndartWhite
        pageControl.layer.cornerRadius = 5
        return pageControl
    }()
    
    let roomNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = ""
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        label.textColor = ColorConstants.colorStandartBlack
        return label
    }()
    
    private let allInclusiveView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = ColorConstants.colorLightGreyForBlock
        return view
    }()
    
    private let allInclusiveLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
    
    private let conditionerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = ColorConstants.colorLightGreyForBlock
        return view
    }()
    
    private let conditionerLabel: UILabel = {
        let label = UILabel()
        label.text = "Кондиционер"
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
    
    private let aboutRoomView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = ColorConstants.colorAboutRoomView
        return view
    }()
    
    private let aboutRoomButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Подробнее о номере", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        button.setTitleColor(ColorConstants.colorAboutRoomLabel, for: .normal)
        return button
    }()
    
    private let aboutRoomIconVector: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "VectorBlue")
        return image
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 30)
        label.textColor = ColorConstants.colorStandartBlack
        return label
    }()
    
    private let forTourLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
    
    private let choiceRoomButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = ColorConstants.colorChoiceRoomButton
        button.layer.cornerRadius = 15
        button.setTitle("Выбрать номер", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(choiceRoomButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Public methods
    func setRoom(_ room: Room) {
        self.rooms = room
        roomNameLabel.text = room.name
        forTourLabel.text = room.pricePer
        allInclusiveLabel.text = room.peculiarities[0]
        conditionerLabel.text = room.peculiarities[1]
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        if let formattedPrice = numberFormatter.string(from: room.price as NSNumber) {
            self.priceLabel.text = "\(formattedPrice) ₽"
        } else {
            self.priceLabel.text = "\(room.price) ₽"
        }
        
        collectionView.reloadData()
    }
}

// MARK: - Private methods
private extension RoomTableViewCell {
    func setupUI() {
        setupCollectionView()
        setupPageControl()
        setupRoomAllinclusiveLabel()
        setupAboutRoomView()
        setupPriceLabel()
        setupChoiceButton()
    }
    
    func setupCollectionView() {
        contentView.addSubview(collectionView)
        selectionStyle = .none
        collectionView.register(RoomCollectionViewCell.self, forCellWithReuseIdentifier: "RoomCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(257)
        }
    }
    func setupPageControl() {
        contentView.addSubview(pageControl)
        pageControl.numberOfPages = rooms?.imageUrls.count ?? 3
        pageControl.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.top).offset(232)
            make.centerX.equalToSuperview()
            make.height.equalTo(17)
        }
    }
    
    func setupRoomAllinclusiveLabel() {
        contentView.addSubview(roomNameLabel)
        roomNameLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(53)
        }
        
        contentView.addSubview(allInclusiveView)
        allInclusiveView.snp.makeConstraints { make in
            make.top.equalTo(roomNameLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(29)
        }
        
        allInclusiveView.addSubview(allInclusiveLabel)
        allInclusiveLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(19)
        }
        
        contentView.addSubview(conditionerView)
        conditionerView.snp.makeConstraints { make in
            make.top.equalTo(roomNameLabel.snp.bottom).offset(8)
            make.leading.equalTo(allInclusiveView.snp.trailing).offset(8)
            make.height.equalTo(29)
        }
        
        conditionerView.addSubview(conditionerLabel)
        conditionerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(19)
        }
    }
    
    func setupAboutRoomView() {
        contentView.addSubview(aboutRoomView)
        aboutRoomView.snp.makeConstraints { make in
            make.top.equalTo(allInclusiveView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(192)
            make.height.equalTo(29)
        }
        
        aboutRoomView.addSubview(aboutRoomButton)
        aboutRoomButton.snp.makeConstraints { make in
            make.width.equalTo(154)
            make.height.equalTo(19)
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(10)
        }
        
        aboutRoomView.addSubview(aboutRoomIconVector)
        aboutRoomIconVector.snp.makeConstraints { make in
            make.width.equalTo(6)
            make.height.equalTo(12)
            make.top.equalToSuperview().offset(8.5)
            make.leading.equalTo(aboutRoomButton.snp.trailing).offset(12)
        }
    }
    
    func setupPriceLabel() {
        contentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(aboutRoomView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(36)
        }
        
        contentView.addSubview(forTourLabel)
        forTourLabel.snp.makeConstraints { make in
            make.height.equalTo(19)
            make.leading.equalTo(priceLabel.snp.trailing).offset(8)
            make.top.equalTo(priceLabel.snp.top).inset(14)
        }
    }
    func setupChoiceButton() {
        contentView.addSubview(choiceRoomButton)
        choiceRoomButton.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(48)
        }
    }
    
    @objc func choiceRoomButtonTapped(_ sende: UIButton) {
        let nextVc = BookingViewController()
        if let navigationController = self.window?.rootViewController as? UINavigationController {
            navigationController.pushViewController(nextVc, animated: true)
        }
    }
}

// MARK: - UICollectionView DataSource
extension RoomTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rooms?.imageUrls.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoomCollectionViewCell", for: indexPath) as! RoomCollectionViewCell
        
        if let imageUrl = rooms?.imageUrls[indexPath.item] {
            cell.configure(with: imageUrl)
        }
        return cell
    }
}

// MARK: - UICollectionView DelegateFlowLayout
extension RoomTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 290)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// MARK: - ScrolViewDelegate
extension RoomTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        pageControl.currentPage = currentPage
    }
}
