//
//  ThirdBlockView.swift
//  MaketForOrder
//
//  Created by Ratibor on 28.12.2023.
//

import UIKit
import SnapKit

class ThirdBlockView: UIView {
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        gestureTap()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Private properties
    private var currentDigits: String = ""
    
    internal lazy var textFields: [UITextField] = [numberTextField, mailTextField]
    
    private let infoBuyerLabel: UILabel = {
        let label = UILabel()
        label.text = "Информация о покупателе"
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        label.textColor = ColorConstants.colorStandartBlack
        return label
    }()
    
    private let numberTextField: UITextField = {
        let textField = PaddingTextField()
        textField.textColor = .black
        textField.backgroundColor = ColorConstants.colorBackgroundTextField
        textField.layer.cornerRadius = 10
        textField.keyboardType = .numberPad
        textField.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        textField.contentVerticalAlignment = .bottom
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray]
        let attributedPlaceholder = NSAttributedString(string: "+7 (***) ***-**-**", attributes: placeholderAttributes)
        textField.attributedPlaceholder = attributedPlaceholder
        return textField
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "Номер телефона"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        label.textColor = ColorConstants.colorRepeatLableTextField
        label.isHidden = true
        return label
    }()
    
    private let mailTextField: UITextField = {
        let textField = PaddingTextField()
        textField.textColor = .black
        textField.backgroundColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        textField.layer.cornerRadius = 10
        textField.keyboardType = .default
        textField.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        textField.contentVerticalAlignment = .bottom
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray]
        let attributedPlaceholder = NSAttributedString(string: "Почта", attributes: placeholderAttributes)
        textField.attributedPlaceholder = attributedPlaceholder
        return textField
    }()
    
    private let mailLabel: UILabel = {
        let label = UILabel()
        label.text = "Почта"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        label.textColor = UIColor(red: 169/255.0, green: 171/255.0, blue: 183/255.0, alpha: 1.0)
        label.isHidden = true
        return label
    }()
    
    private let privacyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = UIColor(red: 169/255.0, green: 171/255.0, blue: 183/255.0, alpha: 1.0)
        return label
    }()
}

//MARK: - Private methods
private extension ThirdBlockView {
    func setupUI() {
        setupThirdView()
        setupInfoBuyerLabel()
        setupNumberTextField()
        setupMailTetxField()
        setupPrivacyLabel()
    }
    
    func setupThirdView() {
        self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.layer.cornerRadius = 15
    }
    
    func setupInfoBuyerLabel() {
        addSubview(infoBuyerLabel)
        infoBuyerLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(26)
        }
    }
    
    func setupNumberTextField() {
        addSubview(numberTextField)
        numberTextField.delegate = self
        numberTextField.snp.makeConstraints { make in
            make.top.equalTo(infoBuyerLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(52)
        }
        
        numberTextField.addSubview(numberLabel)
        numberLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(14)
        }
    }
    
    func setupMailTetxField() {
        addSubview(mailTextField)
        mailTextField.delegate = self
        mailTextField.snp.makeConstraints { make in
            make.top.equalTo(numberTextField.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(52)
        }
        
        mailTextField.addSubview(mailLabel)
        mailLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(14)
        }
    }
    
    func setupPrivacyLabel() {
        addSubview(privacyLabel)
        privacyLabel.snp.makeConstraints { make in
            make.top.equalTo(mailTextField.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(34)
        }
    }
    
    func updateMaskedText() {
        var maskedText = "+7 ("
        
        let digits = Array(currentDigits)
        
        for (index, digit) in digits.enumerated() {
            if index == 3 {
                maskedText += ") "
            } else if index == 7 || index == 9 {
                maskedText += "-\(digit)"
            } else {
                maskedText.append(digit)
            }
        }
        numberTextField.text = maskedText
    }
    
    func validateEmail(email: String?) -> Bool {
        guard let email = email else {
            return false
        }
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func gestureTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dissmisKey))
    }
    
    @objc func dissmisKey() {
        self.endEditing(true)
    }
}

// MARK: - UITextFieldDelegate
extension ThirdBlockView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let hasText = !(string.isEmpty && range.length == 1)
        
        if textField == numberTextField {
            if string.isEmpty {
                currentDigits = String(currentDigits.dropLast())
            } else {
                guard CharacterSet(charactersIn: string).isSubset(of: CharacterSet(charactersIn: "0123456789")),
                      currentDigits.count < 11 else {
                    return false
                }
                currentDigits.append(string)
            }
            updateMaskedText()
            numberLabel.isHidden = !hasText
        }
        
        if textField == mailTextField {
            mailLabel.isHidden = !hasText
            return true
        }
        return false
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == numberTextField {
            let isPhoneNumberComplete = currentDigits.count == 11
            
            if !numberTextField.hasText == isPhoneNumberComplete {
                numberTextField.backgroundColor = UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 0.15)
            } else {
                numberTextField.backgroundColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
            }
        } else if textField == mailTextField {
            let isEmailValid = validateEmail(email: mailTextField.text)
            
            if !isEmailValid {
                mailTextField.backgroundColor = UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 0.15)
            } else {
                mailTextField.backgroundColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
            }
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        for i in textFields {
            i.resignFirstResponder()
        }
        return true
    }
}
