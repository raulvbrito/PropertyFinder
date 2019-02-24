//
//  Property.swift
//  PropertyFinder
//
//  Created by Raul Brito on 21/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import Foundation
import Tailor
import CoreLocation

struct Property: Mappable {
	
	var images: [String]!
	var name: String!
	var description: String!
	var rentPrice: String!
	var buyPrice: String!
	var type: String!
	var location: String!
	var latitude: Double!
	var longitude: Double!
	var bedroomCount: Int!
	var bathroomCount: Int!
	var area: Float!
	var furnishings: Bool!
	var reference: String!
	var rera: String!
	var amenities: [String]!
	var coordinates: CLLocationCoordinate2D! {
		get {
			return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
		}
	}
	
	init(_ map: JSONDictionary) {
		images <- map.property("images")
        name <- map.property("name")
        description <- map.property("description")
        rentPrice <- map.property("rent_price")
        buyPrice <- map.property("buy_price")
        type <- map.property("type")
        location <- map.property("location")
        latitude <- map.property("latitude")
        longitude <- map.property("longitude")
		bedroomCount <- map.property("bedroom_count")
		bathroomCount <- map.property("bathroom_count")
		area <- map.property("area")
		furnishings <- map.property("furnishings")
		reference <- map.property("reference")
		rera <- map.property("rera")
		amenities <- map.property("amenities")
	}
	
}
