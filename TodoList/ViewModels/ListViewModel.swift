//
//  ListViewModel.swift
//  TodoList
//
//  Created by ramia n on 27/02/1445 AH.
//

import Foundation
class ListViewModel:ObservableObject{
    @Published var items:[ItemModel] = []{
        didSet{
            saveItem()
        }
    }
    let itemKey:String = "itemKey"
    
    init(){
        getItem()
    }
    func getItem(){
        
        guard let data = UserDefaults.standard.data(forKey: itemKey),let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data) else {return}
        
        items.append(contentsOf: savedItem)
        
//        let item:[ItemModel] = [
//        ItemModel(title: "First Item", isComplete: false),
//        ItemModel(title: "Second", isComplete: true)]
//        items.append(contentsOf: item)
    }
    func deleteItem(at:String){
        self.items = self.items.filter {$0.id != at}
        
    }
    func addItem(title:String){
        self.items.append(ItemModel(title: title, isComplete: false))
    }
    func updateItem(item:ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateComleteion()
        }
        
    }
    func saveItem(){
        if let encodeList = try? JSONEncoder().encode(items){
            UserDefaults.standard.setValue(encodeList, forKey: itemKey)
        }
    }
}
