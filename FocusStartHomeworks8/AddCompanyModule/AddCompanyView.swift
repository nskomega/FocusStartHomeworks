//
//  AddCompanyView.swift
//  FocusStartHomeworks8
//
//  Created by Mikhail Danilov on 06.12.2020.
//

import UIKit
import SnapKit
import RxSwift

class AddCompanyView: UIView {
    
    private var viewModel: AddCompanyViewModelProtocol?
    private let disposeBag = DisposeBag()
    
    // MARK: - Constants
    private enum Constants {
        static let labelSetTitleAccount = "Добавление новой компании"
        static let nameTextFieldPlaceholder = "Название компании"
        static let addSetTitleButton = "Сохранить компанию"
        static let labelTextSize20: CGFloat = 20
        static let constraint200: CGFloat = 200
        static let constraint250: CGFloat = 250
        static let constraint30: CGFloat = 30
        static let constraint8: CGFloat = 8
    }
    
    // MARK: - Subviews
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.labelSetTitleAccount
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
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.addSetTitleButton, for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
    
        return button
    }()
    
    // MARK: Methods
    func setup(viewModel: AddCompanyViewModelProtocol) {
        self.viewModel = viewModel
        
        loadView()
        
        addButton.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let name = self?.nameTextField.text, name.count > 0 else { return }
            self?.viewModel?.tapSaveNewCompany(name: name)
        })
    }
    
    func loadView() {
        self.addSubview(titleLabel)
        self.addSubview(nameTextField)
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
        
        addButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(nameTextField.snp.bottom).offset(Constants.constraint8)
            $0.width.equalTo(Constants.constraint200)
            $0.height.equalTo(Constants.constraint30)
        }
    }
}
