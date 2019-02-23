//
//  PriceFilterTableViewCell.swift
//  PropertyFinder
//
//  Created by Raul Brito on 23/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit
import TTRangeSlider

class PriceFilterTableViewCell: UITableViewCell {

	// MARK: - Properties
	
	@IBOutlet var rangeSlider: TTRangeSlider! {
		didSet {
			rangeSlider.setup()
		}
	}
}
