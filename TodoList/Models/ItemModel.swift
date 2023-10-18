//
//  ItemModel.swift
//  TodoList
//
//  Created by ramia n on 27/02/1445 AH.
//

import Foundation

struct ItemModel:Identifiable,Codable{
    let id:String
    let title:String
    let isComplete:Bool
    
    init(id:String = UUID().uuidString,title: String, isComplete: Bool) {
        self.id = id
        self.title = title
        self.isComplete = isComplete
    }
    func updateComleteion() -> ItemModel{
        return ItemModel(id:id,title: title, isComplete: !isComplete)
    }
    
}

