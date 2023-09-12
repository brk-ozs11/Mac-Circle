//
//  Mac_CircleApp.swift
//  Mac Circle
//
//  Created by Berk Özüş on 10.09.2023.
//

import SwiftUI

@main
struct Mac_CircleApp: App {
    var body: some Scene {
        
        MenuBarExtra("Utility App", systemImage: "circle.fill") {
            contentView()
        }.menuBarExtraStyle(.window)
    }
}
