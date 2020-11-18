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
        tableViewController.delegate = self
        
        self.viewControllers = [masterNavigationController]
        
        let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
        if deviceIdiom == .pad {
            preferredDisplayMode = .allVisible
            if tableViewController.list.count > 0 {
                show(news: tableViewController.list[0])
            }
        }
    }
}

extension MainViewController: IMyTableDelegte {
    func show(news: News) {
        let detailNavigationController = UINavigationController(rootViewController: detailController)
        self.showDetailViewController(detailNavigationController, sender: nil)
        detailController.setData(news: news)
    }
}

