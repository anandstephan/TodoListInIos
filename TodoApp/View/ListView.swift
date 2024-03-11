//
//  ListView.swift
//  TodoApp
//
//  Created by Anand Stephan on 11/03/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listviewModel:ListViewModel
    
    var body: some View {
        ZStack{
            if listviewModel.items.isEmpty{
                NoListView()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }else{
                List{
                    ForEach(listviewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listviewModel.update(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listviewModel.deleteItem)
                    .onMove(perform:listviewModel.moveItem)
                }
            }
        }.navigationTitle("Todo List 🚀")
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add",destination: AddView()))
    }
}

#Preview {
    ListView()
}
