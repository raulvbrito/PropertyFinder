//
//  Extensions.swift
//  PropertyFinder
//
//  Created by Raul Brito on 23/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import TTRangeSlider

extension TTRangeSlider {
	func setup() {
		self.handleDiameter = 25
		self.handleImage = UIImage(named: "range_slider_thumb")
		self.selectedHandleDiameterMultiplier = 1.5
	}
}
