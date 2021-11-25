//
//  EditProfile.swift
//  PleaseWork
//
//  Created by David Pidugu on 11/15/21.
//

import SwiftUI
import Firebase

struct EditProfile: View {
    @EnvironmentObject var session: SessionStore
    
    @State private var username: String = ""
    @State private var profileImage: Image?
    @State private var pickedImage: Image?
    @State private var showingActionSheet = false
    @State private var showingImagePicker = false
    @State private var imageData: Data = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var error: String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Oh No"
    @State private var bio: String = ""
    
    init(session: User?){
        _bio = State(initialValue: session?.bio ?? "")
        _username = State(initialValue: session?.username ?? "")
    }
    
    func loadImage() {
        guard let inputImage = pickedImage else {return}
        profileImage = inputImage
    }
    
    func errorCheck() -> String? {
        if username.trimmingCharacters(in: .whitespaces).isEmpty || bio.trimmingCharacters(in: .whitespaces).isEmpty || imageData.isEmpty {
            return "Please provide a username or profile image"
        }
        return nil
    }
    
    func clear(){
        self.bio = ""
        self.username = ""
        self.imageData = Data()
        self.profileImage = Image(systemName: "person.circle.fill")
    }
    
//    func signUp() {
//        if let error = errorCheck() {
//            self.error = error
//            self.showingAlert = true
//            return
//        }
//
//        guard let userid = Auth.auth().currenUser?.uid else { return }
//
//        let storageProfileUserId = StorageService.storageProfile(userId: userid)
//
//        let metadata = StorageMetadata
//    }
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

