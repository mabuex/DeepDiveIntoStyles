//
//  ContentView.swift
//  DeepDiveIntoStyles
//
//  Created by Marcus Buexenstein on 2/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Topic?
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                ForEach(Topic.allCases) { topic in
                    NavigationLink(value: topic) {
                        topic.lable
                    }
                }
                
                Section {
                    NavigationLink(destination: ProblemView()) {
                        Label("Problem", systemImage: "exclamationmark.triangle.fill")
                    }
                }
            }
        } detail: {
            if let selection {
                NavigationStack {
                    selection.destination
                        .navigationTitle(selection.title)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

enum Topic: Hashable, Identifiable, CaseIterable {
    case button
    case textField
    case toggle
    case label
    
    var id: Self  { self }
    
    var title: String {
        switch self {
        case .button:
            "Button Style"
        case .textField:
            "TextFiled Style"
        case .toggle:
            "Toggle Style"
        case .label:
            "Label Style"
        }
    }
 
    var lable: some View {
        switch self {
        case .button:
            Label("Button Style", systemImage: "button.horizontal")
        case .textField:
            Label("TextField Style", systemImage: "textformat.abc")
        case .toggle:
            Label("Toggle Style", systemImage: "arcade.stick")
        case .label:
            Label("Label Style", systemImage: "tag")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .button:
            ButtonView()
        case .textField:
            TextFieldView()
        case .toggle:
            ToggleView()
        case .label:
            LabelView()
        }
    }
}
