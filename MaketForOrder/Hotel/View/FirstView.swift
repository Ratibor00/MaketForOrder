//
//  FirstView.swift
//  MaketForOrder
//
//  Created by Ratibor on 27.12.2023.
//

import UIKit
import SnapKit

class  FirstView: UIView {
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        loadImageData()
        loadRatingData()
        loadNameAndLocationData()
        loadPriceData()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private properties
    private let imageCollectionView = ImageCollectionView()
    private let pageControl = PageControl()
    private let loadingIndicatorView = LoadingIndicatorView()
    
    private let reitView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorConstants.colorReitView
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let starInReitView: UIImageView = {
        let image = UIImageView()
        image.tintColor = ColorConstants.colorReitLabel
        image.image = UIImage(systemName: "star.fill")!
        return image
    }()
    
    private let reitLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorConstants.colorReitLabel
        label.textAlignment = .center
        label.text = "Loading..."
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        return label
    }()
    
    private let nameHotelLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.numberOfLines = 0
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        label.textColor = ColorConstants.colorStandartBlack
        return label
    }()
    
    private let locationHotelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Loading...", for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        button.titleLabel?.textColor = ColorConstants.colorLocationHotelLabel
        return button
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 30)
        label.textColor = ColorConstants.colorStandartBlack
        return label
    }()
    
    private let forTourLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
}

// MARK: Private methods
private extension FirstView {
    func setupUI() {
        setupFirstView()
        setupImageCollectionView()
        setuploadingIndicatorView()
        setupReitView()
        setupNameLocationPriceHotel()
        setupPriceForTourLabel()
        setupPageControl()
    }
    
    func setupFirstView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
    }
    
    func setupImageCollectionView() {
        addSubview(imageCollectionView)
        imageCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(257)
        }
        
        imageCollectionView.onPageChange = { [weak self] page in
            self?.pageControl.currentPage = page
        }
    }
    
    func setuploadingIndicatorView() {
        imageCollectionView.addSubview(loadingIndicatorView)
        loadingIndicatorView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func setupReitView() {
        addSubview(reitView)
        reitView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(273)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(SizeConstants.sizeReitViewWidth)
            make.height.equalTo(SizeConstants.sizeReitViewHeight)
        }
        
        reitView.addSubview(starInReitView)
        starInReitView.snp.makeConstraints { make in
            make.top.equalTo(reitView.snp.top).offset(7)
            make.leading.equalTo(reitView.snp.leading).offset(10)
            make.width.equalTo(SizeConstants.sizeStarInreitView)
            make.height.equalTo(SizeConstants.sizeStarInreitView)
        }
        
        reitView.addSubview(reitLabel)
        reitLabel.snp.makeConstraints { make in
            make.top.equalTo(reitView.snp.top).offset(5)
            make.leading.equalTo(starInReitView.snp.trailing).offset(2)
            make.trailing.equalTo(reitView.snp.trailing).offset(-10)
        }
    }
    
    func setupNameLocationPriceHotel() {
        addSubview(nameHotelLabel)
        nameHotelLabel.snp.makeConstraints { make in
            make.top.equalTo(reitView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            
        }
        
        addSubview(locationHotelButton)
        locationHotelButton.snp.makeConstraints { make in
            make.top.equalTo(nameHotelLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    func setupPriceForTourLabel() {
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(locationHotelButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(175)
            make.bottom.equalTo(self.snp.bottom).inset(16)
        }
        
        addSubview(forTourLabel)
        forTourLabel.snp.makeConstraints { make in
            make.leading.equalTo(priceLabel.snp.trailing).offset(8)
            make.bottom.equalTo(priceLabel.snp.bottom).inset(3)
            make.height.equalTo(19)
        }
    }
    
    func setupPageControl() {
        addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(imageCollectionView.snp.bottom).offset(-8)
            make.height.equalTo(17)
        }
    }
    
    //MARK: - API
    func loadImageData() {
        loadingIndicatorView.startAnimation()
        
        DispatchQueue.global().async { [weak self] in
            HotelDataFetcher.fetchData { jsonData in
                DispatchQueue.main.async {
                    self?.imageCollectionView.imageUrls = jsonData.image_urls
                    self?.imageCollectionView.reloadImage()
                    self?.pageControl.numberOfPages = jsonData.image_urls.count
                    
                    self?.loadingIndicatorView.stopAnimation()
                }
            } failure: { error in
                print("Error fetching data: \(error)")
            }
        }
    }
    
    func loadRatingData() {
        DispatchQueue.global().async { [weak self] in
            HotelDataFetcher.fetchData { jsonData in
                DispatchQueue.main.async {
                    let rating = jsonData.rating
                    let ratingName = jsonData.rating_name
                    self?.reitLabel.text = "\(rating) \(ratingName)"
                }
            } failure: { error in
                print("Error fetching data: \(error)")
            }
        }
    }
    
    func loadNameAndLocationData() {
        DispatchQueue.global().async { [weak self] in
            HotelDataFetcher.fetchData { jsonData in
                DispatchQueue.main.async {
                    let name = jsonData.name
                    let location = jsonData.adress
                    let forTourLabel = jsonData.price_for_it
                    self?.nameHotelLabel.text = "\(name)"
                    self?.locationHotelButton.setTitle("\(location)", for: .normal)
                    self?.forTourLabel.text = "\(forTourLabel)"
                }
            } failure: { erorr in
                print("Error fetching data: \(erorr)")
            }
        }
    }
    
    func loadPriceData() {
        DispatchQueue.global().async { [weak self] in
            HotelDataFetcher.fetchData { jsonData in
                DispatchQueue.main.async {
                    let price = jsonData.minimal_price
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    
                    if let formattedPrice = numberFormatter.string(from: price as NSNumber) {
                        self?.priceLabel.text = "от \(formattedPrice) ₽"
                    } else {
                        self?.priceLabel.text = "от \(price) ₽"
                    }
                }
            } failure: { error in
                print("Error fetching data: \(error)")
            }
        }
    }
}
