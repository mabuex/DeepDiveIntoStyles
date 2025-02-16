//
//  CustomTextField.swift
//  DeepDiveIntoStyles
//
//  Created by Marcus Buexenstein on 2/16/25.
//

import SwiftUI

struct CustomTextField: View {
    @FocusState private var isFocused
    
    @State private var showOutline = false
    
    @Binding var text: String
    
    let placeholderText: String
    
    let image: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(.secondary)
            
            TextField(placeholderText, text: $text)
                .focused($isFocused)
            
            Button {
                text.removeAll()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(Color(.placeholderText))
                    .padding(.trailing, 10)
            }
            .buttonStyle(.plain)
            .opacity(text.isEmpty ? 0 : 1)
        }
        .padding(.leading, 12)
        .padding(.vertical, 8)
        .background {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Color(.systemGray5))
        }
        .padding(2)
        .overlay {
            RoundedRectangle(cornerRadius: 9, style: .continuous)
                .stroke(showOutline ? AnyShapeStyle(.tint) : AnyShapeStyle(.clear), lineWidth: 2)
        }
        .onChange(of: isFocused) {
            withAnimation {
                showOutline.toggle()
            }
        }
    }
}

#Preview {
    CustomTextField(text: .constant(""), placeholderText: "Enter something...", image: "magnifyingglass")
}
