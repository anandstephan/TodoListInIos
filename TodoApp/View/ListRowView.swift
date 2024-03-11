//
//  ListRowView.swift
//  TodoApp
//
//  Created by Anand Stephan on 11/03/24.
//

import SwiftUI

struct ListRowView: View {
    var item:ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle":"circle")
                .foregroundColor(item.isCompleted ? .green:.gray)
            Text(item.title)
            Spacer()
        }.font(.title2)
            .padding(.vertical,8)
    }
}

var item1: ItemModel = ItemModel(title: "Item 1", isCompleted: false)
#Preview {

    ListRowView(item:item1)
}
