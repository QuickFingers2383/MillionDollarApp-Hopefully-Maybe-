//
//  MillionDollarApp_hopefully_maybe__App.swift
//  MillionDollarApp(hopefully(maybe))
//
//  Created by Yanjun Wang on 9/4/21.
//

import SwiftUI
import Foundation

@main
struct MillionDollarApp_hopefully_maybe__App: App {
    let persistenceController = PersistenceController.shared
    
    init() {
           UINavigationBar.appearance().backgroundColor = UIColor.clear
           UINavigationBar.appearance().isTranslucent = true
           UINavigationBar.appearance().titleTextAttributes = [
               .foregroundColor: UIColor(named: "accent")!
           ]
           UINavigationBar.appearance().largeTitleTextAttributes = [
               .foregroundColor: UIColor(named: "accent")!
           ]
           UINavigationBar.appearance().tintColor = UIColor(named: "accent")
//           UINavigationBar.appearance().barTintColor = UIColor(named: "accent")
           UITabBar.appearance().backgroundImage = UIImage()
           UITabBar.appearance().isTranslucent = true
           UITabBar.appearance().backgroundColor = UIColor.clear
           UITabBar.appearance().tintColor = UIColor(named: "accent")
       }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
