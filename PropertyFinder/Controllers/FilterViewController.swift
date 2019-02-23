//
//  FilterViewController.swift
//  PropertyFinder
//
//  Created by Raul Brito on 23/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit
import TagListView

class FilterViewController: UIViewController {

	// MARK: - Properties
	
	@IBOutlet var tableView: UITableView!
	@IBOutlet var filterButtonShadowView: UIView! {
		didSet {
			filterButtonShadowView.layer.shadowColor = UIColor(red: 237/255, green: 79/255, blue: 63/255, alpha: 1).cgColor
			filterButtonShadowView.layer.shadowOpacity = 0.6
			filterButtonShadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
			filterButtonShadowView.layer.shadowRadius = 3
			filterButtonShadowView.layer.shadowPath = UIBezierPath(rect: filterButtonShadowView.bounds).cgPath
			filterButtonShadowView.layer.shouldRasterize = true
		}
	}
	
	
	// MARK: - ViewController Lifecycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	
    // MARK: - Methods
	
	@IBAction func close(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func filter(_ sender: UIButton) {
		UISelectionFeedbackGenerator().selectionChanged()
		close(sender)
	}
}


// MARK: - Extensions

extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.section {
			case 0:
				return 280
			case 1:
				return 260
			case 2:
				return 120
			default:
				return 0
		}
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 60
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))

		let label = UILabel(frame: CGRect(x: 16, y: 0, width: view.frame.size.width, height: 60))
		label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
		label.textColor = .darkGray
		
		switch section {
			case 0:
				label.text = "Type"
			case 1:
				label.text = "Area"
			case 2:
				label.text = "Price"
			default:
				label.text = ""
		}

		headerView.backgroundColor = .white
		headerView.addSubview(label)

		return headerView
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.section {
			case 0:
				let cell = tableView.dequeueReusableCell(withIdentifier: "TypeFilterTableViewCell", for: indexPath) as? TypeFilterTableViewCell
				
				cell?.selectionStyle = .none
				cell?.selectedBackgroundView = UIView()
				
				return cell ?? UITableViewCell()
			case 1:
				let cell = tableView.dequeueReusableCell(withIdentifier: "AreaFilterTableViewCell", for: indexPath) as? AreaFilterTableViewCell
				
				cell?.selectionStyle = .none
				cell?.selectedBackgroundView = UIView()
				
				return cell ?? UITableViewCell()
			case 2:
				let cell = tableView.dequeueReusableCell(withIdentifier: "PriceFilterTableViewCell", for: indexPath) as? PriceFilterTableViewCell
				
				cell?.selectionStyle = .none
				cell?.selectedBackgroundView = UIView()
				
				return cell ?? UITableViewCell()
			default:
				return UITableViewCell()
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

extension FilterViewController: TagListViewDelegate {
	
	func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
		tagView.isSelected = !tagView.isSelected
	}
}
