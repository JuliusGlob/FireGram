//
//  ProfileHeaderViewModel.swift
//  InstagramFirestore
//
//  Created by Julio Ismael Robles on 12/03/2022.
//

import UIKit

struct ProfileHeaderViewModel {
    let user: User
    
    var fullname: String {
        return user.fullname.capitalized
    }
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    var followButtonTest: String {
        if user.isCurrentUser {
            return "Edit Profile"
        }
        return user.isFollowed ? "Following" : "Follow"
    }
    
    var followButtonBackgroundColor: UIColor {
        return user.isCurrentUser ? .white : .systemBlue
    }
    
    var followButtonTextColor: UIColor {
        return user.isCurrentUser ? .black : .white
    }
    
    var numberOfFollowers: NSAttributedString {
        return attributedStatText(value: user.stats.followers, label: "followers")
    }
    
    var numberofFollowing: NSAttributedString {
        return attributedStatText(value: user.stats.following, label: "following")
    }
    
    var numberOfPosts: NSAttributedString {
        return attributedStatText(value: 5, label: "posts")
    }
    
    init(user: User) {
        self.user = user
    }
    
    private func attributedStatText(value: Int, label: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "\(value)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        let attributedLabel = NSMutableAttributedString(string: "\(label)", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.lightGray])
        attributedText.append(attributedLabel)
        return attributedText
    }
}
