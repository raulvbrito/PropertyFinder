//
//  PropertyViewController.swift
//  PropertyFinder
//
//  Created by Raul Brito on 22/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit

class PropertyViewController: BaseViewController {
	
	// MARK: - Properties
	
	var propertyViewModel: PropertyViewModel?
	
	@IBOutlet var tableView: UITableView! {
		didSet {
			tableView.estimatedRowHeight = 250
			tableView.rowHeight = UITableView.automaticDimension
		}
	}
	
	
	// MARK: - ViewController Lifecycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }


	// MARK: - Methods
	
}


// MARK: - Extensions

extension PropertyViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.row {
			case 0:
				return 300
			case 1, 4:
				return 150
			case 2:
				return UITableView.automaticDimension
			case 3:
				return 200
			default:
				return 0
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.row {
			case 0:
				let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyHeaderTableViewCell", for: indexPath) as? PropertyHeaderTableViewCell
		
				cell?.propertyViewModel = propertyViewModel
				
				cell?.selectionStyle = .none
				cell?.selectedBackgroundView = UIView()
				
				return cell ?? UITableViewCell()
			case 1:
				let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyLocationTableViewCell", for: indexPath) as? PropertyLocationTableViewCell
		
				cell?.propertyViewModel = propertyViewModel
				
				cell?.selectionStyle = .none
				cell?.selectedBackgroundView = UIView()
				
				return cell ?? UITableViewCell()
			case 2:
				let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyDescriptionTableViewCell", for: indexPath) as? PropertyDescriptionTableViewCell
		
				cell?.propertyViewModel = propertyViewModel
				
				cell?.selectionStyle = .none
				cell?.selectedBackgroundView = UIView()
				
				return cell ?? UITableViewCell()
			case 3:
				let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyFactsTableViewCell", for: indexPath) as? PropertyFactsTableViewCell
		
				cell?.propertyViewModel = propertyViewModel
				
				cell?.selectionStyle = .none
				cell?.selectedBackgroundView = UIView()
				
				return cell ?? UITableViewCell()
			case 4:
				let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyAmenitiesTableViewCell", for: indexPath) as? PropertyAmenitiesTableViewCell
		
				cell?.propertyViewModel = propertyViewModel
				
				cell?.selectionStyle = .none
				cell?.selectedBackgroundView = UIView()
				
				return cell ?? UITableViewCell()
			default:
				return UITableViewCell()
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

extension PropertyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return propertyViewModel?.images.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: view.frame.size.width, height: 300)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyGalleryCollectionViewCell", for: indexPath) as? PropertyGalleryCollectionViewCell
		
		cell?.propertyImageUrl = propertyViewModel?.images[indexPath.row]
		
		return cell ?? UICollectionViewCell()
	}
}
