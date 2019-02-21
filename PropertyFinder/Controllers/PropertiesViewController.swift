//
//  PropertiesViewController.swift
//  PropertyFinder
//
//  Created by Raul Brito on 21/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit

class PropertiesViewController: BaseViewController {
	
	// MARK: - Properties
	
	var propertyViewModels = [PropertyViewModel]()
	
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
			
			self.propertyViewModels = properties.map({return PropertyViewModel(property: $0)})
		}
	}

}


// MARK: - Extensions

extension PropertiesViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return propertyViewModels.count
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 240
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyTableViewCell", for: indexPath) as? PropertyTableViewCell
		
		cell?.propertyViewModel = propertyViewModels[indexPath.row]
		
		return cell ?? UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
