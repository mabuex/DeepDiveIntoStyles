//
//  TextFieldView.swift
//  DeepDiveIntoStyles
//
//  Created by Marcus Buexenstein on 2/16/25.
//

import SwiftUI

struct TextFieldView: View {
    @State private var text = ""
    
    @State private var showOutline = false
    
    @FocusState var isFocused
    
    var body: some View {
        List {
            Section("Not so good solution") {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                    
                    TextField("Search...", text: $text)
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
            
            Section("Better solution") {
                CustomTextField(
                    text: $text,
                    placeholderText: "Search...",
                    image: "magnifyingglass"
                )
            }
            
            Section("Perfect solution") {
                TextField("Search...", text: $text)
                    .textFieldStyle(.search($text))
                
                TextField("Enter something...", text: $text)
                    .textFieldStyle(.default($text))
            }
            .listRowSeparator(.hidden)
        }
    }
}

#Preview {
    TextFieldView()
}
