//
//  MyListItemsView.swift
//  learningv1
//
//  Created by Furqan Ali on 3/15/25.
//

import SwiftUI

struct MyListItemsView: View {
    
    var items: [MyListItemViewModel]
    
    typealias ItemsAdded = ((String, Date?) -> Void)?
    typealias ItemDeleted = ((MyListItemViewModel) -> Void)?
    typealias ItemCompleted = ((MyListItemViewModel) -> Void)?
    
    var onItemsAdded: ItemsAdded
    var onItemDeleted: ItemDeleted
    var onItemCompleted: ItemCompleted
    
    init(items: [MyListItemViewModel] ,onItemsAdded: ItemsAdded = nil, onItemDeleted: ItemDeleted = nil, onItemCompleted: ItemCompleted = nil) {
        self.items = items
        self.onItemsAdded = onItemsAdded
        self.onItemDeleted = onItemDeleted
        self.onItemCompleted = onItemCompleted
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            List{
                
                ForEach(items, id: \.listItemId) { item in
                    ListItemCell(item: item, onListItemDeleted: {item in onItemDeleted?(item)
                    }, onListItemCompleted: { item in
                        onItemCompleted?(item)
                    } )
                    Divider()
                }
                
                AddNewListItemView{
                    title, dueDate in
                    onItemsAdded?(title, dueDate)
                }
                
            }
        }
    }
}

#Preview {
    MyListItemsView(items: [])
}
