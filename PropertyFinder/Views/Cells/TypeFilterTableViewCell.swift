//
//  TypeFilterTableViewCell.swift
//  PropertyFinder
//
//  Created by Raul Brito on 23/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit
import TagListView

class TypeFilterTableViewCell: UITableViewCell {

	// MARK: - Properties

	@IBOutlet var tagListView: TagListView! {
		didSet {
			tagListView.textFont = UIFont.systemFont(ofSize: 14, weight: .semibold)
			tagListView.addTags(["Apartment", "Villa", "Townhouse", "Hotel Apartment", "Penthouse", "Duplexe", "Compound", "Whole Building", "Bulk Rent Unit", "Bungalow", "Full Floor"])
			tagListView.tagViews[0].isSelected = true
		}
	}
}
