//
//  ButtonView.swift
//  DeepDiveIntoStyles
//
//  Created by Marcus Buexenstein on 2/16/25.
//

import SwiftUI

struct ButtonView: View {
    @State private var isFavorite = false
    
    var body: some View {
        List {
            Section("Not so good solution") {
                Button(action: toggleAction){
                    Label("Click Me", systemImage: isFavorite ? "checkmark": "heart")
                        .frame(height: 24)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundStyle(.white)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .background(.blue)
                        .clipShape(.capsule)
                        .contentTransition(.symbolEffect(.replace))
                }
            }
            
            Section("Better solution") {
                CustomButton(
                    isFavorite: $isFavorite,
                    title: "Click Me",
                    image1: "checkmark",
                    image2: "heart",
                    action: toggleAction
                )
            }
            
            Section("Perfect solution") {
                Button("Click Me", systemImage: isFavorite ? "checkmark": "heart", action: toggleAction)
                    .contentTransition(.symbolEffect(.replace))
                    .buttonStyle(.capsule)
                
                Button("Click Me", systemImage: isFavorite ? "checkmark": "heart", action: toggleAction)
                    .contentTransition(.symbolEffect(.replace))
                    .buttonStyle(.capsule(.pink))
                
                Button("Click Me", systemImage: isFavorite ? "checkmark": "heart", action: toggleAction)
                    .labelStyle(.vertical(.large))
                    .contentTransition(.symbolEffect(.replace))
                    .buttonStyle(.circle(.mint))
            }
            .listRowSeparator(.hidden)
        }
    }
    
    func toggleAction() {
        withAnimation {
            isFavorite.toggle()
        }
    }
}

#Preview {
    ButtonView()
}
