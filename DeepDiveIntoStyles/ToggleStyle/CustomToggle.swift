//
//  CustomToggle.swift
//  DeepDiveIntoStyles
//
//  Created by Marcus Buexenstein on 2/16/25.
//

import SwiftUI

struct CustomToggle: View {
    let label: String
    
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: isOn ? "largecircle.fill.circle" : "circle")
                    .imageScale(.large)
                    .foregroundStyle(isOn ? AnyShapeStyle(.tint) : AnyShapeStyle(.gray))
                    .onTapGesture {
                        isOn.toggle()
                    }
                
                Text(label)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    CustomToggle(label: "Is On", isOn: .constant(false))
}
