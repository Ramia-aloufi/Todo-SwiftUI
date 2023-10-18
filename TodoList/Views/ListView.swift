//
//  ListView.swift
//  TodoList
//
//  Created by ramia n on 27/02/1445 AH.
//

import SwiftUI

struct ListView: View {
    
    
    @EnvironmentObject var listViewModel:ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemView()
            }else{
                List(listViewModel.items){
                    let item:ItemModel = $0
                    
                    ListRowView(item: item)
                        .onTapGesture {
                            listViewModel.updateItem(item: item)
                        }
                    
                        .swipeActions(edge: .trailing) {
                            Button {
                                self.listViewModel.deleteItem(at: item.id)
                                
                            } label: {
                                Text("delete")
                            }
                            .tint(.red)
                            
                        }}
                
            }
            
        }
                
                .navigationTitle("ToDoList ⭐️")
                .toolbar {
                  
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            AddView()
                        } label: {
                            Image(systemName: "plus")    
                }
            }
            
        }
    }
    }

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ListView().preferredColorScheme(.dark)} .environmentObject(ListViewModel())
    }
}


