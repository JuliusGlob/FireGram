//
//  PostService.swift
//  InstagramFirestore
//
//  Created by Julio Ismael Robles on 13/03/2022.
//

import UIKit
import Firebase

struct PostService {
    
    static func uploadPost(caption: String, image: UIImage, completion: @escaping(FirestoreCompletion)) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        ImageUploader.uploadImage(image: image) { imageUrl in
            let data = ["caption": caption,
                        "timestamp": Timestamp(date: Date()),
                        "likes": 0,
                        "imageUrl": imageUrl,
                        "ownerUid": uid] as [String: Any]
            COLLECTION_POSTS.addDocument(data: data, completion: completion)
        }
    }
    
}
