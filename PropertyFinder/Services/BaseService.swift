//
//  PropertyService.swift
//  PropertyFinder
//
//  Created by Raul Brito on 21/02/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String : Any]
typealias JSONArray = [[String : Any]]

class BaseService {
    class var instance: BaseService {
        struct Static {
            static let instance = BaseService()
        }
        return Static.instance
    }
}
