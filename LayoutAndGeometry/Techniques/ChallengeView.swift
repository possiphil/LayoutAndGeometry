//
//  ChallengeView.swift
//  LayoutAndGeometry
//
//  Created by Philipp Sanktjohanser on 28.01.23.
//

import SwiftUI

struct ChallengeView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: Double(geo.frame(in: .global).minY / 1000), saturation: 1, brightness: 1))
                            .opacity(geo.frame(in: .global).minY / 200)
                            .scaleEffect(0.5 + (geo.frame(in: .global).minY / 1500))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).midY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
