//
//  PlaceMarkerView.swift
//  PropertyFinder
//
//  Created by Raul Brito on 22/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit

class PlaceMarkerView: UIView {

	// MARK: - Properties
	
	@IBOutlet var roundedView: UIView!
	@IBOutlet var logoImageView: UIImageView!
	@IBOutlet var locationPinImageView: UIImageView!
	
	override func draw(_ rect: CGRect) {
		let locationPinImage = UIImage(named: "location_pin")
		let tintedImage = locationPinImage?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
		locationPinImageView.image = tintedImage
	}
}
