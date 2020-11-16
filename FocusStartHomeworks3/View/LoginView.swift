//
//  FirstView.swift
//  FocusStartHomeworks3
//
//  Created by Mikhail Danilov on 01.11.2020.
//

import UIKit

class LoginView: UIView {
    
    private enum Constants {
        static let loginTextFieldText = "Логин"
        static let passwordTextFieldText = "Пароль"
        static let doneButtonName = "Готово"
        static let widthAnchor240: CGFloat = 240
        static let heightAnchor40: CGFloat = 40
        static let widthAnchor200: CGFloat = 200
        static let bottomAnchor16: CGFloat = 16
        static let bottomAnchor_16: CGFloat = -16
        static let bottomAnchor64: CGFloat = 64
        static let topAnchor74: CGFloat = 74
    }

    private var doneButtonNormal:NSLayoutConstraint!
    private var doneButtonBottomAnchorWithKeyboard: NSLayoutConstraint!
    
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.loginTextFieldText
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.passwordTextFieldText
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()

    let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.doneButtonName, for: .normal)
        button.backgroundColor = .green
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
        loginTextField.widthAnchor.constraint(equalToConstant: Constants.widthAnchor240).isActive = true
        loginTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.topAnchor74).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: Constants.heightAnchor40).isActive = true

        passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: Constants.widthAnchor240).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: Constants.bottomAnchor16).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: Constants.heightAnchor40).isActive = true
        
        doneButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        doneButtonNormal = doneButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.bottomAnchor64)
        doneButtonNormal.isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: Constants.heightAnchor40).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: Constants.widthAnchor200).isActive = true
        
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
            doneButtonBottomAnchorWithKeyboard = doneButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -keyboardHeight + Constants.bottomAnchor16)
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
