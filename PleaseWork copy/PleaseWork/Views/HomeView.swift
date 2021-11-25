//
//  HomeView.swift
//  PleaseWork
//
//  Created by David Pidugu on 11/11/21.
//

import SwiftUI

struct HomeView: View {
    
    
    
    var body: some View {
        
        NavigationView {
            CustomTabView()
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
        }
        .accentColor(Color("AccentColor"))
    }
}

var tabs = ["house.fill", "magnifyingglass", "plus", "heart.fill", "person.fill"]

struct CustomTabView: View {
    @State var selectedTab = "house.fill"
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            NavigationView {
                TabView(selection: $selectedTab) {
                    Main().tag("house.fill")
                    Search().tag("magnifyingglass")
                    Add().tag("plus")
                    Notifications().tag("heart.fill")
                    Profile().tag("person.fill")
                }
                .accentColor(Color("AccentColor"))
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .bottom)
            }
            
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self){
                    image in
                    TabButton(image: image, selectedTab: $selectedTab)
                    
                    if image != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 5)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
            .padding(.horizontal)
            .padding(.bottom, edge!.bottom == 0 ? 20 : 0)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
    }
    
    
}

struct TabButton: View {
    var image: String
    
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {selectedTab = image}){
            Image(systemName: "\(image)")
                .foregroundColor(selectedTab == image ? Color.gray : Color.black)
                .padding()
        }
    }
    
    
}


