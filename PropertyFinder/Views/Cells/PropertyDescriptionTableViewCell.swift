//
//  PropertyDescriptionTableViewCell.swift
//  PropertyFinder
//
//  Created by Raul Brito on 22/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit

class PropertyDescriptionTableViewCell: UITableViewCell {

	// MARK: - Properties
	
	var propertyViewModel: PropertyViewModel! {
		didSet {
			textView.text = propertyViewModel.description
			
			let newSize = textView.sizeThatFits(CGSize(width: textView.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
			textView.frame.size = CGSize(width: max(newSize.width, textView.frame.size.width), height: newSize.height)
		}
	}
	
	@IBOutlet var textView: UITextView!	
}
