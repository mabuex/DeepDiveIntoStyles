//
//  CustomLabel.swift
//  DeepDiveIntoStyles
//
//  Created by Marcus Buexenstein on 2/16/25.
//

import SwiftUI

struct CustomLabel: View {
    let title: String
    let image: String
    
    var imageScale: Image.Scale = .medium
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: image)
                .imageScale(imageScale)
                .frame(height: 24)
            
            Text(title)
        }
    }
}

#Preview {
    CustomLabel(title: "Click Me", image: "heart", imageScale: .medium)
}
