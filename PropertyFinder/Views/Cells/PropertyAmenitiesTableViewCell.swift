//
//  PropertyAmenitiesTableViewCell.swift
//  PropertyFinder
//
//  Created by Raul Brito on 22/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit
import TagListView

class PropertyAmenitiesTableViewCell: UITableViewCell {

	// MARK: - Properties
	
	var propertyViewModel: PropertyViewModel! {
		didSet {
			print(propertyViewModel.amenities)
			
			for amenity in propertyViewModel.amenities {
				print(amenity)
				tagListView.addTag(amenity.rawValue)
			}
			
//			tagListView.addTags(propertyViewModel?.amenities ?? [])
		}
	}
	
	@IBOutlet var tagListView: TagListView!
}
