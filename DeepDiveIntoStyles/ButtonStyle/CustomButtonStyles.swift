//
//  CustomButtonStyles.swift
//  DeepDiveIntoStyles
//
//  Created by Marcus Buexenstein on 2/16/25.
//

import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
    let backgroundColor: Color
   
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 24)
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundStyle(.white)
            .font(.title3)
            .fontWeight(.semibold)
            .background(backgroundColor)
            .opacity(configuration.isPressed ? 0.7 : 1)
            .clipShape(.capsule)
    }
}

extension ButtonStyle where Self == CapsuleButtonStyle {
    static var capsule: Self {
        Self(backgroundColor: .blue)
    }
    
    static func capsule(_ backgroundColor: Color) -> Self {
        Self(backgroundColor: backgroundColor)
    }
}

struct CircleButtonStyle: ButtonStyle {
    let backgroundColor: Color
   
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 96)
            .padding()
            .foregroundStyle(.white)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(backgroundColor)
            .opacity(configuration.isPressed ? 0.7 : 1)
            .clipShape(.circle)
    }
}

extension ButtonStyle where Self == CircleButtonStyle {
    static var circle: Self {
        Self(backgroundColor: .blue)
    }
    
    static func circle(_ backgroundColor: Color) -> Self {
        Self(backgroundColor: backgroundColor)
    }
}
