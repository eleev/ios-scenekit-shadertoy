//
//  ShaderData.swift
//  SceneShadertoy
//
//  Created by Astemir Eleev on 01/09/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//

import Foundation

class ShaderData: NSObject {
    
    // MARK: - Properties
    
    var filename: String
    var shaderProgram: String
    
    // MARK: - Initializers
    
    init(filename: String) {
        self.filename = filename
        let path = Bundle.main.path(forResource: self.filename, ofType: "shader")
        shaderProgram = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
    }
}
