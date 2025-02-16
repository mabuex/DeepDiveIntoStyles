//
//  CustomToggleStyles.swift
//  DeepDiveIntoStyles
//
//  Created by Marcus Buexenstein on 2/16/25.
//

import SwiftUI

struct CircleToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "largecircle.fill.circle" : "circle")
                .imageScale(.large)
                .foregroundStyle(configuration.isOn ? AnyShapeStyle(.tint) : AnyShapeStyle(.gray))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension ToggleStyle where Self == CircleToggleStyle {
    static var circle: CircleToggleStyle {
        CircleToggleStyle()
    }
}

struct CheckmarkToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .imageScale(.large)
                .foregroundStyle(configuration.isOn ? AnyShapeStyle(.tint) : AnyShapeStyle(.gray))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension ToggleStyle where Self == CheckmarkToggleStyle {
    static var checkmark: CheckmarkToggleStyle {
        CheckmarkToggleStyle()
    }
}
