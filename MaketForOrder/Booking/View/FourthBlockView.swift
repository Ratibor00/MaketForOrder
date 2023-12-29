//
//  FourthBlockView.swift
//  MaketForOrder
//
//  Created by Ratibor on 28.12.2023.
//

import UIKit
import SnapKit

class FourthBlockView: UIView {
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private properties
    private var expend = true
    internal lazy var textFields: [UITextField] = [nameTextField, surnameTextField, dateBirthTextField, citizenTextField, paspotNumberTextField, validityPasportTextField]
    
    let firstTuristLabel: UILabel = {
        let label = UILabel()
        label.text = "Первый турист"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 22)
        label.textColor = UIColor.black
        return label
    }()
    
    private let firstVectorButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "VectorDown"), for: .normal)
        button.backgroundColor = UIColor(red: 13/255.0, green: 114/255.0, blue: 255/255.0, alpha: 0.1)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(toogleView), for: .touchUpInside)
        return button
    }()
    
    let nameTextField: UITextField = {
        return setupTextField(placeholder: "Имя", keyboardType: .default)
    }()
    
    let surnameTextField: UITextField = {
        return setupTextField(placeholder: "Фамилия", keyboardType: .default)
    }()
    
    let dateBirthTextField: UITextField = {
        return setupTextField(placeholder: "Дата рождения", keyboardType: .default)
    }()
    
    let citizenTextField: UITextField = {
        return setupTextField(placeholder: "Гражданство", keyboardType: .default)
    }()
    
    let paspotNumberTextField: UITextField = {
        return setupTextField(placeholder: "Номер загранпаспорта", keyboardType: .default)
    }()
    
    let validityPasportTextField: UITextField = {
        return setupTextField(placeholder: "Срок действия загран паспорта", keyboardType: .default)
    }()
    
    private let nameLabel: UILabel = {
        return setupLabel(text: "Имя")
    }()
    
    private let surnameLabel: UILabel = {
        return setupLabel(text: "Фамилия")
    }()
    
    private let dateBirthLabel: UILabel = {
        return setupLabel(text: "Дата рождения")
    }()
    
    private let citizenLabel: UILabel = {
        return setupLabel(text: "Гражданство")
    }()
    
    private let pasportNumberLabel: UILabel = {
        return setupLabel(text: "Номер загранпаспорта")
    }()
    
    private let validityPasportLabel: UILabel = {
        return setupLabel(text: "Срок действия загранпаспорта")
    }()
}

// MARK: - Private methods
private extension FourthBlockView {
    func initialize() {
        self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.layer.cornerRadius = 15
        
        addSubview(firstTuristLabel)
        firstTuristLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(152)
            make.height.equalTo(26)
        }
        
        addSubview(firstVectorButton)
        firstVectorButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.leading.equalTo(firstTuristLabel.snp.trailing).offset(159)
            make.width.equalTo(32)
            make.height.equalTo(32)
        }
        
        addSubview(nameTextField)
        nameTextField.delegate = self
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstTuristLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(343)
            make.height.equalTo(52)
        }
        
        addSubview(surnameTextField)
        surnameTextField.delegate = self
        surnameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(343)
            make.height.equalTo(52)
        }
        
        addSubview(dateBirthTextField)
        dateBirthTextField.delegate = self
        dateBirthTextField.snp.makeConstraints { make in
            make.top.equalTo(surnameTextField.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(343)
            make.height.equalTo(52)
        }
        
        addSubview(citizenTextField)
        citizenTextField.delegate = self
        citizenTextField.snp.makeConstraints { make in
            make.top.equalTo(dateBirthTextField.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(343)
            make.height.equalTo(52)
        }
        
        addSubview(paspotNumberTextField)
        paspotNumberTextField.delegate = self
        paspotNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(citizenTextField.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(343)
            make.height.equalTo(52)
        }
        
        addSubview(validityPasportTextField)
        validityPasportTextField.delegate = self
        validityPasportTextField.snp.makeConstraints { make in
            make.top.equalTo(paspotNumberTextField.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(343)
            make.height.equalTo(52)
        }
        
        nameTextField.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(14)
        }
        
        surnameTextField.addSubview(surnameLabel)
        surnameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(14)
        }
        
        dateBirthTextField.addSubview(dateBirthLabel)
        dateBirthLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(14)
        }
        
        citizenTextField.addSubview(citizenLabel)
        citizenLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(14)
        }
        
        paspotNumberTextField.addSubview(pasportNumberLabel)
        pasportNumberLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(14)
        }
        
        validityPasportTextField.addSubview(validityPasportLabel)
        validityPasportLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(14)
        }
    }
    
    private static func setupTextField(placeholder: String, keyboardType: UIKeyboardType) -> UITextField {
        let textField = PaddingTextField()
        textField.placeholder = placeholder
        textField.textColor = .black
        textField.autocapitalizationType = .words
        textField.backgroundColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        textField.layer.cornerRadius = 10
        textField.keyboardType = keyboardType
        textField.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        textField.contentVerticalAlignment = .bottom
        textField.alpha = 0
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray]
        let attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderAttributes)
        textField.attributedPlaceholder = attributedPlaceholder
        return textField
    }
    
    private static func setupLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        label.textColor = UIColor(red: 169/255.0, green: 171/255.0, blue: 183/255.0, alpha: 1.0)
        label.isHidden = true
        return label
    }
    
    @objc func toogleView() {
        UIView.animate(withDuration: 0.5) {
            if self.expend {
                self.snp.updateConstraints { make in
                    make.height.equalTo(430)
                    self.firstVectorButton.setImage(UIImage(named: "VectorUp"), for: .normal)
                }
                self.textFields.forEach { $0.alpha = 1 }
            } else {
                self.snp.updateConstraints { make in
                    make.height.equalTo(58)
                    self.firstVectorButton.setImage(UIImage(named: "VectorDown"), for: .normal)
                }
                self.textFields.forEach { $0.alpha = 0 }
            }
            self.superview?.layoutIfNeeded()
        }
        self.expend = !self.expend
    }
}

// MARK: - UITextFieldDelegate
extension FourthBlockView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == nameTextField {
            nameTextField.backgroundColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        } else if textField == surnameTextField {
            surnameTextField.backgroundColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        } else if textField == dateBirthTextField {
            dateBirthTextField.backgroundColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        } else if textField == citizenTextField {
            citizenTextField.backgroundColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        } else if textField == paspotNumberTextField {
            paspotNumberTextField.backgroundColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        } else if textField == validityPasportTextField {
            validityPasportTextField.backgroundColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        }
        
        let hasText = !(string.isEmpty && range.length == 1)
        
        if textField == nameTextField {
            nameLabel.isHidden = !hasText
        } else if textField == surnameTextField {
            surnameLabel.isHidden = !hasText
        } else if textField == dateBirthTextField {
            dateBirthLabel.isHidden = !hasText
        } else if textField == citizenTextField {
            citizenLabel.isHidden = !hasText
        } else if textField == paspotNumberTextField {
            pasportNumberLabel.isHidden = !hasText
        } else if textField == validityPasportTextField {
            validityPasportLabel.isHidden = !hasText
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
