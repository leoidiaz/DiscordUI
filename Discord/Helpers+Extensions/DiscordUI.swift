//
//  DiscordUI.swift
//  Discord
//
//  Created by Leonardo Diaz on 8/5/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

func makeRoundButton(name: String) -> UIButton{
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    let configScale = UIImage.SymbolConfiguration(scale: .medium)
    button.setImage(UIImage(systemName: name, withConfiguration: configScale), for: .normal)
    button.imageView?.tintColor = .lightText
    button.layer.cornerRadius = BottomViewButton.height / 2
    button.imageView?.contentMode = .scaleAspectFit
    button.backgroundColor = .darkBackground
    return button
}

func makeButtonImage(name: String, view: UIViewController) -> UIBarButtonItem {
    let button = UIBarButtonItem(image: UIImage(named: name), style: .plain, target: view, action: nil)
    return button
}

extension UIColor {
    static let defaultBackground = UIColor(named: "defaultBackground")!
    static let darkBackground = UIColor(named: "darkBackground")!
}


extension Date {
    func dateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: self)
    }
}
