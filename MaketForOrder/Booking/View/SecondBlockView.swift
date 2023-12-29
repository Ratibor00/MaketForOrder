//
//  SecondBlockView.swift
//  MaketForOrder
//
//  Created by Ratibor on 28.12.2023.
//

import UIKit
import SnapKit

class SecondBlockView: UIView {
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        loadInfoData()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Private properites
    private let departSityLabel: UILabel = {
        let label = UILabel()
        label.text = "Вылет из"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
    
    private let departSityCurrentLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = ColorConstants.colorStandartBlack
        return label
    }()
    
    private let sityLabel: UILabel = {
        let label = UILabel()
        label.text = "Страна, город"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
    
    private let sityCurrentLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = ColorConstants.colorStandartBlack
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Даты"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
    
    private let dateCurrentLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = ColorConstants.colorStandartBlack
        return label
    }()
    
    private let numberOfNightLabel: UILabel = {
        let label = UILabel()
        label.text = "Кол-во ночей"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
    
    private let numberOfNightCurrentLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = ColorConstants.colorStandartBlack
        return label
    }()
    
    private let hotelLabel: UILabel = {
        let label = UILabel()
        label.text = "Отель"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
    
    private let hotelCurrentLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = ColorConstants.colorStandartBlack
        return label
    }()
    
    private let roomLabel: UILabel = {
        let label = UILabel()
        label.text = "Номер"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
    
    let roomCurrentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "1"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 15)
        label.textColor = ColorConstants.colorStandartBlack
        return label
    }()
    
    private let foodLabel: UILabel = {
        let label = UILabel()
        label.text = "Питание"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
    
    private let foodCurrentLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = ColorConstants.colorStandartBlack
        return label
    }()
}

// MARK: - Private methods
private extension SecondBlockView {
    func setupUI() {
        setupSeconView()
        setupDepartSityLabel()
        setupSityLabel()
        setupDateLabel()
        setupNumberOfNight()
        setupHotelLabel()
        setupRoomLabel()
        setupFoodLabel()
    }
    
    func setupSeconView() {
        self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.layer.cornerRadius = 15
    }
    
    func setupDepartSityLabel() {
        addSubview(departSityLabel)
        departSityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(64)
            make.height.equalTo(19)
        }
        
        addSubview(departSityCurrentLabel)
        departSityCurrentLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(departSityLabel.snp.trailing).offset(76)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(19)
        }
    }
    
    func setupSityLabel() {
        addSubview(sityLabel)
        sityLabel.snp.makeConstraints { make in
            make.top.equalTo(departSityLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(101)
            make.height.equalTo(19)
        }
        
        addSubview(sityCurrentLabel)
        sityCurrentLabel.snp.makeConstraints { make in
            make.top.equalTo(departSityCurrentLabel.snp.bottom).offset(16)
            make.leading.equalTo(sityLabel.snp.trailing).offset(39)
            make.height.equalTo(19)
        }
    }
    
    func setupDateLabel() {
        addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(sityLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(37)
            make.height.equalTo(19)
        }
        
        addSubview(dateCurrentLabel)
        dateCurrentLabel.snp.makeConstraints { make in
            make.top.equalTo(sityCurrentLabel.snp.bottom).offset(16)
            make.leading.equalTo(dateLabel.snp.trailing).offset(103)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(19)
        }
    }
    
    func setupNumberOfNight() {
        addSubview(numberOfNightLabel)
        numberOfNightLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(96)
            make.height.equalTo(19)
        }
        
        addSubview(numberOfNightCurrentLabel)
        numberOfNightCurrentLabel.snp.makeConstraints { make in
            make.top.equalTo(dateCurrentLabel.snp.bottom).offset(16)
            make.leading.equalTo(numberOfNightLabel.snp.trailing).offset(44)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(19)
        }
    }
    
    func setupHotelLabel() {
        addSubview(hotelLabel)
        hotelLabel.snp.makeConstraints { make in
            make.top.equalTo(numberOfNightLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(43)
            make.height.equalTo(19)
        }
        
        addSubview(hotelCurrentLabel)
        hotelCurrentLabel.snp.makeConstraints { make in
            make.top.equalTo(numberOfNightCurrentLabel.snp.bottom).offset(16)
            make.leading.equalTo(hotelLabel.snp.trailing).offset(97)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(19)
        }
    }
    
    func setupRoomLabel() {
        addSubview(roomLabel)
        roomLabel.snp.makeConstraints { make in
            make.top.equalTo(hotelLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(49)
            make.height.equalTo(19)
        }
        
        addSubview(roomCurrentLabel)
        roomCurrentLabel.snp.makeConstraints { make in
            make.top.equalTo(hotelCurrentLabel.snp.bottom).offset(16)
            make.leading.equalTo(roomLabel.snp.trailing).offset(91)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(38)
        }
    }
    
    func setupFoodLabel() {
        addSubview(foodLabel)
        foodLabel.snp.makeConstraints { make in
            make.top.equalTo(roomCurrentLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(61)
            make.height.equalTo(19)
        }
        
        addSubview(foodCurrentLabel)
        foodCurrentLabel.snp.makeConstraints { make in
            make.top.equalTo(roomCurrentLabel.snp.bottom).offset(16)
            make.leading.equalTo(foodLabel.snp.trailing).offset(79)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(19)
        }
    }
    
    func loadInfoData() {
        BookingDataFetcher.fetchData { [ weak self ] jsonData in
            DispatchQueue.main.async {
                let departure = jsonData.departure
                let arrivalCountry = jsonData.arrivalCountry
                let tourDateStart = jsonData.tourDateStart
                let tourDateStop = jsonData.tourDateStop
                let hotelName = jsonData.hotelName
                let numberOfNight = jsonData.numberOfNights
                let room = jsonData.room
                let nutrition = jsonData.nutrition
                
                self?.departSityCurrentLabel.text = departure
                self?.sityCurrentLabel.text = arrivalCountry
                self?.numberOfNightCurrentLabel.text = "\(numberOfNight) ночей"
                self?.dateCurrentLabel.text = "\(tourDateStart) - \(tourDateStop)"
                self?.hotelCurrentLabel.text = hotelName
                self?.roomCurrentLabel.text = room
                self?.foodCurrentLabel.text = nutrition
                
            }
        } failure: { error in
            print("Error fetching data: \(error)")
        }
    }
}
