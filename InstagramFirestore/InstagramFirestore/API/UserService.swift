//
//  UserService.swift
//  InstagramFirestore
//
//  Created by Julio Ismael Robles on 12/03/2022.
//

import Firebase

typealias FirestoreCompletion = (Error?) -> Void

struct UserService {
    static func fetchUser(completion: @escaping(User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            
            guard let dictionary = snapshot?.data() else { return }
            
            let user = User(dictionary: dictionary)
            
            completion(user)
        }
    }
    
    static func fetchAllUsers(completion: @escaping([User]) -> Void) {
        COLLECTION_USERS.getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else { return }
            
            let users = snapshot.documents.map({ User(dictionary: $0.data()) })
            
            completion(users)
        }
    }
    
    static func follow(uid: String, completion: @escaping(FirestoreCompletion)) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_FOLLOWING.document(currentUid).collection(UserServiceConstant.userFollowing).document(uid).setData([:]) { error in
            COLLECTION_FOLLOWERS.document(uid).collection(UserServiceConstant.userFollowers).document(currentUid).setData([:], completion: completion)
        }
    }
    
    static func unfollow(uid: String, completion: @escaping(FirestoreCompletion)) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_FOLLOWING.document(currentUid).collection(UserServiceConstant.userFollowing).document(uid).delete() {
            error in
            COLLECTION_FOLLOWERS.document(uid).collection(UserServiceConstant.userFollowers).document(currentUid).delete(completion: completion)
        }
    }
    
    static func checkIfUserIsFollowed(uid: String, completion: @escaping(Bool) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection(UserServiceConstant.userFollowing).document(uid).getDocument { (snapshot, error) in
            guard let isFollowed = snapshot?.exists else { return }
            completion(isFollowed)
        }
    }
    
    static func fetchUserStats(uid: String, completion: @escaping(UserStats) -> Void) {
        COLLECTION_FOLLOWERS.document(uid).collection(UserServiceConstant.userFollowers).getDocuments { (snapshot, _) in
            let followers = snapshot?.documents.count ?? 0
            COLLECTION_FOLLOWING.document(uid).collection(UserServiceConstant.userFollowing).getDocuments { (snapshot, _) in
                let following = snapshot?.documents.count ?? 0
                completion(UserStats(followers: followers, following: following))
            }
        }
    }
}
