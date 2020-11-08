//
//  MainViewController.swift
//  FocusStartHomeworks4
//
//  Created by Mikhail Danilov on 05.11.2020.
//

import UIKit

class MainViewController: UISplitViewController {

    let tableViewController = TableViewController()
    let detailController = DetailViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let masterNavigationController = UINavigationController(rootViewController: tableViewController)
        let detailNavigationController = UINavigationController(rootViewController: detailController)
        
        tableViewController.delegate = self
        self.viewControllers = [masterNavigationController, detailNavigationController]
    }
}

extension MainViewController: MyTableDelegte {
    func selectData(data: MyData) {
        self.showDetailViewController(detailController, sender: nil)
        detailController.setData(myData: data)
    }
}

