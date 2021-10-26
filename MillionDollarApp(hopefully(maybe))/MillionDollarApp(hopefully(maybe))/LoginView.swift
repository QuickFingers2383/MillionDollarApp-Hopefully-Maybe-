//
//  LoginView.swift
//  MillionDollarApp(hopefully(maybe))
//
//  Created by David Pidugu on 10/26/21.
//

import SwiftUI

struct LoginView: View {
    
    
    // MARK: - Propertiers
        @State private var email = ""
        @State private var password = ""
        
        // MARK: - View
        var body: some View {
            VStack() {
                Text("iOS App Templates")
                    .font(.largeTitle).foregroundColor(Color.white)
                    .padding([.top, .bottom], 40)
                    .shadow(radius: 10.0, x: 20, y: 10)
                
                Image("iosapptemplate")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .padding(.bottom, 50)
                
                VStack(alignment: .leading, spacing: 15) {
                    TextField("Email", text: self.$email)
                        .padding()
                        .background(Color("accent"))
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                    
                    SecureField("Password", text: self.$password)
                        .padding()
                        .background(Color("accent"))
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding([.leading, .trailing], 27.5)
                
                Button(action: {}) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding(.top, 50)
                
                Spacer()
                HStack(spacing: 0) {
                    Text("Don't have an account? ").foregroundColor(.white)
                    Button(action: {}) {
                        Text("Sign Up")
                            .foregroundColor(.white)
                    }
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("accent"), .black]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
            
        }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
