//
//  CustomButton.swift
//  DeepDiveIntoStyles
//
//  Created by Marcus Buexenstein on 2/16/25.
//

import SwiftUI

struct CustomButton: View {
    @Binding var isFavorite: Bool
    
    let title: String
    let image1: String
    let image2: String
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Label(title, systemImage: isFavorite ? "checkmark": "heart")
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
}

#Preview {
    CustomButton(isFavorite: .constant(false), title: "Click Me", image1: "checkmark", image2: "heart", action: { })
}
