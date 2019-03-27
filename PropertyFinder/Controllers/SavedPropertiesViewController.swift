//
//  SavedPropertiesViewController.swift
//  PropertyFinder
//
//  Created by Raul Brito on 21/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit
import Hero

class SavedPropertiesViewController: BaseViewController, Storyboarded {
	
	// MARK: - Properties
	
	weak var coordinator: SavedPropertiesCoordinator?
	
	var propertyViewModels = [PropertyViewModel]()
	
	@IBOutlet var tableView: UITableView! {
		didSet {
			PropertyService.fetchProperties { (error, properties) in
				if let error = error {
					print(error.domain)
					return
				}
				
				self.tableView.hero.modifiers = [.cascade]
				self.propertyViewModels = properties.map({return PropertyViewModel(property: $0)})
				
				self.tableView.reloadData()
			}
		}
	}
	
	
	// MARK: - ViewController Lifecycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


// MARK: - Extensions

extension SavedPropertiesViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return propertyViewModels.count
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 258
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "SavedPropertyTableViewCell", for: indexPath) as? PropertyTableViewCell
		
		cell?.propertyViewModel = propertyViewModels[indexPath.row]
		cell?.bottomSeparatorView.isHidden = propertyViewModels.count == indexPath.row + 1
		
		cell?.selectionStyle = .none
		cell?.selectedBackgroundView = UIView()
		
		return cell ?? UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
		guard let navigationController = self.navigationController else { return }
		
		coordinator?.parentCoordinator?.show(property: propertyViewModels[indexPath.row], from: navigationController)
	}
}
