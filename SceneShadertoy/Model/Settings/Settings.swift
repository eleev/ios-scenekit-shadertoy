//
//  Settings.swift
//  SceneShadertoy
//
//  Created by Astemir Eleev on 01/09/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//

import Foundation

class Settings: NSObject {
    var items: [SettingItemType]
    
    init(items: [SettingItemType]) {
        self.items = items
    }
    
    func selected() -> SettingItemType? {
        for item in items {
            if item.selected {
                return item
            }
        }
        return nil
    }
}
