//
//  TextNode.swift
//  SceneShadertoy
//
//  Created by Astemir Eleev on 01/09/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//

import Foundation
import SceneKit

class TextNode: GeometryType {
    
    // MARK: - Properties
    
    var node: SCNNode = SCNNode()
    let defaultText = "Hello World!"
    
    
    // MARK: - Initializers
    
    init(text: String, diffuseColor: UIColor, ambientColor: UIColor) {
        setup(from: text, diffuseColor: diffuseColor, ambientColor: ambientColor)
    }
    
    init() {
        setup(from: defaultText, diffuseColor: defaultDiffuseColor, ambientColor: defaultAmbientColor)
    }
    
    // MARK: - Private methods
    
    private func setup(from text: String, diffuseColor: UIColor, ambientColor: UIColor) {
        let textGeometry = SCNText(string: text, extrusionDepth: 1.0)
        textGeometry.font = UIFont(name: "Avenir", size: 2.0)
        textGeometry.containerFrame = CGRect(origin: CGPoint(x: -5.0, y: -15.0), size: CGSize(width: 10, height: 20))
        
        textGeometry.firstMaterial?.diffuse.contents = diffuseColor
        textGeometry.firstMaterial?.ambient.contents = ambientColor
    
        node = SCNNode(geometry: textGeometry)
    }
    
}
