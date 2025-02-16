//
//  LabelView.swift
//  DeepDiveIntoStyles
//
//  Created by Marcus Buexenstein on 2/16/25.
//

import SwiftUI

struct LabelView: View {
    var body: some View {
        List {
            Section("Not so good solution") {
                VStack(spacing: 8) {
                    Image(systemName: "heart")
                        .imageScale(.medium)
                        .frame(height: 24)
                    
                    Text("Click Me")
                }
            }
            
            Section("Better solution") {
                CustomLabel(title: "Click Me", image: "heart", imageScale: .medium)
            }
            
            Section("Perfect solution") {
                Label("Click Me", systemImage: "heart")
                    .labelStyle(.vertical)
                
                Label("Click Me", systemImage: "heart")
                    .labelStyle(.vertical(.large))
            }
            .listRowSeparator(.hidden)
        }
    }
}

#Preview {
    LabelView()
}
