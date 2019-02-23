//
//  PropertyGalleryCollectionViewCell.swift
//  PropertyFinder
//
//  Created by Raul Brito on 22/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit

class PropertyGalleryCollectionViewCell: UICollectionViewCell {
	
    // MARK: - Properties
	
	var propertyImageUrl: String! {
		didSet {
			propertyImageView.sd_setImage(with: URL(string: propertyImageUrl), placeholderImage: UIImage())
		}
	}
	
	@IBOutlet var propertyImageView: UIImageView!
}
