//
//  PropertiesViewController.swift
//  PropertyFinder
//
//  Created by Raul Brito on 21/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit

class PropertiesViewController: BaseViewController {
	
	// MARK: - Injections
	
	var propertiesViewModels = [PropertyViewModel]()
	
	
	// MARK: - Outlets
	
	@IBOutlet var tableView: UITableView!
	
	
	// MARK: - ViewController Lifecycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		fetchData()
    }
	
	
	// MARK: - Methods
	
    func fetchData() {
		PropertyService.fecthProperties { (error, properties) in
			if let error = error {
				print(error.domain)
				return
			}
			
			self.propertiesViewModels = properties.map({return PropertyViewModel(property: $0)})
		}
	}

}
