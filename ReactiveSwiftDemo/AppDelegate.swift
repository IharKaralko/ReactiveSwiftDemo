//
//  AppDelegate.swift
//  ReactiveSwiftDemo
//
//  Created by Ihar_Karalko on 13.02.2018.
//  Copyright © 2018 Ihar_Karalko. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var testViewController: TestViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      
        
        window = UIWindow(frame:UIScreen.main.bounds)
        testViewController = TestViewController(nibName: "TestViewController", bundle: nil)
       // navController = UINavigationController(rootViewController: TestViewController!)
        window?.rootViewController = testViewController //navController
        window?.makeKeyAndVisible()
        
        return true
    }
    
   
    
}

