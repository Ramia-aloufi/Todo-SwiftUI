//
//  NoItemView.swift
//  TodoList
//
//  Created by ramia n on 27/02/1445 AH.
//

import SwiftUI

struct NoItemView: View {
    @State var animate:Bool = false
    var body: some View {
        ScrollView{
            VStack(spacing: 16){
                Text("There are no Item!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you productive persone ? I think you should click on add button to add bunch of items to your todo list")
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add some thing 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.cyan : Color.accentColor)
                        .cornerRadius(10)
//                        .padding(.horizontal,animate ? 30 : 30)
                        .scaleEffect(animate ? 0.85 : 0.90)
//                        .offset(y:animate ? -7 : 0)
                }

            }
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .padding(40)
//            .navigationTitle("title")
            .onAppear{
                addAnimation()
            }
    }
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
//            withAnimation(.easeInOut){
            withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()){
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            NoItemView()
        }
    }
}
