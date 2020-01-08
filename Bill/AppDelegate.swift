//
//  AppDelegate.swift
//  Bill
//
//  Created by shuai.wang on 2020/1/7.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init()
        window?.frame = UIScreen.main.bounds
        let navi = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        return true
    }


}

