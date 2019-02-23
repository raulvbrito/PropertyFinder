//
//  PropertyFactsTableViewCell.swift
//  PropertyFinder
//
//  Created by Raul Brito on 22/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit

class PropertyFactsTableViewCell: UITableViewCell {

	// MARK: - Properties
	
	var propertyViewModel: PropertyViewModel! {
		didSet {
			bedroomCountLabel.text = "\(propertyViewModel.bedroomCount)"
			bathroomCountLabel.text = "\(propertyViewModel.bathroomCount)"
			areaLabel.text = "\(propertyViewModel.area) sqft"
			referenceLabel.text = propertyViewModel.reference
			reraLabel.text = propertyViewModel.rera
		}
	}
	
	@IBOutlet var bedroomCountLabel: UILabel!
	@IBOutlet var bathroomCountLabel: UILabel!
	@IBOutlet var areaLabel: UILabel!
	@IBOutlet var referenceLabel: UILabel!
	@IBOutlet var reraLabel: UILabel!
}
