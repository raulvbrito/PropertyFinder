//
//  MyAccountViewController.swift
//  PropertyFinder
//
//  Created by Raul Brito on 21/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit

class MyAccountViewController: BaseViewController, Storyboarded {

	// MARK: - Properties
	
	weak var coordinator: MyAccountCoordinator?
	

	// MARK: - ViewController Lifecycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	
	// MARK: - Methods
	
	@IBAction func githubProject(_ sender: UIButton) {
		UIApplication.shared.open(URL(string: sender.titleLabel?.text ?? "")!, options: [:], completionHandler: nil)
	}
}
