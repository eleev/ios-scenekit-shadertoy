//
//  Torus.swift
//  SceneShadertoy
//
//  Created by Astemir Eleev on 01/09/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//

import Foundation
import SceneKit

class TorusNode: SCNNode, GeometryType {
    
    // MARK: - Properties
    
    let defaultRingRadius: CGFloat = 4.0
    let defaultPipeRadius: CGFloat = 1.5
    
    // MARK: - Initializers
    
    init(ringRadius: CGFloat, pipeRadius: CGFloat, diffureColor: UIColor, ambientColor: UIColor) {
        super.init()
        setup(ringRadius: ringRadius, pipeRadius: pipeRadius, diffuseColor: diffureColor, ambientColor: ambientColor)
    }
    
    override init() {
        super.init()
        setup(ringRadius: defaultRingRadius, pipeRadius: defaultPipeRadius, diffuseColor: defaultDiffuseColor, ambientColor: defaultAmbientColor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Requied initiazlier has not been implemeneted")
    }
    
    // MARK
    
    private func setup(ringRadius: CGFloat, pipeRadius: CGFloat, diffuseColor: UIColor, ambientColor: UIColor) {
        let torus = SCNTorus(ringRadius: ringRadius, pipeRadius: pipeRadius)
        torus.firstMaterial!.diffuse.contents = diffuseColor
        torus.firstMaterial!.ambient.contents = ambientColor
        self.geometry = torus
    }
}
