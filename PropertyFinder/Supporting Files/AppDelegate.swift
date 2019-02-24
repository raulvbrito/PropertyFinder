//
//  AppDelegate.swift
//  PropertyFinder
//
//  Created by Raul Brito on 21/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		GMSServices.provideAPIKey("AIzaSyAFhB-FNx_Qotli_MqYRJeBJuxk_IZeAEw")
		
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		
	}

	func applicationWillTerminate(_ application: UIApplication) {
		
	}


}

