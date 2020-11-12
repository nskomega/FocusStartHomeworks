//
//  AppDelegate.swift
//  FocusStartHomeworks5
//
//  Created by Mikhail Danilov on 11.11.2020.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            
            if let window = appDelegate.window  {
                
                let viewController = MainViewController()
                let router = MainViewRouter(view: viewController)
                let viewModel = MainViewModel(router: router)
                
                viewController.setup(viewModel: viewModel)
                
                let navigationController = UINavigationController(rootViewController: viewController)
                navigationController.setNavigationBarHidden(true, animated: false)
                window.rootViewController = navigationController
                window.makeKeyAndVisible()
            }
        }
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return true
    }
}
