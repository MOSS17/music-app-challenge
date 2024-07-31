//
//  GradientBackground.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 31/07/24.
//

import SwiftUI

struct GradientBackground: View {
    var color: Color
    var body: some View {
        LinearGradient(
            gradient: Gradient(
                stops: [
                    Gradient.Stop(color: color, location: 0.0),
                    Gradient.Stop(color: .black, location: 0.5)
                ]
            ),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}

#Preview {
    GradientBackground(color: .blue)
}
