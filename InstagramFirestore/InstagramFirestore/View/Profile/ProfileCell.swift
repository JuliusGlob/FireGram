//
//  ProfileCell.swift
//  InstagramFirestore
//
//  Created by Julio Ismael Robles on 11/03/2022.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    // MARK: - Properties
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "venom-7")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        
        addSubview(postImageView)
        postImageView.fillSuperView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
