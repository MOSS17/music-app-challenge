//
//  Constants.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import Foundation

struct K {
    struct FontSize {
        static let header = CGFloat(64)
    }
    
    struct Spacing {
        static let content = CGFloat(30)
        static let inner = CGFloat(10)
        static let headerImage = CGFloat(60)
    }
    
    struct Size {
        static let listImage = CGFloat(100)
        static let detailsImage = CGFloat(200)
        static let cornerRadius = CGFloat(20)
        static let detailsCornerRadius = CGFloat(40)
        static let tagCornerRadius = CGFloat(10)
    }
    
    struct Padding {
        static let tagH = CGFloat(7)
        static let tagV = CGFloat(4)
    }
    
    struct Limit {
        static let genres = 3
        static let albums = 5
    }
}
