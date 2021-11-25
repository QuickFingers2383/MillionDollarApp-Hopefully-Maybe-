//
//  SearchService.swift
//  PleaseWork
//
//  Created by David Pidugu on 11/11/21.
//

import Foundation
import FirebaseAuth


class SearchService {
     
    static func searchUser(input: String, onSuccess: @escaping (_ user: [User]) -> Void) {
        
        AuthService.storeRoot.collection("users").whereField("searchName", arrayContains: input.lowercased().removeWhiteSpace()).getDocuments{
            (querySnapshot, err) in
            
            guard let snap = querySnapshot else {
                print("Error")
                return
            }
            
            var users = [User]()
            for doccument in snap.documents {
                let dict = doccument.data()
                guard let decoded = try? User.init(fromDictionary: dict) else {return}
                
                if decoded.uid != Auth.auth().currentUser!.uid {
                    users.append(decoded)
                }
                
                onSuccess(users)
            }
        }
        
    }
    
}
    
