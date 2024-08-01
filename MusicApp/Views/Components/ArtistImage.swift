//
//  ArtistImage.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import SwiftUI

struct ArtistImage: View {
    let image: ImageObject?
    var body: some View {
        if let imageUrl = image {
            AsyncImage(url: URL(string: imageUrl.url), transaction: .init(animation: .bouncy(duration: 1))) { phase in
                if let image = phase.image {
                    image.resizable()
                        .cornerRadius(20)
                } else if phase.error != nil {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray)
                } else {
                    ProgressView().progressViewStyle(.circular)
                }
            }
        } else {
            RoundedRectangle(cornerRadius: 30)
                .fill(.gray)
        }
    }
}
