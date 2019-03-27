//
//  PropertiesCoordinator.swift
//  PropertyFinder
//
//  Created by Raul Brito on 25/03/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit

class PropertiesCoordinator: NSObject, Coordinator {
	
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = PropertiesViewController.instantiate()
        viewController.coordinator = self
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
		
		navigationController.navigationBar.prefersLargeTitles = true
        navigationController.viewControllers = [viewController]
    }
	
    func savedProperties() {
    	let child = SavedPropertiesCoordinator(navigationController: UINavigationController())
        child.parentCoordinator = self
		
        childCoordinators.append(child)
		
        child.start()
	}
	
	func showFilters() {
		let viewController = FilterViewController.instantiate()
		viewController.coordinator = self
		viewController.delegate = self.navigationController.viewControllers[0] as? FilterViewControllerDelegate
		
		navigationController.present(viewController, animated: true, completion: nil)
	}
	
	func show(property: PropertyViewModel, from navigationController: UINavigationController) {
		let viewController = PropertyViewController.instantiate()
		viewController.coordinator = self
		viewController.propertyViewModel = property
		
		navigationController.pushViewController(viewController, animated: true)
	}
}
