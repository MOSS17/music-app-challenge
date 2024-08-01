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
                        .cornerRadius(K.Size.cornerRadius)
                } else if phase.error != nil {
                    RoundedRectangle(cornerRadius: K.Size.cornerRadius)
                        .fill(.gray)
                } else {
                    ProgressView().progressViewStyle(.circular)
                }
            }
        } else {
            RoundedRectangle(cornerRadius: K.Size.cornerRadius)
                .fill(.gray)
        }
    }
}
