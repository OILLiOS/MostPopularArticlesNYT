//
//  AppDelegate.swift
//  MostPopularArticlesNYT
//
//  Created by Octavio Labastida Luna on 16/04/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let networkManager = NetworkConnectionManager.sharedInstance

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        networkManager.startObserveConnection()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        networkManager.stopObserveConnection()
    }


}

