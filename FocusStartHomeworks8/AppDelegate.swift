//
//  AppDelegate.swift
//  FocusStartHomeworks8
//
//  Created by Mikhail Danilov on 06.12.2020.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            
            if let window = appDelegate.window  {
                let dataService = DataService()
                let vc = ModuleBuilder.companyVC(dataService: dataService)
                let navigationController = UINavigationController(rootViewController: vc)
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
