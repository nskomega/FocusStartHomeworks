//
//  ThirdViewController.swift
//  FocusStartHomeworks3
//
//  Created by Mikhail Danilov on 01.11.2020.
//

import UIKit

class InfoViewController: UIViewController {
    
    var infoView = InfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInfoView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
         super.viewWillTransition(to: size, with: coordinator)
        loadInfoView()
     }
    
    func loadInfoView() {
        infoView = InfoView()
        self.view = infoView
        infoView.configure(isLandscape: UIDevice.current.orientation.isLandscape)
    }
}
