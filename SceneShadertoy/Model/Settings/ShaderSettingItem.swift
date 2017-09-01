//
//  ShaderSettingItem.swift
//  SceneShadertoy
//
//  Created by Astemir Eleev on 01/09/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//

import Foundation

class ShaderSettingItem: SettingItemType {
    var shaderData: ShaderData
    var selected: Bool
    var title: String {
        get {
            return shaderData.filename
        }
    }
    var shaderProgram: String {
        get {
            return shaderData.shaderProgram
        }
    }
    
    init(shaderData: ShaderData, selected: Bool = false) {
        self.shaderData = shaderData
        self.selected = selected
    }
}
