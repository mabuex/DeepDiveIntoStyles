//
//  CustomLabelStyles.swift
//  DeepDiveIntoStyles
//
//  Created by Marcus Buexenstein on 2/16/25.
//

import SwiftUI

struct VerticalLabelStyle: LabelStyle {
    let imageScale: Image.Scale
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 8) {
            configuration.icon
                .imageScale(imageScale)
                .frame(height: 24)
            
            configuration.title
        }
    }
}

extension LabelStyle where Self == VerticalLabelStyle {
    static var vertical: Self { Self(imageScale: .medium) }
    
    static func vertical(_ imageScale: Image.Scale) -> Self {
        Self(imageScale: imageScale)
    }
}


