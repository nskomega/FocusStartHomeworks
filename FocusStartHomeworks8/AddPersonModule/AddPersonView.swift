//
//  AddPersonView.swift
//  FocusStartHomeworks8
//
//  Created by Mikhail Danilov on 06.12.2020.
//

import UIKit
import SnapKit
import RxSwift

class AddPersonView: UIView {

    private var viewModel: AddPersonViewModelProtocol?
    private let disposeBag = DisposeBag()
    
    // MARK: - Constants
    private enum Constants {
        static let labelSetTitle = "Добавить нового сотрудника"
        static let nameTextFieldPlaceholder = "Имя сотрудника"
        static let ageTextFieldPlaceholder = "Возвраст"
        static let workExperienceTextFieldPlaceholder = "Стаж работы"
        static let educationTextFieldPlaceholder = "Образование"
        static let positionPlaceholder = "Должность"
        static let addSetTitleButton = "Добавить сотрудника"
        static let labelTextSize20: CGFloat = 20
        static let constraint200: CGFloat = 200
        static let constraint250: CGFloat = 250
        static let constraint30: CGFloat = 30
        static let constraint8: CGFloat = 8
    }
    
    // MARK: - Subviews
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.labelSetTitle
        label.textAlignment = .center
        label.textColor = .black
        label.font = label.font.withSize(Constants.labelTextSize20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.nameTextFieldPlaceholder
        
        return textField
    }()
    
    private let ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.ageTextFieldPlaceholder
        
        return textField
    }()
    
    private let workExperienceTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.workExperienceTextFieldPlaceholder
        
        return textField
    }()
    
    private let educationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.educationTextFieldPlaceholder
        
        return textField
    }()
    
    private let positionTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.positionPlaceholder
        
        return textField
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.addSetTitleButton, for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()

    // MARK: Methods
    func setup(viewModel: AddPersonViewModelProtocol) {
        self.viewModel = viewModel
        
        loadView()
        
        addButton.rx.tap.subscribe(onNext: { [weak self] _ in
            
            let name = self?.nameTextField.text ?? ""
            let age = Int(self?.ageTextField.text ?? "0") ?? 0
            let experience = Int(self?.workExperienceTextField.text ?? "0") ?? 0
            let education = self?.educationTextField.text ?? ""
            let position = self?.positionTextField.text ?? ""
            
            self?.viewModel?.tapSavePerson(name: name, age: age, experience: experience, education: education, position: position)
        }).disposed(by: disposeBag)
    }
    
    func loadView() {
        self.addSubview(titleLabel)
        self.addSubview(nameTextField)
        self.addSubview(ageTextField)
        self.addSubview(workExperienceTextField)
        self.addSubview(educationTextField)
        self.addSubview(positionTextField)
        self.addSubview(addButton)
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-Constants.constraint250)
            $0.width.equalTo(Constants.constraint200)
            $0.height.equalTo(Constants.constraint30)
        }
        
        nameTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(Constants.constraint8)
            $0.width.equalTo(Constants.constraint200)
            $0.height.equalTo(Constants.constraint30)
        }
        
        ageTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(nameTextField.snp.bottom).offset(Constants.constraint8)
            $0.width.equalTo(Constants.constraint200)
            $0.height.equalTo(Constants.constraint30)
        }
        
        workExperienceTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(ageTextField.snp.bottom).offset(Constants.constraint8)
            $0.width.equalTo(Constants.constraint200)
            $0.height.equalTo(Constants.constraint30)
        }
        
        educationTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(workExperienceTextField.snp.bottom).offset(Constants.constraint8)
            $0.width.equalTo(Constants.constraint200)
            $0.height.equalTo(Constants.constraint30)
        }
        
        positionTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(educationTextField.snp.bottom).offset(Constants.constraint8)
            $0.width.equalTo(Constants.constraint200)
            $0.height.equalTo(Constants.constraint30)
        }
        
        addButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(positionTextField.snp.bottom).offset(Constants.constraint8)
            $0.width.equalTo(Constants.constraint200)
            $0.height.equalTo(Constants.constraint30)
        }
    }
}
