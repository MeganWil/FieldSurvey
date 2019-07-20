//
//  Classification.swift
//  Field Survey
//
//  Created by Megan Wilson on 7/19/19.
//  Copyright © 2019 Megan Wilson. All rights reserved.
//

import UIKit

enum Classification: String {
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case reptile
    case plant
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}
