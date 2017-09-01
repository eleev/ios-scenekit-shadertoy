//
//  Torus.swift
//  SceneShadertoy
//
//  Created by Astemir Eleev on 01/09/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//

import Foundation
import SceneKit

class TorusNode: GeometryType {
    
    // MARK: - Properties
    
    var node: SCNNode = SCNNode()
    
    let defaultRingRadius: CGFloat = 4.0
    let defaultPipeRadius: CGFloat = 1.5
    
    // MARK: - Initializers
    
    init(ringRadius: CGFloat, pipeRadius: CGFloat, diffureColor: UIColor, ambientColor: UIColor) {
        setup(ringRadius: ringRadius, pipeRadius: pipeRadius, diffuseColor: diffureColor, ambientColor: ambientColor)
    }
    
    init() {
        setup(ringRadius: defaultRingRadius, pipeRadius: defaultPipeRadius, diffuseColor: defaultDiffuseColor, ambientColor: defaultAmbientColor)
    }
    
    // MARK
    
    private func setup(ringRadius: CGFloat, pipeRadius: CGFloat, diffuseColor: UIColor, ambientColor: UIColor)  {
        let torus = SCNTorus(ringRadius: ringRadius, pipeRadius: pipeRadius)
        torus.firstMaterial!.diffuse.contents = diffuseColor
        torus.firstMaterial!.ambient.contents = ambientColor
        
        node = SCNNode(geometry: torus)
    }
}
