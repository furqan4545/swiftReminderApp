//
//  SwiftUIView.swift
//  learningv1
//
//  Created by Furqan Ali on 3/10/25.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            SideBarView()
            Text("Main App!")
        }
    }
}

#Preview {
    HomeScreen()
}
