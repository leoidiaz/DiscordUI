//
//  ChatTableViewCell.swift
//  Discord
//
//  Created by Leonardo Diaz on 8/12/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    let displayNameLabel = UILabel()
    let dateSentLabel = UILabel()
    let profilePicture = UIImageView()
    let messageLabel = UILabel()
    
    var message: Message? {
        didSet{
            setUpCell()
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    func setUpCell(){
        guard let message = message else { return }
        addSubview(displayNameLabel)
        addSubview(dateSentLabel)
        addSubview(profilePicture)
        addSubview(messageLabel)
        setup(message: message)
        layout()
    }
    
    func setup(message: Message){
        displayNameLabel.text = message.displayName
        displayNameLabel.textColor = .init(white: 1, alpha: 0.9)
        displayNameLabel.font = UIFont(name: "GillSans-SemiBold", size: 16)
        displayNameLabel.adjustsFontForContentSizeCategory = true
        
        dateSentLabel.textColor = .init(white: 1, alpha: 0.3)
        dateSentLabel.text = message.date.dateString()
        dateSentLabel.font = .systemFont(ofSize: 11)
        
        profilePicture.image = message.profilePicture
        profilePicture.contentMode = .scaleAspectFill
        profilePicture.clipsToBounds = true
        profilePicture.layer.cornerRadius = 40 / 2
        
        messageLabel.text = message.messageText
        messageLabel.textColor = .init(white: 1, alpha: 0.7)
        messageLabel.font = UIFont(name: "GillSans", size: 15)
        messageLabel.adjustsFontForContentSizeCategory = true
        messageLabel.numberOfLines = 0
        
    }
    
    func layout(){
        displayNameLabel.translatesAutoresizingMaskIntoConstraints = false
        dateSentLabel.translatesAutoresizingMaskIntoConstraints = false
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            profilePicture.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            profilePicture.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            profilePicture.heightAnchor.constraint(equalToConstant: 40),
            profilePicture.widthAnchor.constraint(equalToConstant: 40),
            displayNameLabel.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 16),
            displayNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            displayNameLabel.trailingAnchor.constraint(equalTo: dateSentLabel.leadingAnchor, constant: -10),
            dateSentLabel.centerYAnchor.constraint(equalTo: displayNameLabel.centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: profilePicture.trailingAnchor, multiplier: 2),
            messageLabel.topAnchor.constraint(equalToSystemSpacingBelow: displayNameLabel.bottomAnchor, multiplier: 0.5),
            trailingAnchor.constraint(equalToSystemSpacingAfter: messageLabel.trailingAnchor, multiplier: 1),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
