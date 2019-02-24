//
//  File.swift
//  PropertyFinder
//
//  Created by Raul Brito on 23/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import Foundation
import Tailor
import TagListView

struct Filter: Mappable {
	
	var propertyTypes: [TagView]!
	var minArea: Float!
	var maxArea: Float!
	var minBedrooms: Int!
	var maxBedrooms: Int!
	var furnishing: Bool!
	var minPrice: Float!
	var maxPrice: Float!
	
	init(_ map: JSONDictionary) {
		propertyTypes <- map.property("propertyTypes")
		minArea <- map.property("minArea")
		maxArea <- map.property("maxArea")
		minBedrooms <- map.property("minBedrooms")
		maxBedrooms <- map.property("maxBedrooms")
		furnishing <- map.property("furnishing")
		minPrice <- map.property("minPrice")
		maxPrice <- map.property("maxPrice")
	}
	
}
