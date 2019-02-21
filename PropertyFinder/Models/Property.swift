//
//  Property.swift
//  PropertyFinder
//
//  Created by Raul Brito on 21/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import Foundation
import Tailor

struct Property: Mappable {
	
	var images: [String]!
	var name: String!
	var description: String!
	var price: String!
	var type: String!
	var location: String!
	var bedroomCount: Int!
	var bathroomCount: Int!
	
	init(_ map: JSONDictionary) {
		images <- map.property("images")
        name <- map.property("name")
        description <- map.property("description")
        price <- map.property("price")
        type <- map.property("type")
        location <- map.property("location")
		bedroomCount <- map.property("bedroom_count")
		bathroomCount <- map.property("bathroom_count")
	}
	
}
