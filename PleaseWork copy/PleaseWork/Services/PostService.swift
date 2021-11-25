//
//  PostService.swift
//  PleaseWork
//
//  Created by David Pidugu on 11/11/21.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class PostService {
    
    static var Posts = AuthService.storeRoot.collection("posts")
    
    static var AllPosts = AuthService.storeRoot.collection("allPosts")
    static var Timeline = AuthService.storeRoot.collection("timeline")
    
    static func PostsUserId(userId: String) -> DocumentReference {
        return Posts.document(userId)
    }
    static func timelineUserId(userId: String) -> DocumentReference {
        return Timeline.document(userId)
    }
    
    static func uploadPost(caption: String, imageData: Data, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let postId = PostService.PostsUserId(userId: userId).collection("posts").document().documentID
        
        let storagePostref = StorageService.storagePostId(postId: postId)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        StorageService.savePostPhoto(userId: userId, caption: caption, postId: postId, imageData: imageData, metadata: metadata, storagePostRef: storagePostref, onSuccess: onSuccess, onError: onError)
        
    }
    
    static func loadPost(postId: String, onSuccess: @escaping(_ post: AddModel) -> Void) {
        PostService.AllPosts.document(postId).getDocument {
            (snapshot, err) in
            
            guard let snap = snapshot else {
                print("Error")
                return
            }
            
            let dict = snap.data()
            
            guard let decoded = try? AddModel.init(fromDictionary: dict!) else { return }
            onSuccess(decoded)
        }
    }
    
    static func loadUserPosts(userId: String, onSuccess: @escaping(_ posts: [AddModel]) -> Void) {
        PostService.PostsUserId(userId: userId).collection("posts").getDocuments{
            (snapshot, error) in
            
            guard let snap = snapshot else {
                print("Error")
                return
            }
            
            var posts = [AddModel]()
            
            for doc in snap.documents {
                let dict = doc.data()
                guard let decoder = try? AddModel.init(fromDictionary: dict)
                else {
                    return
                }
                posts.append(decoder)
            }
            onSuccess(posts)
        }
    }
}
