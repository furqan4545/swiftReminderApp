//
//  MyListView.swift
//  learningv1
//
//  Created by Furqan Ali on 3/15/25.
//

import SwiftUI

struct MyListsView: View {
    
    @ObservedObject var vm: MyListsViewModel
    
    init(vm: MyListsViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            List {
                AllCountView(count: vm.allListItemCount)
                Text("My Lists")
                ForEach(vm.myLists) { myList in
                    
                    NavigationLink{
                        MyListItemsHeaderView(name: myList.name, count: myList.itemsCount, color: myList.color)
                        
                        MyListItemsView(
                            items: myList.items,
                            onItemsAdded: {title, dueDue in
                            vm.saveTo(list: myList, title: title, dueDate: dueDue)
                            }, onItemDeleted: vm.deleteItem, onItemCompleted: vm.markAsCompleted)
                    } label: {
                        HStack {
                            Image(systemName: Constants.Icons.line3HorizontalCircleFill).font(.title)
                                .foregroundColor(myList.color)
                            Text(myList.name)
                            Spacer()
                            Text("\(myList.itemsCount)")
                        }
                    }.contextMenu {
                        Button {
                            // action
                            vm.delete(myList)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let context = CoreDataManager.shared.persistentContainer.viewContext
    MyListsView(vm: MyListsViewModel(context: context))
}
