//
//  ArticleImage.swift
//  Article
//
//  Created by Aleksandar Karamirev on 10/02/2023.
//

import SwiftUI

//how the image should appear for each landmark
struct PlaceImage: View {
    var image: Image
    var body: some View{
        image
            .renderingMode(.original)
            .resizable()
            .frame(width: 155, height: 155)
            .cornerRadius(5)
            .shadow(radius: 7)
    }
}

struct PlaceImage_Previews: PreviewProvider {
    static var previews: some View {
        PlaceImage(image: Image("etar"))
    }
}
