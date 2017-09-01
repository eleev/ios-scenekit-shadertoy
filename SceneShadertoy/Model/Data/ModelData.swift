//
//  ModelData.swift
//  SceneShadertoy
//
//  Created by Astemir Eleev on 01/09/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//

import Foundation
import SceneKit

class ModelData: NSObject {
    var filename: String
    var node: SCNNode
    
    init(filename: String, nodeName: String, nodeSetup: ((SCNNode) -> Void)? = nil) {
        self.filename = filename
        node = SCNScene(named: "art.scnassets/\(filename).dae")?.rootNode.childNode(withName: nodeName, recursively: true) as SCNNode!
        nodeSetup?(node)
    }
    
    init(name: String, node: SCNNode, nodeSetup: ((SCNNode) -> Void)? = nil) {
        self.filename = name
        self.node = node
        nodeSetup?(node)
    }
}
