//
//  SecondViewController.swift
//  FocusStartHomeworks3
//
//  Created by Mikhail Danilov on 01.11.2020.
//

import UIKit

class LoginViewController: UIViewController {

    var loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = loginView
        loginView.configurate()
        
    }

}
