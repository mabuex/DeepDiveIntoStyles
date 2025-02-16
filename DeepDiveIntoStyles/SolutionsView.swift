//
//  SolutionsView.swift
//  DeepDiveIntoStyles
//
//  Created by Marcus Buexenstein on 2/16/25.
//

import SwiftUI

struct SolutionsView: View {
    @State private var isFavorite = false
    @State private var isOn = false
    @State private var text = ""
    
    var body: some View {
        List {
            Section("Button") {
                Button("Click Me", systemImage: isFavorite ? "checkmark": "heart") {
                    withAnimation {
                        isFavorite.toggle()
                    }
                }
                .contentTransition(.symbolEffect(.replace))
                .buttonStyle(.capsule)
            }
            
            Section("TextField") {
                TextField("Search...", text: $text)
                    .textFieldStyle(.search($text))
            }
            
            Section("Toggle") {
                Toggle("Is On", isOn: $isOn)
                    .toggleStyle(.circle)
            }
            
            Section("Label") {
                Label("Click Me", systemImage: "heart")
                    .labelStyle(.vertical)
            }
        }
    }
}

#Preview {
    SolutionsView()
}
