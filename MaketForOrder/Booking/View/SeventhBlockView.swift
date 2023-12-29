//
//  SeventhBlockView.swift
//  MaketForOrder
//
//  Created by Ratibor on 28.12.2023.
//

import UIKit
import SnapKit

class SeventhBlockView: UIView {
    
    //MARK: Public
    var totalPriceUpdatedHandler: ((String) -> Void)?
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        loadInfoData()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Private properites
    private let turLabel: UILabel = {
        let label = UILabel()
        label.text = "Тур"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = UIColor(red: 130/255.0, green: 135/255.0, blue: 150/255.0, alpha: 1.0)
        return label
    }()
    
    private let turPriceLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .right
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = UIColor.black
        return label
    }()
    
    private let fuelLabel: UILabel = {
        let label = UILabel()
        label.text = "Топливный сбор"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = UIColor(red: 130/255.0, green: 135/255.0, blue: 150/255.0, alpha: 1.0)
        return label
    }()
    
    private let fuelPriceLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .right
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = UIColor.black
        return label
    }()
    
    private let serviceLabel: UILabel = {
        let label = UILabel()
        label.text = "Сервисный сбор"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = UIColor(red: 130/255.0, green: 135/255.0, blue: 150/255.0, alpha: 1.0)
        return label
    }()
    
    private let servicePriceLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .right
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = UIColor.black
        return label
    }()
    
    private let toPayLabel: UILabel = {
        let label = UILabel()
        label.text = "К оплате"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = UIColor(red: 130/255.0, green: 135/255.0, blue: 150/255.0, alpha: 1.0)
        return label
    }()
    
    let toPayPriceLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .right
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = UIColor(red: 13/255.0, green: 114/255.0, blue: 255/255.0, alpha: 1.0)
        return label
    }()
}

// MARK: - Private methods
private extension SeventhBlockView {
    func initialize() {
        self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.layer.cornerRadius = 15
        
        addSubview(turLabel)
        turLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(26)
            make.height.equalTo(19)
        }
        
        addSubview(turPriceLabel)
        turPriceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(turLabel.snp.trailing).offset(185)
            make.height.equalTo(19)
            make.width.equalTo(132)
        }
        
        addSubview(fuelLabel)
        fuelLabel.snp.makeConstraints { make in
            make.top.equalTo(turLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(116)
            make.height.equalTo(19)
        }
        
        addSubview(fuelPriceLabel)
        fuelPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(turPriceLabel.snp.bottom).offset(16)
            make.leading.equalTo(fuelLabel.snp.trailing).offset(95)
            make.height.equalTo(19)
            make.width.equalTo(132)
        }
        
        addSubview(serviceLabel)
        serviceLabel.snp.makeConstraints { make in
            make.top.equalTo(fuelLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(119)
            make.height.equalTo(19)
        }
        
        addSubview(servicePriceLabel)
        servicePriceLabel.snp.makeConstraints { make in
            make.top.equalTo(fuelPriceLabel.snp.bottom).offset(16)
            make.leading.equalTo(serviceLabel.snp.trailing).offset(92)
            make.height.equalTo(19)
            make.width.equalTo(132)
        }
        
        addSubview(toPayLabel)
        toPayLabel.snp.makeConstraints { make in
            make.top.equalTo(serviceLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(63)
            make.height.equalTo(19)
        }
        
        addSubview(toPayPriceLabel)
        toPayPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(servicePriceLabel.snp.bottom).offset(16)
            make.leading.equalTo(toPayLabel.snp.trailing).offset(148)
            make.height.equalTo(19)
            make.width.equalTo(132)
        }
    }
    
    func loadInfoData() {
        BookingDataFetcher.fetchData { [ weak self ] jsonData in
            DispatchQueue.main.async {
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                
                if let tourPriceFormatted = numberFormatter.string(from: NSNumber(value: jsonData.tourPrice)) {
                    self?.turPriceLabel.text = "\(tourPriceFormatted) ₽"
                } else {
                    self?.turPriceLabel.text = "\(jsonData.tourPrice) ₽"
                }
                
                if let fuelChargeFormatted = numberFormatter.string(from: NSNumber(value: jsonData.fuelCharge)) {
                    self?.fuelPriceLabel.text = "\(fuelChargeFormatted) ₽"
                } else {
                    self?.fuelPriceLabel.text = "\(jsonData.fuelCharge) ₽"
                }
                
                if let serviceChargeFormatted = numberFormatter.string(from: NSNumber(value: jsonData.serviceCharge)) {
                    self?.servicePriceLabel.text = "\(serviceChargeFormatted) ₽"
                } else {
                    self?.servicePriceLabel.text = "\(jsonData.serviceCharge) ₽"
                }
                
                let totalPrice = jsonData.tourPrice + jsonData.fuelCharge + jsonData.serviceCharge
                
                if let totalPriceFormatted = numberFormatter.string(from: totalPrice as NSNumber) {
                    self?.toPayPriceLabel.text = "\(totalPriceFormatted) ₽"
                    self?.totalPriceUpdatedHandler?("\(totalPriceFormatted) ₽")
                } else {
                    self?.toPayPriceLabel.text = "\(totalPrice) ₽"
                    self?.totalPriceUpdatedHandler?("\(totalPrice) ₽")
                }
            }
        } failure: { error in
            print("Error fetching data: \(error)")
        }
    }
}
