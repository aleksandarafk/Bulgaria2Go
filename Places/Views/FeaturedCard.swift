//
//  FeaturedCard.swift
//  Places
//
//  Created by Aleksandar Karamirev on 20/02/2023.
//

import SwiftUI

//the featured card initial design
struct FeaturedCard: View {
    var place: Place
    var body: some View {
        place.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay {
                TextOverlay(place: place)
            }
    }
}

//the text overlay style
struct TextOverlay: View{
    var place: Place
    //coloring the text
    var gradient: LinearGradient{
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    //allignment of the text view
    var body: some View{
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading){
                Text(place.name)
                    .font(.title)
                    .bold()
                Text(place.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeaturedCard_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCard(place: ModelData().features[0])
    }
}
