//
//  ListViewModel.swift
//  TodoApp
//
//  Created by Anand Stephan on 10/03/24.
//

import Foundation

class ListViewModel:ObservableObject{
    
    @Published var items:[ItemModel] = [] {
        didSet{
            saveItems()
        }
    }
    init(){
        getItems()
    }
    
    let itemsKey: String = "items_List"
    
    func saveItems(){
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodeData,forKey: itemsKey)
        }
    }
    
    func getItems(){
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else{
            return
        }
        
        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else{
            return
        }
        
        self.items = savedItems
    }
    
    
    func addItem(title:String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func update(item:ItemModel){
        if let index = items.firstIndex(where: { $0.id==item.id }){
            items[index] = item.updateCompleted()
        }
    }
    
    func deleteItem(index:IndexSet){
        items.remove(atOffsets: index)
    }
    
    func moveItem(from:IndexSet,to:Int){
        print("hh .\(from) , .\(to)")
        items.move(fromOffsets: from, toOffset: to)
    }
}
