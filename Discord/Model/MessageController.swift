//
//  MessageController.swift
//  Discord
//
//  Created by Leonardo Diaz on 8/15/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import Foundation

class MessageController {
    
    static var messages: [Message] = {
        [Message(date: Date(), displayName: "Mikey", messageText: "When's the pizza getting here?", profilePicture: #imageLiteral(resourceName: "mic")),
         Message(date: Date(), displayName: "Raph", messageText: "I told you in twenty minutes!!", profilePicture: #imageLiteral(resourceName: "rap")),
        Message(date: Date(), displayName: "Leo", messageText: "He did say that", profilePicture: #imageLiteral(resourceName: "leo")),
        Message(date: Date(), displayName: "Don", messageText: "Alright guys take it easy", profilePicture: #imageLiteral(resourceName: "don")),
        Message(date: Date(), displayName: "Mikey", messageText: "Pizza ipsum dolor amet sausage pizza platter, pizza roll pesto bbq parmesan mayo fresh tomatoes. Banana peppers fresh tomatoes thin crust pie pizza, garlic parmesan deep crust ricotta pineapple. NY style pesto sausage, chicken and bacon beef buffalo sauce garlic parmesan sausage black olives. Philly chicken parmesan burnt mouth anchovies party meatball broccoli.Black olives banana peppers pizza, meat lovers bbq white garlic sauteed onions sausage ranch peppers. Chicken and bacon bbq chicken wing burnt mouth ranch. Bacon chicken and bacon sauteed onions pineapple, fresh tomatoes philly steak pie buffalo sauce steak. Platter hawaiian thin crust bbq extra sauce. White pizza large mushrooms, fresh tomatoes ham anchovies bbq pan ricotta bacon pineapple NY style.", profilePicture: #imageLiteral(resourceName: "mic")),
        Message(date: Date(), displayName: "Raph", messageText: "shut up", profilePicture: #imageLiteral(resourceName: "rap"))
        ]
    }()
  
}
