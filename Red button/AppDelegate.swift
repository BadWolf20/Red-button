//
//  AppDelegate.swift
//  Red button
//
//  Created by Roman on 02.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

       // UserDefaults.standard.set(false, forKey: "Start")
        let appDelegateStorageManager = StorageManager()
        if !appDelegateStorageManager.hasFirstLaunch() {
            UserDefaults.standard.set([String: Int](), forKey: "List")
            appDelegateStorageManager.setHasFirstLaunch(bool: true)
        }

        let tabBarController = UITabBarController()

        let buttonViewController = ButtonViewController()
        buttonViewController.tabBarItem = UITabBarItem(title: "Button", image: .remove, tag: 0)

        let thirdViewController = StaticticViewController()
        thirdViewController.tabBarItem = UITabBarItem(title: "Third", image: .checkmark, tag: 1)


        tabBarController.setViewControllers([
            buttonViewController,
            thirdViewController
        ], animated: true)
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.selectedIndex = 1

        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController

        window?.makeKeyAndVisible()
        return true

    }

}

