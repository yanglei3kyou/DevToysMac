//
//  AppModel.swift
//  DevToys
//
//  Created by yuki on 2022/01/29.
//

import CoreUtil

extension NSViewController {
    var appModel: AppModel! { chainObject as? AppModel }
}

final class AppModel {
    @XMObservable var tool: Tool = .home { didSet { toolIdentifier = tool.identifier } }
    @RestorableState("app.toolIdentifier") var toolIdentifier = ""
    @XMObservable var searchQuery = ""
    
    let toolManager = ToolManager.shared
    let settings = Settings()
    
    init() {
        self.tool = toolManager.toolForIdentifier(toolIdentifier) ?? .home
    }
}
