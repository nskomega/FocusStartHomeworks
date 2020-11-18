//
//  AppDelegate.swift
//  FocusStartHomeworks4
//
//  Created by Mikhail Danilov on 05.11.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
          // Override point for customization after application launch.
        let splitViewController =  MainViewController()

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = splitViewController
        self.window!.makeKeyAndVisible()
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Registration(google firebase) failed!")
    }

}

