//
//  ContentView.swift
//  PleaseWork
//
//  Created by David Pidugu on 11/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var session: SessionStore
    
    func listen(){
        session.listen()
    }
    
    var body: some View {
        
        Group{
            if(session.session != nil) {
                HomeView()
            } else {
                SignInView()
            }
        }.onAppear(perform: listen)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
