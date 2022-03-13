//
//  InputTextView.swift
//  InstagramFirestore
//
//  Created by Julio Ismael Robles on 13/03/2022.
//

import UIKit

class InputTextView: UITextView {
    
    // reminder use this for any textfield you want to have a placeholder.
    var placeholderText: String? {
        didSet { placeHolderLabel.text = placeholderText}
    }
    
    //MARK: - Properties
    private let placeHolderLabel: UILabel = {
       let label = UILabel()
        label.textColor = .lightGray
        return label
    }()
    
    
    //MARK: - Lifecycle
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        addSubview(placeHolderLabel)
        placeHolderLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 6, paddingLeft: 8)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextDidChange), name: UITextView.textDidChangeNotification, object: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    @objc
    func handleTextDidChange() {
        placeHolderLabel.isHidden = !text.isEmpty
    }
}
