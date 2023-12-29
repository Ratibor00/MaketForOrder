//
//  FirstBlockView.swift
//  MaketForOrder
//
//  Created by Ratibor on 28.12.2023.
//

import UIKit
import SnapKit

class FirstBlockView: UIView {
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        loadNameHotelData()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Private properites
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
    
    private let labelReit: UILabel = {
        let label = UILabel()
        label.textColor = ColorConstants.colorReitLabel
        label.textAlignment = .center
        label.text = ""
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        return label
    }()
    
    private let nameHotelLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        label.textColor = ColorConstants.colorStandartBlack
        return label
    }()
    
    private let locationHoteButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        button.setTitleColor(ColorConstants.colorLocationHotelLabel, for: .normal)
        button.contentHorizontalAlignment = .left
        return button
    }()
}

// MARK: - Private methods
private extension FirstBlockView {
    func setupUI() {
        setupFirstView()
        stupReitView()
        setupNameLocationHotelLabel()
    }
    
    func setupFirstView() {
        self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.layer.cornerRadius = 15
    }
    
    func stupReitView() {
        addSubview(reitView)
        reitView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(149)
            make.height.equalTo(29)
        }
        
        reitView.addSubview(starInReitView)
        starInReitView.snp.makeConstraints { make in
            make.top.equalTo(reitView.snp.top).offset(7)
            make.leading.equalTo(reitView.snp.leading).offset(10)
            make.width.equalTo(15)
            make.height.equalTo(15)
        }
        
        reitView.addSubview(labelReit)
        labelReit.snp.makeConstraints { make in
            make.top.equalTo(reitView.snp.top).offset(5)
            make.leading.equalTo(starInReitView.snp.trailing).offset(2)
            make.trailing.equalTo(reitView.snp.trailing).offset(-10)
        }
    }
    
    func setupNameLocationHotelLabel() {
        addSubview(nameHotelLabel)
        nameHotelLabel.snp.makeConstraints { make in
            make.top.equalTo(reitView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(26)
        }
        
        addSubview(locationHoteButton)
        locationHoteButton.snp.makeConstraints { make in
            make.top.equalTo(nameHotelLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(17)
        }
    }
    
    func loadNameHotelData() {
        BookingDataFetcher.fetchData { [weak self] jsonData in
            DispatchQueue.main.async {
                let nameHotel = jsonData.hotelName
                let locationHotel = jsonData.hotelAddress
                let rating = jsonData.hotelRating
                let ratingName = jsonData.ratingName
                self?.nameHotelLabel.text = nameHotel
                self?.locationHoteButton.setTitle(locationHotel, for: .normal)
                self?.labelReit.text = "\(rating) \(ratingName)"
            }
        } failure: { error in
            print("Error fetching data: \(error)")
        }
    }
}
