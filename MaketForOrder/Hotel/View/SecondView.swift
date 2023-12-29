//
//  SecondView.swift
//  MaketForOrder
//
//  Created by Ratibor on 27.12.2023.
//

import UIKit
import SnapKit

class SecondView: UIView {
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        loadPeculiaritiesData()
        loadDescriptionData()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private properties
    private let aboutHotelLabel: UILabel = {
        let label = UILabel()
        label.text = "Об отеле"
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        return label
    }()
    
    private let stackViewComfort: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        return stackView
    }()
    
    private let firstComforView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = ColorConstants.colorLightGreyForBlock
        return view
    }()
    
    private let secondComforView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = ColorConstants.colorLightGreyForBlock
        return view
    }()
    
    private let thirdComforView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = ColorConstants.colorLightGreyForBlock
        return view
    }()
    
    private let fourthComforView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = ColorConstants.colorLightGreyForBlock
        return view
    }()
    
    private let firsComfortLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading.."
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
    
    private let secondComfortLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading.."
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
    
    private let thirdComfortLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading.."
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
    
    private let fourthComfortLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading.."
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
    
    private let infoAboutHotelLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Loading..."
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = ColorConstants.colorStandartBlack
        return label
    }()
    
    private let serviceView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorConstants.colorLightGreyForBlock
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let serviceStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let emojiHappyImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "emoji-happy")
        return image
    }()
    
    private let forLabelServiceStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let firstEmojiHappyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Удобство", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        button.setTitleColor(ColorConstants.colorBlackForServiceLabel, for: .normal)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    private let secondEmojiHappyLabel: UILabel = {
        let label = UILabel()
        label.text = "Самое необходимое"
        label.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
    
    private let vectorIconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector")
        return image
    }()
    
    private let lineVectorView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = ColorConstants.colorLineVectorView.cgColor
        return view
    }()
    
    private let checkImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "tick")
        return image
    }()
    
    private let forCheckStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let forLabelCheckStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let firstCheckButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Что включено", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        button.setTitleColor(ColorConstants.colorBlackForServiceLabel, for: .normal)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    private let secondCheckLabel: UILabel = {
        let label = UILabel()
        label.text = "Самое необходимое"
        label.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
    
    private let secondVectorIconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector")
        return image
    }()
    
    private let nextLineVectorView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = ColorConstants.colorLineVectorView.cgColor
        return view
    }()
    
    private let crossImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "close")
        return image
    }()
    
    private let forCrossStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let forCrossLabelStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let firstCrossButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Что не включено", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        button.setTitleColor(ColorConstants.colorBlackForServiceLabel, for: .normal)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    private let secondCrossLabel: UILabel = {
        let label = UILabel()
        label.text = "Самое необходимое"
        label.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        label.textColor = ColorConstants.colorStandartGreyForLabel
        return label
    }()
    
    private let thirdVectorIconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector")
        return image
    }()
}

// MARK: - Private methods
private extension SecondView {
    func setupUI() {
        setupSecondView()
        setupAboutComfortHotel()
        setupInfoHotel()
        setupServiceHotel()
    }
    
    func setupSecondView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
    }
    
    func setupAboutComfortHotel() {
        addSubview(aboutHotelLabel)
        aboutHotelLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(26)
        }
        
        addSubview(stackViewComfort)
        stackViewComfort.snp.makeConstraints { make in
            make.top.equalTo(aboutHotelLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-64)
        }
        
        stackViewComfort.addSubview(firstComforView)
        stackViewComfort.addSubview(secondComforView)
        stackViewComfort.addSubview(thirdComforView)
        stackViewComfort.addSubview(fourthComforView)
        
        firstComforView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.equalTo(29)
        }
        
        secondComforView.snp.makeConstraints { make in
            make.top.equalTo(firstComforView.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.height.equalTo(29)
        }
        
        thirdComforView.snp.makeConstraints { make in
            make.top.equalTo(secondComforView.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(29)
        }
        
        fourthComforView.snp.makeConstraints { make in
            make.top.equalTo(firstComforView.snp.bottom).offset(8)
            make.leading.equalTo(secondComforView.snp.trailing).offset(8)
            make.height.equalTo(29)
        }
        
        firstComforView.addSubview(firsComfortLabel)
        firsComfortLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(19)
        }
        
        secondComforView.addSubview(secondComfortLabel)
        secondComfortLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(19)
        }
        
        thirdComforView.addSubview(thirdComfortLabel)
        thirdComfortLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(19)
        }
        
        fourthComforView.addSubview(fourthComfortLabel)
        fourthComfortLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(19)
        }
    }
    
    func setupInfoHotel() {
        addSubview(infoAboutHotelLabel)
        infoAboutHotelLabel.snp.makeConstraints { make in
            make.top.equalTo(stackViewComfort.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    func setupServiceHotel() {
        addSubview(serviceView)
        serviceView.snp.makeConstraints { make in
            make.top.equalTo(infoAboutHotelLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(self.snp.bottom).inset(16)
        }
        
        serviceView.addSubview(serviceStackView)
        serviceStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-159)
            make.height.equalTo(38)
        }
        
        serviceStackView.addSubview(emojiHappyImage)
        emojiHappyImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.leading.equalToSuperview()
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        serviceStackView.addSubview(forLabelServiceStackView)
        forLabelServiceStackView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(36)
        }
        
        forLabelServiceStackView.addSubview(firstEmojiHappyButton)
        firstEmojiHappyButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.top.equalToSuperview()
            make.height.equalTo(19)
        }
        
        forLabelServiceStackView.addSubview(secondEmojiHappyLabel)
        secondEmojiHappyLabel.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(firstEmojiHappyButton.snp.bottom).offset(2)
        }
        
        serviceView.addSubview(vectorIconImage)
        vectorIconImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.trailing.equalToSuperview().offset(-23)
            make.width.equalTo(6)
            make.height.equalTo(12)
        }
        
        serviceView.addSubview(lineVectorView)
        lineVectorView.snp.makeConstraints { make in
            make.top.equalTo(serviceStackView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(53)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(1)
        }
        
        serviceView.addSubview(forCheckStackView)
        forCheckStackView.snp.makeConstraints { make in
            make.top.equalTo(lineVectorView).offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-159)
            make.height.equalTo(38)
        }
        
        forCheckStackView.addSubview(checkImage)
        checkImage.snp.makeConstraints { make in
            make.top.equalTo(forCheckStackView).offset(7)
            make.leading.equalToSuperview()
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        forCheckStackView.addSubview(forLabelCheckStackView)
        forLabelCheckStackView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(36)
        }
        
        forLabelCheckStackView.addSubview(firstCheckButton)
        firstCheckButton.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(19)
        }
        
        forLabelCheckStackView.addSubview(secondCheckLabel)
        secondCheckLabel.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(firstCheckButton.snp.bottom).offset(2)
        }
        
        serviceView.addSubview(nextLineVectorView)
        nextLineVectorView.snp.makeConstraints { make in
            make.top.equalTo(forCheckStackView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(53)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(1)
        }
        
        serviceView.addSubview(secondVectorIconImage)
        secondVectorIconImage.snp.makeConstraints { make in
            make.top.equalTo(forCheckStackView.snp.top).offset(13)
            make.trailing.equalToSuperview().offset(-23)
            make.width.equalTo(6)
            make.height.equalTo(12)
        }
        
        serviceView.addSubview(forCrossStackView)
        forCrossStackView.snp.makeConstraints { make in
            make.top.equalTo(nextLineVectorView).offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-159)
            make.bottom.equalTo(serviceView.snp.bottom).inset(15)
            make.height.equalTo(38)
        }
        
        forCrossStackView.addSubview(crossImage)
        crossImage.snp.makeConstraints { make in
            make.top.equalTo(forCrossStackView).offset(7)
            make.leading.equalToSuperview()
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        forCrossStackView.addSubview(forCrossLabelStackView)
        forCrossLabelStackView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(36)
        }
        
        forCrossLabelStackView.addSubview(firstCrossButton)
        firstCrossButton.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.equalTo(19)
        }
        
        forCrossLabelStackView.addSubview(secondCrossLabel)
        secondCrossLabel.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(firstCrossButton.snp.bottom).offset(2)
        }
        
        serviceView.addSubview(thirdVectorIconImage)
        thirdVectorIconImage.snp.makeConstraints { make in
            make.top.equalTo(forCrossStackView.snp.top).offset(13)
            make.trailing.equalToSuperview().offset(-23)
            make.width.equalTo(6)
            make.height.equalTo(12)
        }
    }
    
    // MARK: API
    func loadPeculiaritiesData() {
        DispatchQueue.global().async { [weak self] in
            HotelDataFetcher.fetchData { jsonData in
                DispatchQueue.main.async {
                    let peculiarities = jsonData.about_the_hotel.peculiarities
                    self?.firsComfortLabel.text = peculiarities[0]
                    self?.secondComfortLabel.text = peculiarities[2]
                    self?.thirdComfortLabel.text = peculiarities[3]
                    self?.fourthComfortLabel.text = peculiarities[1]
                }
            } failure: { error in
                print("Error fetching data: \(error)")
            }
        }
    }
    
    func loadDescriptionData() {
        DispatchQueue.global().async { [weak self] in
            HotelDataFetcher.fetchData { jsonData in
                DispatchQueue.main.async {
                    let description = jsonData.about_the_hotel.description
                    self?.infoAboutHotelLabel.text = description
                }
            } failure: { error in
                print("Error fetching data: \(error)")
            }
            
        }
    }
}
