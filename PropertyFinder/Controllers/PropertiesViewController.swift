//
//  PropertiesViewController.swift
//  PropertyFinder
//
//  Created by Raul Brito on 21/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit
import Hero

class PropertiesViewController: BaseViewController {
	
	// MARK: - Properties
	
	let searchController = UISearchController(searchResultsController: nil)
	
	var propertyViewModels = [PropertyViewModel]()
	var filteredPropertyViewModels = [PropertyViewModel]()
	
	@IBOutlet var tableView: UITableView!
	
	
	// MARK: - ViewController Lifecycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		fetchData()
		searchSetup()
    }
	
	
	// MARK: - Methods
	
	@objc func fetchData() {
		PropertyService.fecthProperties { (error, properties) in
			if let error = error {
				print(error.domain)
				return
			}
			
			self.tableView.hero.modifiers = [.cascade]
			self.propertyViewModels = properties.map({return PropertyViewModel(property: $0)})
			
			self.tableView.reloadData()
		}
	}
	
	func searchSetup() {
		searchController.searchResultsUpdater = self as UISearchResultsUpdating
		searchController.searchBar.placeholder = "Search"
		searchController.searchBar.setValue("Cancel", forKey:"_cancelButtonText")
		
		if #available(iOS 11.0, *) {
			searchController.obscuresBackgroundDuringPresentation = false
			navigationItem.searchController = searchController
		}
	}
	
	func searchBarIsEmpty() -> Bool {
	  	return searchController.searchBar.text?.isEmpty ?? true
	}
	
	func isFiltering() -> Bool {
		return searchController.isActive && !searchBarIsEmpty()
	}
	
	func filterContentForSearchText(_ searchText: String, scope: String = "All") {
		filteredPropertyViewModels = propertyViewModels.filter({( property : PropertyViewModel) -> Bool in
			return property.name.lowercased().contains(searchText.lowercased())
		})

		tableView.reloadData()
	}
	
	
	// MARK: - Navigation
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let propertyVC = segue.destination as? PropertyViewController {
			propertyVC.propertyViewModel = sender as? PropertyViewModel
        }
	}

}


// MARK: - Extensions

extension PropertiesViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if isFiltering() {
			return filteredPropertyViewModels.count
		}
		
		return propertyViewModels.count
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 258
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyTableViewCell", for: indexPath) as? PropertyTableViewCell
		
		if isFiltering() {
			cell?.propertyViewModel = filteredPropertyViewModels[indexPath.row]
		} else {
			cell?.propertyViewModel = propertyViewModels[indexPath.row]
		}
		
		cell?.selectionStyle = .none
		cell?.selectedBackgroundView = UIView()
		
		return cell ?? UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
		if isFiltering() {
			performSegue(withIdentifier: "PropertySegue", sender: filteredPropertyViewModels[indexPath.row])
		} else {
			performSegue(withIdentifier: "PropertySegue", sender: propertyViewModels[indexPath.row])
		}
	}
}

extension PropertiesViewController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		filterContentForSearchText(searchController.searchBar.text!)
	}
}
