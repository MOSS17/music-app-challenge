//
//  ContentView.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 29/07/24.
//

import SwiftUI

struct HomeView: View {
    var gradient = Gradient(
        stops: [
            Gradient.Stop(color: .blue, location: 0.0),
            Gradient.Stop(color: .black, location: 0.5)
        ]
    )
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            LinearGradient(
                gradient: gradient,
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            HomeHeader()
            .padding()
        }
    }
    
    fileprivate struct HomeHeader: View {
        var body: some View {
            VStack(alignment: .leading) {
                Text("This is")
                    .font(.system(size: 64, weight: .bold))
                    .foregroundStyle(.white)
                Text("You")
                    .font(.system(size: 64, weight: .bold))
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    HomeView()
}
