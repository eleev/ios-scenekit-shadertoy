//
//  SettingItem.swift
//  SceneShadertoy
//
//  Created by Astemir Eleev on 01/09/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//

import Foundation

protocol SettingItemType {
    
    // MARK: - Properties
    
    var title: String { get }
    var selected: Bool { get set }
}
