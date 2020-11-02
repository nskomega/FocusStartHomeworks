//
//  FirstViewController.swift
//  FocusStartHomeworks3
//
//  Created by Mikhail Danilov on 01.11.2020.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    func configure () {
        let detailVC = DetailViewController()
        let infoVC = InfoViewController()
        let loginVC = LoginViewController()

        let detailVCButton = UITabBarItem(title: "Detail", image: nil, tag: 0)
        detailVC.tabBarItem = detailVCButton

        let infoVCButton = UITabBarItem(title: "Info", image: nil, tag: 1)
        infoVC.tabBarItem = infoVCButton
        
        let loginVCButton = UITabBarItem(title: "Login", image: nil, tag: 2)
        loginVC.tabBarItem = loginVCButton
    
        self.viewControllers = [detailVC, infoVC, loginVC]
        self.selectedIndex = 0
    }
}
