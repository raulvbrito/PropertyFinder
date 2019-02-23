//
//  PropertyInfoTableViewCell.swift
//  PropertyFinder
//
//  Created by Raul Brito on 22/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit

class PropertyHeaderTableViewCell: UITableViewCell {

	// MARK: - Properties
	
	var propertyViewModel: PropertyViewModel! {
		didSet {
			titleLabel.text = propertyViewModel.name
			typeLabel.text = propertyViewModel.type.capitalized
			priceLabel.text = "\(propertyViewModel.price) AED/year"
			locationLabel.text = propertyViewModel.location
		}
	}

	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var priceLabel: UILabel!
	@IBOutlet var typeLabel: UILabel!
	@IBOutlet var locationLabel: UILabel!
}
