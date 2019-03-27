//
//  MyAccountCoordinator.swift
//  PropertyFinder
//
//  Created by Raul Brito on 26/03/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit

class MyAccountCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = MyAccountViewController.instantiate()
        viewController.coordinator = self
        viewController.tabBarItem = UITabBarItem(title: "My Account", image: UIImage(named: "user_icon"), tag: 2)
		
		navigationController.navigationBar.prefersLargeTitles = true
        navigationController.viewControllers = [viewController]
    }
}
