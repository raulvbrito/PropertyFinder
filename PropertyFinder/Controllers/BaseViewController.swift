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
		
		self.navigationController?.navigationBar.tintColor = UIColor.black
		self.navigationController?.navigationBar.isTranslucent = false
		
		self.tabBarController?.tabBar.tintColor = UIColor(red: 237/255, green: 79/255, blue: 63/255, alpha: 1)
		self.tabBarController?.tabBar.layer.borderWidth = 0.50
		self.tabBarController?.tabBar.layer.borderColor = UIColor.clear.cgColor
		self.tabBarController?.tabBar.clipsToBounds = true
		
		self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
		
		definesPresentationContext = true
    }
}

