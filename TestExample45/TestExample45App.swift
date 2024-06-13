//
//  TestExample45App.swift
//  TestExample45
//
//  Created by Uday Venkat on 13/06/24.
//

import SwiftUI

@main
struct TestExample45App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
