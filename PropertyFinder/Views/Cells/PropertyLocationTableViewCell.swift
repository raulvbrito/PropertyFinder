//
//  MapTableViewCell.swift
//  PropertyFinder
//
//  Created by Raul Brito on 22/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit
import GoogleMaps

class PropertyLocationTableViewCell: UITableViewCell {

	// MARK: - Properties
	
	var propertyViewModel: PropertyViewModel! {
		didSet {
			let placeMarker = GMSMarker()
			placeMarker.position = propertyViewModel.coordinates
			placeMarker.iconView = Bundle.main.loadNibNamed("PlaceMarkerView", owner: nil, options: nil)?.first as? PlaceMarkerView
			placeMarker.map = mapView
			placeMarker.appearAnimation = GMSMarkerAnimation.pop
			
			let padding = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
			mapView.padding = padding
			
			mapView.animate(to: GMSCameraPosition(target: propertyViewModel.coordinates, zoom: 15, bearing: -40, viewingAngle: 100))
		}
	}
	
	@IBOutlet var mapView: GMSMapView!
}
