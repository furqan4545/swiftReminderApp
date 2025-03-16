//
//  ColorListView.swift
//  learningv1
//
//  Created by Furqan Ali on 3/13/25.
//

import SwiftUI

struct ColorListView: View {
    
    let colors = [Color.red, Color.blue, Color.green, Color.orange, Color.purple]
    
    @Binding var selectedColor: Color
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                
                Image(systemName: selectedColor == color ?
                      Constants.Icons.recordCircleFill:
                        Constants.Icons.circleFill)
                    .foregroundColor(color)
                    .font(.system(size: 12))
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedColor = color
                    }
                    
            }
        }
    }
}

#Preview {
    ColorListView(selectedColor: .constant(.blue))
}
