//
//  ShadersDataSource.swift
//  SceneShadertoy
//
//  Created by Astemir Eleev on 01/09/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//

import Foundation

/// Shader Data Source defines collections of different shader settings for different use cases. This class is supposed to be fed into some sort of host manager/handler e.g. UITableViewController, UICollectionViewController or something similar.
class ShadersDataSource {
    var geometrySettings = Settings(items: [
        NoneSettingItem(),
        ShaderSettingItem(shaderData: ShaderData(filename: "GeometryBubble")),
        ShaderSettingItem(shaderData: ShaderData(filename: "GeometryRipple")),
        ShaderSettingItem(shaderData: ShaderData(filename: "GeometryChemicalReaction"))
        ])
}
