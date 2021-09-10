//
//  SettingsView.swift
//  MillionDollarApp(hopefully(maybe))
//
//  Created by Yanjun Wang on 9/9/21.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    
    @State private var account = false
    @State private var signOut = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: { account.toggle() },
                    label: {
                    Text("Account Information")
                })
                Button(action: { signOut.toggle() },
                    label: {
                    Text("Sign Out")
                })
            }
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
