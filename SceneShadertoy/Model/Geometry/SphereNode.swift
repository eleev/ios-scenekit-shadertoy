//
//  SphereNode.swift
//  SceneShadertoy
//
//  Created by Astemir Eleev on 01/09/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//

import Foundation
import SceneKit

class SphereNode: SCNNode, GeometryType {
    
    // MARK: - Properties

    var node: SCNNode = SCNNode()
    let defaultRadius: CGFloat = 3.0
    
    // MARK: - Initializers
    
    init(radius: CGFloat, diffuseColor: UIColor, ambient: UIColor) {
        super.init()
        setup(radius: radius, diffuseColor: defaultDiffuseColor, ambientColor: defaultAmbientColor)
    }
    
    override init() {
        super.init()
        setup(radius: defaultRadius, diffuseColor: defaultDiffuseColor, ambientColor: defaultAmbientColor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Required initializer has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setup(radius: CGFloat, diffuseColor: UIColor, ambientColor: UIColor) {
        let sphere = SCNSphere(radius: radius)
        sphere.firstMaterial?.diffuse.contents = diffuseColor
        sphere.firstMaterial?.ambient.contents = ambientColor
        
        node = SCNNode(geometry: sphere)
    }
    
}
