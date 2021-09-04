//
//  MillionDollarApp_hopefully_maybe__App.swift
//  MillionDollarApp(hopefully(maybe))
//
//  Created by Yanjun Wang on 9/4/21.
//

import SwiftUI

@main
struct MillionDollarApp_hopefully_maybe__App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
