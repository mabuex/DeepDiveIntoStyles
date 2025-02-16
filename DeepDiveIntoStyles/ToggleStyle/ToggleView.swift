//
//  ToggleView.swift
//  DeepDiveIntoStyles
//
//  Created by Marcus Buexenstein on 2/16/25.
//

import SwiftUI

struct ToggleView: View {
    @State private var isOn = false
    
    var body: some View {
        List {
            Section("Not so good solution") {
                HStack {
                    HStack {
                        Image(systemName: isOn ? "largecircle.fill.circle" : "circle")
                            .imageScale(.large)
                            .foregroundStyle(isOn ? AnyShapeStyle(.tint) : AnyShapeStyle(.gray))
                            .onTapGesture {
                                isOn.toggle()
                            }
                        
                        Text("Is On")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            Section("Better solution") {
                CustomToggle(label: "Is On", isOn: $isOn)
            }
            
            Section("Perfect solution") {
                Toggle("Is On", isOn: $isOn)
                    .toggleStyle(.circle)
                
                Toggle("Is On", isOn: $isOn)
                    .toggleStyle(.checkmark)
            }
        }
    }
}

#Preview {
    ToggleView()
}
