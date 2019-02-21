//
//  BaseViewController.swift
//  PropertyFinder
//
//  Created by Raul Brito on 21/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.isTranslucent = false
		
		self.tabBarController?.tabBar.layer.borderWidth = 0.50
		self.tabBarController?.tabBar.layer.borderColor = UIColor.clear.cgColor
		self.tabBarController?.tabBar.clipsToBounds = true
		
		definesPresentationContext = true
		
		if #available(iOS 11.0, *) {
			self.navigationController?.navigationBar.prefersLargeTitles = true
		}
    }
}

