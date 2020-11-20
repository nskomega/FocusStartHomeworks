//
//  SecondView.swift
//  FocusStartHomeworks5
//
//  Created by Mikhail Danilov on 20.11.2020.
//

import UIKit

class SecondView: UIView {
    
    private enum Constants {
        static let backButtonTitle = "Back"
        static let markaTextfieldTitle = "Marka"
        static let modelTextfieldTitle = "Model"
        static let gosNomerTextfieldTitle = "GosNomer"
        static let saveButtonTitle = "Save"
        static let anchor50: CGFloat = 50
        static let anchor16: CGFloat = 16
        static let anchor200: CGFloat = 200
        static let anchor32: CGFloat = 32
        static let anchor54: CGFloat = 54
    }
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.backButtonTitle, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var markaTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.markaTextfieldTitle
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var modelTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.modelTextfieldTitle
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var gosNomerTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.gosNomerTextfieldTitle
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.saveButtonTitle, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var viewModel: SecondViewModelProtocol?
    
    func setup(viewModel: SecondViewModelProtocol) {
        self.backgroundColor = .white
        
        self.viewModel = viewModel
        backButton.addTarget(self, action: #selector(tapBack), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(tapSaveButton), for: .touchUpInside)
        build()
    }
    
    @objc func tapSaveButton() {
        if let marka = markaTextfield.text, let model = modelTextfield.text, let gosNomer = gosNomerTextfield.text {
            viewModel?.saveCar(marka: marka, model: model, gosNomer: gosNomer)
        }
    }
    
    @objc func tapBack() {
        viewModel?.tapBack()
    }
    
    private func build() {
        
        self.addSubview(backButton)
        self.addSubview(markaTextfield)
        self.addSubview(modelTextfield)
        self.addSubview(gosNomerTextfield)
        self.addSubview(saveButton)
        
        backButton.widthAnchor.constraint(equalToConstant: Constants.anchor50).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: Constants.anchor50).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.anchor16).isActive = true
        backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.anchor54).isActive = true
        
        markaTextfield.widthAnchor.constraint(equalToConstant: Constants.anchor200).isActive = true
        markaTextfield.heightAnchor.constraint(equalToConstant: Constants.anchor50).isActive = true
        markaTextfield.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        markaTextfield.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: Constants.anchor16).isActive = true
        
        modelTextfield.widthAnchor.constraint(equalToConstant: Constants.anchor200).isActive = true
        modelTextfield.heightAnchor.constraint(equalToConstant: Constants.anchor50).isActive = true
        modelTextfield.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        modelTextfield.topAnchor.constraint(equalTo: self.markaTextfield.bottomAnchor, constant: Constants.anchor16).isActive = true
        
        gosNomerTextfield.widthAnchor.constraint(equalToConstant: Constants.anchor200).isActive = true
        gosNomerTextfield.heightAnchor.constraint(equalToConstant: Constants.anchor50).isActive = true
        gosNomerTextfield.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        gosNomerTextfield.topAnchor.constraint(equalTo: self.modelTextfield.bottomAnchor, constant: Constants.anchor16).isActive = true
        
        saveButton.widthAnchor.constraint(equalToConstant: Constants.anchor200).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: Constants.anchor50).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        saveButton.topAnchor.constraint(equalTo: self.gosNomerTextfield.bottomAnchor, constant: Constants.anchor32).isActive = true
    }
}
