//
//  PleaseWorkApp.swift
//  PleaseWork
//
//  Created by David Pidugu on 11/10/21.
//

import SwiftUI
import Firebase

@main
struct PleaseWorkApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(SessionStore())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        print("Firebase...")
        FirebaseApp.configure()
        return true
    }
    
}
