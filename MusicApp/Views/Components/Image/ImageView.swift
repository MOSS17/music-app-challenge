//
//  ArtistImage.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageViewModel: ImageViewModel
    @Binding var backgroundColor: Color
    
    init(urlString: String?, backgroundColor: Binding<Color>) {
        imageViewModel = ImageViewModel(urlString: urlString)
        self._backgroundColor = backgroundColor
    }
    
    mutating func getAverageColor(image: UIImage) {
        backgroundColor = Color(uiColor: image.averageColor!)
    }
    
    var body: some View {
        ZStack {
            Image(uiImage: imageViewModel.image ?? UIImage())
                .resizable()
                .task() {
                    DispatchQueue.main.async {
                        backgroundColor = Color(uiColor:  imageViewModel.image?.averageColor ?? .blue)
                    }
                }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(urlString: Artist.mockedData.first?.images.first?.url, backgroundColor: .constant(.black))
            .frame(width: 200, height: 200)
    }
}
