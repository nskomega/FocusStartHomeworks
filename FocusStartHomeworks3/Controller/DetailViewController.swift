//
//  DetailViewController.swift
//  FocusStartHomeworks3
//
//  Created by Mikhail Danilov on 01.11.2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailView
        detailView.configurate()
    }
}
