//
//  PropertyViewModel.swift
//  PropertyFinder
//
//  Created by Raul Brito on 21/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import Foundation

public final class PropertyViewModel {

	let property: Property
	
	let imageURL: URL?
	let name: String
	let description: String
	let price: String
	let type: String
	let location: String
	let bedroomCount: Int
	let bathroomCount: Int
	
	
	init(property: Property) {
		self.property = property
		
		imageURL = property.imageURL
		name = property.name
		description = property.description
		price = property.price
		type = property.type
		location = property.location
		bedroomCount = property.bedroomCount
		bathroomCount = property.bathroomCount
	}
}
