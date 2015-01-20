//
//  AppDelegate.swift
//  director
//
//  Created by Steven Lu on 1/2/15.
//  Copyright (c) 2015 Steven Lu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var splashNavController: UINavigationController?
    var appViewController: AppViewController?

    func loadSplash() {
        window?.rootViewController = self.splashNavController;
    }

    func loadApp() {
        window?.rootViewController = self.appViewController;
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        // window init
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.lightGrayColor()
        window?.makeKeyAndVisible()

        // globals
        UINavigationBar.appearance().tintColor = UIColor.primaryColor()
        UILabel.appearance().font = UIFont.primaryFontWithSize(16)

        // splash nav init
        splashNavController = UINavigationController()
        var splashViewController = SplashViewController()
        splashNavController?.pushViewController(splashViewController, animated: false)

        // app nav init
        appViewController = AppViewController()

        // choose which to load
        let authTokenKey = GenericKey(keyName: "authentication-token")
        let keychain = Keychain()
        if let authToken = keychain.get(authTokenKey).item?.value {
            loadApp()
        } else {
            loadSplash()
        }
        self.window?.makeKeyAndVisible()

        //        println(UIFont.familyNames())

        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

