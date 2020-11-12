//
//  SecondViewController.swift
//  FocusStartHomeworks5
//
//  Created by Mikhail Danilov on 11.11.2020.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let markaTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Marka"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let modelTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Model"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let gosNomerTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "GosNomer"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var viewModel: SecondViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(backButton)
        view.addSubview(markaTextfield)
        view.addSubview(modelTextfield)
        view.addSubview(gosNomerTextfield)
        
        view.addSubview(saveButton)
        
        backButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        backButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 54).isActive = true
        
        markaTextfield.widthAnchor.constraint(equalToConstant: 200).isActive = true
        markaTextfield.heightAnchor.constraint(equalToConstant: 50).isActive = true
        markaTextfield.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        markaTextfield.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: 16).isActive = true
        
        modelTextfield.widthAnchor.constraint(equalToConstant: 200).isActive = true
        modelTextfield.heightAnchor.constraint(equalToConstant: 50).isActive = true
        modelTextfield.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        modelTextfield.topAnchor.constraint(equalTo: self.markaTextfield.bottomAnchor, constant: 16).isActive = true
        
        gosNomerTextfield.widthAnchor.constraint(equalToConstant: 200).isActive = true
        gosNomerTextfield.heightAnchor.constraint(equalToConstant: 50).isActive = true
        gosNomerTextfield.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        gosNomerTextfield.topAnchor.constraint(equalTo: self.modelTextfield.bottomAnchor, constant: 16).isActive = true
        
        
        saveButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        saveButton.topAnchor.constraint(equalTo: self.gosNomerTextfield.bottomAnchor, constant: 32).isActive = true
        
        
    }
    
    func setup(viewModel: SecondViewModelProtocol) {
        self.viewModel = viewModel
        backButton.addTarget(self, action: #selector(tapBack), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(tapSaveButton), for: .touchUpInside)
    }
    
    
    @objc func tapSaveButton() {
        if let marka = markaTextfield.text, let model = modelTextfield.text, let gosNomer = gosNomerTextfield.text {
            viewModel?.saveCar(marka: marka, model: model, gosNomer: gosNomer)
        }
    }
    
    @objc func tapBack() {
        viewModel?.tapBack()
    }
}
