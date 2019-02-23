//
//  PropertyTableViewCell.swift
//  PropertyFinder
//
//  Created by Raul Brito on 21/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit
import SDWebImage

class PropertyTableViewCell: UITableViewCell {

	// MARK: Properties
	
	var propertyViewModel: PropertyViewModel! {
		didSet {
			for (index, imageView) in propertyImages.enumerated() {
				imageView.sd_setImage(with: URL(string: propertyViewModel.images[index]), placeholderImage: UIImage())
			}
			
			titleLabel.text = propertyViewModel.name
			typeLabel.text = propertyViewModel.type.capitalized
			priceLabel.text = "\(propertyViewModel.rentPrice) AED/year"
			locationLabel.text = propertyViewModel.location
		}
	}

	@IBOutlet var propertyImages: [UIImageView]!
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var typeLabel: UILabel!
	@IBOutlet var priceLabel: UILabel!
	@IBOutlet var locationLabel: UILabel!
}
