//
//  SphereNode.swift
//  SceneShadertoy
//
//  Created by Astemir Eleev on 01/09/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//

import Foundation
import SceneKit

class SphereNode: GeometryType {
    
    // MARK: - Properties

    var node: SCNNode = SCNNode()
    let defaultRadius: CGFloat = 3.0
    let defaultSegmentCount: Int = 1000
    
    // MARK: - Initializers
    
    init(radius: CGFloat, diffuseColor: UIColor, ambient: UIColor) {
        setup(radius: radius, diffuseColor: defaultDiffuseColor, ambientColor: defaultAmbientColor)
    }
    
    init() {
        setup(radius: defaultRadius, diffuseColor: defaultDiffuseColor, ambientColor: defaultAmbientColor)
    }
    
    
    // MARK: - Private methods
    
    private func setup(radius: CGFloat, diffuseColor: UIColor, ambientColor: UIColor) {
        let sphere = SCNSphere(radius: radius)
        sphere.firstMaterial?.diffuse.contents = diffuseColor
        sphere.firstMaterial?.ambient.contents = ambientColor
        sphere.segmentCount = defaultSegmentCount
        
        node = SCNNode(geometry: sphere)
    }
    
}
