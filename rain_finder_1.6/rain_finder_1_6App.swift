//
//  rain_finder_1_6App.swift
//  rain_finder_1.6
//
//  Created by Tomasz Zuczek on 28/06/2022.
//

import SwiftUI

@main
struct rain_finder_1_6App: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
