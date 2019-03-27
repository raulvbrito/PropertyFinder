//
//  Coordinator.swift
//  PropertyFinder
//
//  Created by Raul Brito on 25/03/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
