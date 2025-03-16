//
//  MyListItemHeaderView.swift
//  learningv1
//
//  Created by Furqan Ali on 3/15/25.
//

import SwiftUI

struct MyListItemsHeaderView: View {
    
    let name: String
    let count: Int
    let color: Color
    
    
    var body: some View {
        HStack{
            Text(name)
                .font(.system(size: 28))
                .fontWeight(.bold)
                .foregroundColor(color)
                .padding()
            
            Spacer()
            Text("\(count)")
                .font(.system(size: 32))
                .foregroundColor(color)
                .padding()
        }
    }
}

#Preview {
    MyListItemsHeaderView(name: "Groceries", count: 6, color: Color.green)
}
