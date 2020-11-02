//
//  FirstView.swift
//  FocusStartHomeworks3
//
//  Created by Mikhail Danilov on 01.11.2020.
//

import UIKit

class LoginView: UIView {

    private var doneButtonNormal:NSLayoutConstraint!
    private var doneButtonBottomAnchorWithKeyboard: NSLayoutConstraint!
    
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Логин"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()

    let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Готово", for: .normal)
        button.backgroundColor = .green
       // button.layer.cornerRadius = Constants.doneButtonCornerRadius
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func configurate() {
        self.backgroundColor = .yellow
        self.addSubview(loginTextField)
        self.addSubview(passwordTextField)
        self.addSubview(doneButton)
        
        loginTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loginTextField.widthAnchor.constraint(equalToConstant: 240).isActive = true
        loginTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 74).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 240).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 16).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        doneButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        doneButtonNormal = doneButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -64)
        doneButtonNormal.isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        setupNotifications()
        hideKeyboardWhenTappedAround()
    }
    
    func setupNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        print(#function)
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            doneButtonBottomAnchorWithKeyboard = doneButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -keyboardHeight - 16)
            if doneButtonNormal.isActive {
             doneButtonNormal.isActive = false
             doneButtonBottomAnchorWithKeyboard.isActive = true
            }
            
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        print(#function)
        doneButtonBottomAnchorWithKeyboard.isActive = false
        doneButtonNormal.isActive = true
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        self.endEditing(true)
        if doneButtonBottomAnchorWithKeyboard != nil {
        doneButtonNormal.isActive = true
        doneButtonBottomAnchorWithKeyboard.isActive = false
        }
    }
    
}
