//
//  UserModel.swift
//  PleaseWork
//
//  Created by David Pidugu on 11/11/21.
//

import Foundation

struct User: Encodable, Decodable{
    var uid: String
    var email: String
    var profileImageUrl: String
    var username: String
    var searchName: [String]
    var bio: String
}
