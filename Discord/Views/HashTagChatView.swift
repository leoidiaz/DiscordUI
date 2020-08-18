//
//  HashTagChatView.swift
//  Discord
//
//  Created by Leonardo Diaz on 8/17/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

class HashTagChatView: UIButton {
    
    let hashImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        hashImage.image = UIImage(named: "pound")?.withRenderingMode(.alwaysTemplate)
        imageView?.tintColor = .init(white: 0.8, alpha: 0.5)
        setImage(hashImage.image, for: .normal)
        setTitle("general", for: .normal)
        titleLabel?.font = UIFont(name: "GillSans-SemiBold", size: 18)
        imageView?.contentMode = .scaleAspectFit
        setTitleColor(.init(white: 1, alpha: 0.5), for: .highlighted)
        imageEdgeInsets = UIEdgeInsets(top: 2, left: -2, bottom: 2, right: 2)
    }
}
