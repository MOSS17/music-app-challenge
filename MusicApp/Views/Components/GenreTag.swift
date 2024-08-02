//
//  GenrePill.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 31/07/24.
//

import SwiftUI

struct GenreTag: View {
    var genre: String
    var body: some View {
        Text(genre.capitalized)
            .font(.footnote)
            .padding(
                .init(
                    top: K.Padding.tagV,
                    leading: K.Padding.tagH,
                    bottom: K.Padding.tagV,
                    trailing: K.Padding.tagH
                )
            )
            .lineLimit(1)
            .background(
                RoundedRectangle(cornerRadius: K.Size.tagCornerRadius).stroke()
            )
    }
}

#Preview {
    GenreTag(genre: "alternative rock")
}
