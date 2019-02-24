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
	
	var propertyTypes: [String]!
	var minArea: Float!
	var maxArea: Float!
	var minBedrooms: Int!
	var maxBedrooms: Int!
	var furnishings: Bool!
	var minPrice: Float!
	var maxPrice: Float!
	
	init(_ map: JSONDictionary) {
		propertyTypes <- map.property("property_types")
		minArea <- map.property("min_area")
		maxArea <- map.property("max_area")
		minBedrooms <- map.property("min_bedrooms")
		maxBedrooms <- map.property("max_bedrooms")
		furnishings <- map.property("furnishings")
		minPrice <- map.property("min_price")
		maxPrice <- map.property("max_price")
	}
	
}
