//
//  AreaFilterTableViewCell.swift
//  PropertyFinder
//
//  Created by Raul Brito on 23/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit
import TTRangeSlider

class AreaFilterTableViewCell: UITableViewCell {
	
	// MARK: - Properties
	
	@IBOutlet var rangeSlider: TTRangeSlider! {
		didSet {
			rangeSlider.setup()
		}
	}
	
	@IBOutlet var minBedroomCountLabel: UILabel!
	@IBOutlet var maxBedroomCountLabel: UILabel!
	@IBOutlet var furnishingsSwitch: UISwitch!
	
	let sum: (Int,Int)->Int = (+)
	let subtract: (Int,Int)->Int = (-)
	
	
	// MARK: - Methods
	
	@IBAction func minBedroomCountDecrease(_ sender: UIButton) {
		UISelectionFeedbackGenerator().selectionChanged()
		
		let minBedroomCount = Int(minBedroomCountLabel.text!)
		
		minBedroomCountLabel.text = minBedroomCount! > 0 ? "\(subtract(minBedroomCount!, 1))" : minBedroomCountLabel.text
	}
	
	@IBAction func minBedroomCountIncrease(_ sender: UIButton) {
		UISelectionFeedbackGenerator().selectionChanged()
		
		let minBedroomCount = Int(minBedroomCountLabel.text!)
		
		minBedroomCountLabel.text = minBedroomCount! < Int(maxBedroomCountLabel.text!) ?? 6 ? "\(sum(minBedroomCount!, 1))" : minBedroomCountLabel.text
	}
	
	@IBAction func maxBedroomCountDecrese(_ sender: UIButton) {
		UISelectionFeedbackGenerator().selectionChanged()
		
		let maxBedroomCount = Int(maxBedroomCountLabel.text!)
		
		maxBedroomCountLabel.text = maxBedroomCount! > Int(minBedroomCountLabel.text!) ?? 0 ? "\(subtract(maxBedroomCount!, 1))" : maxBedroomCountLabel.text
	}
	
	@IBAction func maxBedroomCountIncrease(_ sender: UIButton) {
		UISelectionFeedbackGenerator().selectionChanged()
		
		let maxBedroomCount = Int(maxBedroomCountLabel.text!)
		
		maxBedroomCountLabel.text = maxBedroomCount! < 7 ? "\(sum(maxBedroomCount!, 1))" : maxBedroomCountLabel.text
	}
}
