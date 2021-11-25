//
//  CommentModel.swift
//  PleaseWork
//
//  Created by David Pidugu on 11/12/21.
//

import Foundation


struct CommentModel: Encodable, Decodable, Identifiable {
    
    var id = UUID()
    var profile: String
    var postId: String
    var username: String
    var date: Double
    var comment: String
    var ownerId: String
    
}
