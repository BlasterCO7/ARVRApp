//
//  StatBar.swift
//  ARVRApp1
//
//  Created by Piyush Anand on 29/11/24.
//

import SwiftUI

struct StatBar: View {
    var label: String
    var value: Int
    var color: Color

    var body: some View {
        VStack {
            Text("\(label): \(value)")
            ProgressBar(value: Float(value) / 100)
                .frame(height: 10)
                .cornerRadius(5)
        }
        .padding()
    }
}

struct ProgressBar: View {
    var value: Float

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle().frame(height: 10).foregroundColor(Color.gray.opacity(0.3))
            Rectangle().frame(width: CGFloat(value) * 300).foregroundColor(Color.green)
        }
        .cornerRadius(5)
    }
}
