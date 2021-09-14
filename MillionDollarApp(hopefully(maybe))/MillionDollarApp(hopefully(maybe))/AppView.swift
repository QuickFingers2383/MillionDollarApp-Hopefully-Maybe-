//
//  AppView.swift
//  MillionDollarApp(hopefully(maybe))
//
//  Created by David Pidugu on 9/14/21.
//

import SwiftUI

struct AppView: View {
    @State private var selectedItem = 1
    @State private var shouldShowActionSheet = false
    @State private var oldSelectedItem = 1
    
    var body: some View {
        TabView (selection: $selectedItem) {
            ContentView()
                .tabItem { Image(systemName: "house") }
                .tag(1)
                .onAppear { self.oldSelectedItem = self.selectedItem }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
