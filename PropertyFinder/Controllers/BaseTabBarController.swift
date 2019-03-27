//
//  BaseTabBarController.swift
//  PropertyFinder
//
//  Created by Raul Brito on 25/03/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

	// MARK: - Properties
	
	let propertiesCoordinator = PropertiesCoordinator(navigationController: UINavigationController())
	let myAccountCoordinator = MyAccountCoordinator(navigationController: UINavigationController())
	
	
	// MARK: - TabBarController Lifecycle
	
    override func viewDidLoad() {
        super.viewDidLoad()

		propertiesCoordinator.start()
		propertiesCoordinator.savedProperties()
		myAccountCoordinator.start()
		
		viewControllers = [propertiesCoordinator.navigationController, propertiesCoordinator.childCoordinators[0].navigationController, myAccountCoordinator.navigationController]
    }
}
