//
//  SavedPropertiesCoordinator.swift
//  PropertyFinder
//
//  Created by Raul Brito on 26/03/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit

class SavedPropertiesCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
	
    weak var parentCoordinator: PropertiesCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = SavedPropertiesViewController.instantiate()
        viewController.coordinator = self
        viewController.tabBarItem = UITabBarItem(title: "Saved", image: UIImage(named: "heart_icon"), tag: 1)
		
		navigationController.navigationBar.prefersLargeTitles = true
        navigationController.viewControllers = [viewController]
    }
}

