//
//  AddNewListView.swift
//  learningv1
//
//  Created by Furqan Ali on 3/13/25.
//

import SwiftUI

struct AddNewListView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var vm: AddNewListViewModel
    
    init(vm: AddNewListViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                Text("Next List")
                    .font(.headline)
                    .padding(.bottom, 20)
                HStack {
                    Text("Name: ")
                    TextField("", text: $vm.name)
                }
                HStack {
                    Text("Color: ")
                    ColorListView(selectedColor: $vm.color)
                }
            }
            HStack {
                Spacer()
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                Button("Ok") {
                    vm.save()
                    presentationMode.wrappedValue.dismiss()
                }.disabled(vm.name.isEmpty)
            }
            
        }.frame(minWidth: 300)
            .padding()
    }
}

#Preview {
    let viewContext = CoreDataManager.shared.persistentContainer.viewContext
    AddNewListView(vm: AddNewListViewModel(context: viewContext))
}
