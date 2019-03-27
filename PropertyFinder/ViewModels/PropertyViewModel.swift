//
//  PropertyViewModel.swift
//  PropertyFinder
//
//  Created by Raul Brito on 21/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import Foundation
import CoreLocation

struct PropertyViewModel {

	let property: Property
	
	let images: [String]
	let name: String
	let description: String
	let rentPrice: String
	let buyPrice: String
	let type: String
	let location: String
	var latitude: Double
	var longitude: Double
	let bedroomCount: Int
	let bathroomCount: Int
	let area: Float
	let furnishings: Bool
	let reference: String
	let rera: String
	let amenities: [String]
	var coordinates: CLLocationCoordinate2D {
		get {
			return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
		}
	}
	
	init(property: Property) {
		self.property = property
		
		images = property.images
		name = property.name
		description = property.description
		rentPrice = property.rentPrice
		buyPrice = property.buyPrice
		type = property.type
		location = property.location
		latitude = property.latitude
		longitude = property.longitude
		bedroomCount = property.bedroomCount
		bathroomCount = property.bathroomCount
		area = property.area
		furnishings = property.furnishings
		reference = property.reference
		rera = property.rera
		amenities = property.amenities
	}
}
