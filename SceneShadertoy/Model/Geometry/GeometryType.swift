//
//  GeometryType.swift
//  SceneShadertoy
//
//  Created by Astemir Eleev on 01/09/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//

import Foundation
import UIKit
import SceneKit

protocol GeometryType {
    // Empty declaration
}

extension GeometryType {
    var defaultDiffuseColor: UIColor {
        return UIColor(hue: 0.8, saturation: 0.6, brightness: 1.0, alpha: 1.0)
    }
    
    var defaultAmbientColor: UIColor {
       return UIColor.white
    }
}
