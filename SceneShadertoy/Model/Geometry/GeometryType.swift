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
    var node: SCNNode { get set }
}

extension GeometryType {
    var defaultDiffuseColor: UIColor {
        return UIColor(hue: 0.8, saturation: 0.6, brightness: 1.0, alpha: 1.0)
    }
    
    var defaultAmbientColor: UIColor {
       return UIColor.white
    }
    
    /// Applies a collection of shader modifiers to current SCNNode
    ///
    /// - Parameter shaderModifiers: is a dictionary which key is SCNShaderModifierEntryPoint and value is a String
    func applyShader(shaderModifiers: [SCNShaderModifierEntryPoint : String]) {
        node.geometry?.shaderModifiers = shaderModifiers
        node.enumerateChildNodes { (node: SCNNode!, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
            node.geometry?.shaderModifiers = shaderModifiers
        }
    }
}
