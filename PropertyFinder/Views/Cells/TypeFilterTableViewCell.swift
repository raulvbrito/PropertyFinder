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
			tagListView.addTags(["Apartments", "Villas", "Townhouses", "Hotel Apartments", "Penthouse", "Duplexes", "Compounds", "Whole Buildings", "Bulk Rent Units", "Bungalows", "Full Floors"])
		}
	}
}
