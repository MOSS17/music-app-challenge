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
        Text(genre)
            .font(.footnote)
            .padding(.init(top: 4, leading: 7, bottom: 4, trailing: 7))
            .lineLimit(1)
            .background(
                RoundedRectangle(cornerRadius: 10).stroke()
            )
    }
}

#Preview {
    GenreTag(genre: "alternative rock")
}
