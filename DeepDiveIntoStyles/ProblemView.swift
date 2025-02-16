//
//  ProblemView.swift
//  DeepDiveIntoStyles
//
//  Created by Marcus Buexenstein on 2/16/25.
//

import SwiftUI

struct ProblemView: View {
    @FocusState var isFocused
    
    @State private var showOutline = false
    @State private var isFavorite = false
    @State private var isOn = false
    @State private var text = ""
    
    var body: some View {
        List {
            Section("Button") {
                Button {
                    withAnimation {
                        isFavorite.toggle()
                    }
                } label: {
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
            
            Section("TextField") {
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
            
            Section("Toggle") {
                HStack {
                    HStack {
                        Image(systemName: isOn ? "largecircle.fill.circle" : "circle")
                            .imageScale(.large)
                            .foregroundStyle(isOn ? AnyShapeStyle(.tint) : AnyShapeStyle(.gray))
                            .onTapGesture {
                                withAnimation {
                                    isOn.toggle()
                                }
                            }
                        
                        Text("Is On")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            Section("Label") {
                VStack(spacing: 8) {
                    Image(systemName: "heart")
                        .imageScale(.medium)
                        .frame(height: 24)
                    
                    Text("Click Me")
                }
            }
        }
    }
}

#Preview {
    ProblemView()
}
