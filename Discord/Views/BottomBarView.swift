//
//  BottomBarView.swift
//  Discord
//
//  Created by Leonardo Diaz on 8/3/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

class BottomBarView: UIView {
    
    let messageField = UITextField()
    var addImageButton = UIButton()
    var cameraButton = UIButton()
    var emojiButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
        addLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BottomBarView {
    func setup(){
        messageField.translatesAutoresizingMaskIntoConstraints = false
        emojiButton.translatesAutoresizingMaskIntoConstraints = false
        
        messageField.layer.cornerRadius = 17
        messageField.backgroundColor = .darkBackground
        messageField.tintColor = .lightText
        messageField.font = UIFont(name: "GillSans", size: 16)
        // Add Padding
        messageField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: messageField.frame.height))
        messageField.leftViewMode = .always
        messageField.textColor = .init(white: 1, alpha: 0.7)
        messageField.attributedPlaceholder = NSAttributedString(string: "Message #general", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(white: 1, alpha: 0.3)])
        // Set emoticon Image
        let smileImage = UIImage(named: "emoticon")
        let tintedImage = smileImage?.withRenderingMode(.alwaysTemplate)
        emojiButton.setImage(tintedImage, for: .normal)
        emojiButton.tintColor = .lightText
        emojiButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -17, bottom: 0, right: 0)
        /// add right emoji button
        messageField.rightView = emojiButton
        messageField.rightViewMode = .always
        //
        addImageButton = makeRoundButton(name: "photo.fill")
        addImageButton.backgroundColor = .darkBackground
        
        cameraButton = makeRoundButton(name: "gift.fill")
        cameraButton.backgroundColor = .darkBackground
    }
    
    func addLayout(){
        addSubview(messageField)
        addSubview(addImageButton)
        addSubview(cameraButton)
        addSubview(emojiButton)
        NSLayoutConstraint.activate([
            messageField.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            messageField.heightAnchor.constraint(equalToConstant: 35),
            trailingAnchor.constraint(equalToSystemSpacingAfter: messageField.trailingAnchor, multiplier: 1),
            messageField.leadingAnchor.constraint(equalToSystemSpacingAfter: cameraButton.trailingAnchor, multiplier: 1),
            addImageButton.centerYAnchor.constraint(equalTo: messageField.centerYAnchor),
            addImageButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            addImageButton.heightAnchor.constraint(equalToConstant: BottomViewButton.height),
            addImageButton.widthAnchor.constraint(equalToConstant: BottomViewButton.height),
            cameraButton.leadingAnchor.constraint(equalToSystemSpacingAfter: addImageButton.trailingAnchor, multiplier: 2),
            cameraButton.centerYAnchor.constraint(equalTo: messageField.centerYAnchor),
            cameraButton.widthAnchor.constraint(equalToConstant: BottomViewButton.height),
            cameraButton.heightAnchor.constraint(equalToConstant: BottomViewButton.height)
        ])
    }
}
