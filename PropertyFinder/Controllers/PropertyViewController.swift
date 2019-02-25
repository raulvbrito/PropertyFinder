//
//  PropertyViewController.swift
//  PropertyFinder
//
//  Created by Raul Brito on 22/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit
import GoogleMaps

class PropertyViewController: BaseViewController {
	
	// MARK: - Properties
	
	var propertyViewModel: PropertyViewModel?
	
	@IBOutlet var tableView: UITableView! {
		didSet {
			tableView.estimatedRowHeight = 250
			tableView.rowHeight = UITableView.automaticDimension
		}
	}
	
	@IBOutlet var contactButtonShadowView: UIView! {
		didSet {
			contactButtonShadowView.layer.shadowColor = UIColor(red: 237/255, green: 79/255, blue: 63/255, alpha: 1).cgColor
			contactButtonShadowView.layer.shadowOpacity = 0.3
			contactButtonShadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
			contactButtonShadowView.layer.shadowRadius = 8
			contactButtonShadowView.layer.shadowPath = UIBezierPath(rect: contactButtonShadowView.bounds).cgPath
			contactButtonShadowView.layer.shouldRasterize = true
		}
	}
	
	@IBOutlet var contactButtonBackgroundView: UIView!
	@IBOutlet var contactButton: UIButton!
	
	
	// MARK: - ViewController Lifecycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }


	// MARK: - Methods
	
	@IBAction func contactBroker(_ sender: UIButton) {
		let optionMenu = UIAlertController(title: nil, message: "Choose a contact method", preferredStyle: .actionSheet)
		
		optionMenu.popoverPresentationController?.sourceView = self.contactButtonBackgroundView
		optionMenu.popoverPresentationController?.sourceRect = self.contactButtonBackgroundView.bounds
		
		let callAction = UIAlertAction(title: "Call", style: .default) { _ in
			if let url = URL(string: "tel://+5511986770136"), UIApplication.shared.canOpenURL(url) {
				if #available(iOS 10, *) {
					UIApplication.shared.open(url)
				} else {
					UIApplication.shared.openURL(url)
				}
			}
		}
		optionMenu.addAction(callAction)
		
		let emailAction = UIAlertAction(title: "E-mail", style: .default) { _ in
			if let url = URL(string: "mailto:raulvbrito@hotmail.com") {
				if #available(iOS 10.0, *) {
					UIApplication.shared.open(url)
				} else {
					UIApplication.shared.openURL(url)
				}
			}
		}
		optionMenu.addAction(emailAction)
		
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
		optionMenu.addAction(cancelAction)
		
		self.present(optionMenu, animated: true, completion: nil)
	}
}


// MARK: - Extensions

extension PropertyViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.row {
			case 0:
				return 300
			case 1:
				return 150
			case 2:
				return UITableView.automaticDimension
			case 3:
				return 200
			case 4:
				return 110
			default:
				return 0
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.row {
			case 0:
				let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyHeaderTableViewCell", for: indexPath) as? PropertyHeaderTableViewCell
		
				cell?.propertyViewModel = propertyViewModel
				
				return cell ?? UITableViewCell()
			case 1:
				let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyLocationTableViewCell", for: indexPath) as? PropertyLocationTableViewCell
		
				cell?.propertyViewModel = propertyViewModel
				
				return cell ?? UITableViewCell()
			case 2:
				let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyDescriptionTableViewCell", for: indexPath) as? PropertyDescriptionTableViewCell
		
				cell?.propertyViewModel = propertyViewModel
				
				return cell ?? UITableViewCell()
			case 3:
				let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyFactsTableViewCell", for: indexPath) as? PropertyFactsTableViewCell
		
				cell?.propertyViewModel = propertyViewModel
				
				return cell ?? UITableViewCell()
			case 4:
				let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyAmenitiesTableViewCell", for: indexPath) as? PropertyAmenitiesTableViewCell
		
				cell?.propertyViewModel = propertyViewModel
				
				return cell ?? UITableViewCell()
			default:
				return UITableViewCell()
		}
	}
}

extension PropertyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return propertyViewModel?.images.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: view.frame.size.width, height: 300)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyGalleryCollectionViewCell", for: indexPath) as? PropertyGalleryCollectionViewCell
		
		cell?.propertyImageUrl = propertyViewModel?.images[indexPath.row]
		
		return cell ?? UICollectionViewCell()
	}
}

extension PropertyViewController: GMSMapViewDelegate {

	func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
		if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
			UIApplication.shared.open(URL(string:"comgooglemaps://?center=\(self.propertyViewModel?.coordinates.latitude ?? 0),\(self.propertyViewModel?.coordinates.longitude ?? 0))&zoom=14&views=traffic&q=\(self.propertyViewModel?.coordinates.latitude ?? 0),\(String(describing: self.propertyViewModel?.coordinates.longitude ?? 0))")!, options: [:], completionHandler: nil)
		} else if UIApplication.shared.canOpenURL(URL(string: "waze://")!) {
			UIApplication.shared.open(URL(string: "waze://?ll=\(self.propertyViewModel?.coordinates.latitude ?? 0),\(self.propertyViewModel?.coordinates.longitude ?? 0)&navigate=yes")!, options: [:], completionHandler: nil)
		}
	}
	
}
