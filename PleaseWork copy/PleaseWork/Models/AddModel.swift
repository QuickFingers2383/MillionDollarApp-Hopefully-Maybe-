//
//  AddModel.swift
//  PleaseWork
//
//  Created by David Pidugu on 11/11/21.
//

import Foundation

struct AddModel: Encodable, Decodable {
    var caption: String
    var likes: [String: Bool]
    var geoLoaction: String
    var ownerId: String
    var postId: String
    var username: String
    var profile: String
    var mediaUrl: String
    var date: Double
    var likeCount: Int
}
