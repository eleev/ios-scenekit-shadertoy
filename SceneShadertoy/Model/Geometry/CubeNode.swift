//
//  CubeNode.swift
//  SceneShadertoy
//
//  Created by Astemir Eleev on 01/09/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//

import Foundation
import SceneKit

class CubeNode: GeometryType {
    
    // MARK: - Properties

    var node: SCNNode = SCNNode()

    let defaultWidth: CGFloat = 5.0
    let defaultHeight: CGFloat = 5.0
    let defaultLenght: CGFloat = 5.0
    let defaultChamferRadius: CGFloat = 1.5
    
    // MARK: - Initializers
    
    init(width: CGFloat, height: CGFloat, length: CGFloat, chamferRadius: CGFloat, diffureColor: UIColor, ambientColor: UIColor) {
        setup(width: width, height: height, lenght: length, chamferRadius: chamferRadius, diffuseColor: defaultDiffuseColor, ambientColor: defaultAmbientColor)
    }
    
    init() {
        setup(width: defaultWidth, height: defaultHeight, lenght: defaultLenght, chamferRadius: defaultChamferRadius, diffuseColor: defaultDiffuseColor, ambientColor: defaultAmbientColor)
    }
    
    // MARK: - Private methods
    
    private func setup(width: CGFloat, height: CGFloat, lenght: CGFloat, chamferRadius: CGFloat, diffuseColor: UIColor, ambientColor: UIColor) {
        let cube = SCNBox(width: width, height: height, length: lenght, chamferRadius: chamferRadius)
        cube.firstMaterial?.diffuse.contents = diffuseColor
        cube.firstMaterial?.ambient.contents = ambientColor
    
        node = SCNNode(geometry: cube)
    }
    
}
