//
//  Constants.swift
//  InstagramFirestore
//
//  Created by Julio Ismael Robles on 12/03/2022.
//

import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")

let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")

let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")

let COLLECTION_POSTS = Firestore.firestore().collection("posts")

struct UserServiceConstant {
    static let userFollowing: String = "user-following"
    static let userFollowers: String = "user-followers"
}
