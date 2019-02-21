//
//  PropertyService.swift
//  PropertyFinder
//
//  Created by Raul Brito on 21/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import Foundation
import UIKit

class PropertyService: BaseService {
	
    // MARK: - Requests (Mock data)
	
    static func fecthProperties(completion: @escaping (_ error: NSError?, _ result: [Property]) -> Void){
		guard let jsonPath = Bundle.main.url(forResource: "Properties", withExtension: "json") else {
			completion(NSError(domain: "Json file not found", code: 404, userInfo: nil), [])
			return
		}
		
		do {
			let data = try Data(contentsOf: jsonPath, options: .mappedIfSafe)
			let result = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
			if let result = result as? Dictionary<String, AnyObject> {
				let properties = result.array("properties")?.compactMap(Property.init) ?? []
				
				completion(nil, properties)
			}
		} catch {
			completion(NSError(domain: "Failed to retrieve json data", code: 400, userInfo: nil), [])
		}
    }
	
}
