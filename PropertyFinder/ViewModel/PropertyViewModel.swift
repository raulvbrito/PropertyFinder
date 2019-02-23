//
//  PropertyViewModel.swift
//  PropertyFinder
//
//  Created by Raul Brito on 21/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import Foundation
import CoreLocation

enum Amenity: String {
	case study = "Study"
	case centralAC = "Central A/C"
    case balcony = "Balcony"
    case privateJacuzzi = "Private Jacuzzi"
    case privateGarden = "Private Garden"
    case privatePool = "Private Pool"
    case sharedPool = "Shared Pool"
    case security = "Security"
    case maidService = "Maid Service"
    case coveredParking = "Covered Parking"
    case builtInWardrobes = "Built in Wardrobes"
    case walkInCloset = "Walk-in Closet"
    case kitchenAppliances = "Kitchen Appliances"
    case viewOfWater = "View of Water"
    case viewOfLandmark = "View of Landmark"
    case petsAllowed = "Pets Allowed"
    case networked = "Networked"
    case sharedGym = "Shared Gym"
    case sharedSpa = "Shared Spa"
    case concierge = "Concierge"
    case lobbyInBuilding = "Lobby in Building"
    case childrensPlayArea = "Children's Play Area"
    case barbecueArea = "Barbecue Area"
    case vastuCompliant = "Vastu-compliant"
}

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
	let area: Int
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
