//
//  Storyboarded.swift
//  PropertyFinder
//
//  Created by Raul Brito on 25/03/19.
//  Copyright © 2019 Raul Brito. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let className = NSStringFromClass(self).components(separatedBy: ".")[1]

        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
