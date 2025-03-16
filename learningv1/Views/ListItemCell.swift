//
//  ListItemCell.swift
//  learningv1
//
//  Created by Furqan Ali on 3/16/25.
//

import SwiftUI

struct ListItemCell: View {
    
    let item: MyListItemViewModel

    @State private var active: Bool = false
    @State private var showPopOver: Bool = false
    
    var onListItemDeleted:(MyListItemViewModel) -> Void = { _ in }
    
    var body: some View {
        
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: Constants.Icons.circle)
                .font(.system(size: 14))
                .opacity(0.2)
            
            VStack(alignment: .leading) {
                Text(item.title)
                if let dueDate = item.dueDate {
                    Text(dueDate.title)
                        .opacity(0.4)
                        .foregroundColor(dueDate.isPastDue ? .red: .primary)
                }
            }
            Spacer()
            if active {
                Image(systemName: Constants.Icons.multiplyCircle)
                    .foregroundColor(.red)
                    .onTapGesture {
                        onListItemDeleted(item)
                    }
                Image(systemName: Constants.Icons.exclaimationMarkCircle)
                    .foregroundColor(.purple)
                    .onTapGesture {
                        showPopOver = true
                    }.popover(isPresented: $showPopOver, arrowEdge: .leading) {
                        EditListItemView(item: item) {
                            showPopOver = false
                        }
                    }
            }
            
            
        }.contentShape(Rectangle())
            .onHover {value in
                if !showPopOver {
                    active = value
                }
            }
    }
}

#Preview {
    ListItemCell(item: MyListItemViewModel(myListItem: MyListItem()))
}
