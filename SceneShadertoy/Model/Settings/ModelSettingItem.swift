//
//  ModelSettingItem.swift
//  SceneShadertoy
//
//  Created by Astemir Eleev on 01/09/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//

import Foundation

class ModelSettingItem: SettingItemType {
    var modelData: ModelData
    var selected: Bool
    
    var title: String {
        get {
            return modelData.filename
        }
    }
    
    init(modelData: ModelData, selected: Bool = false) {
        self.modelData = modelData
        self.selected = selected
    }
}
