//
//  PropertyViewModel.swift
//  PropertyFinder
//
//  Created by Raul Brito on 21/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import Foundation
import CoreLocation

public final class PropertyViewModel {

	let property: Property
	
	let images: [String]
	let name: String
	let description: String
	let rentPrice: String
	let buyPrice: String
	let type: String
	let location: String
	var coordinates: CLLocationCoordinate2D
	let bedroomCount: Int
	let bathroomCount: Int
	let area: Float
	let reference: String
	let rera: String
	let amenities: [String]
	
	
	init(property: Property) {
		self.property = property
		
		images = property.images
		name = property.name
		description = property.description
		rentPrice = property.rentPrice
		buyPrice = property.buyPrice
		type = property.type
		location = property.location
		coordinates = property.coordinates
		bedroomCount = property.bedroomCount
		bathroomCount = property.bathroomCount
		area = property.area
		reference = property.reference
		rera = property.rera
		amenities = property.amenities
	}
}
