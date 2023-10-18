//
//  AddView.swift
//  TodoList
//
//  Created by ramia n on 27/02/1445 AH.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State var newItem_tf:String = ""
    @State var errorMessage:String = ""
    @State var isvalid:Bool = false

    

    @EnvironmentObject var listViewModel:ListViewModel
    var body: some View {
        ScrollView {
            VStack{
                TextField("add new item", text: $newItem_tf)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(uiColor: .secondarySystemBackground))
//                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder( !isvalid ? Color.accentColor : Color.red, style: StrokeStyle(lineWidth: 1.0)))
                    .cornerRadius(10)
                if isvalid{
                    Text(errorMessage).foregroundColor(.red).font(.footnote)
                }
                
                Button {
                    if(newItem_tf.count > 3){
                        listViewModel.addItem(title: newItem_tf)
                        dismiss()
                    }else{
                        isvalid.toggle()
                        errorMessage = "Item is empty or less than 3"
                    }
                    
                } label: {
                    Text("save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                }

            }
            .navigationTitle("Add New Item ✏️")
        .padding(16)
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AddView()
        }.environmentObject(ListViewModel())
    }
}
