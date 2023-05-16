//
//  AppDelegate.swift
//  SwiftExamples
//
//  Created by MIGUEL MEXICANO HERRERA on 10/05/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let login = LoginRouter()
        window?.rootViewController = login.view
        window?.makeKeyAndVisible()
        return true
    }
}

