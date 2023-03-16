//
//  PlaceRow.swift
//  Place
//
//  Created by Aleksandar Karamirev on 10/02/2023.
//

import SwiftUI

//design for the landmarks for each row 
struct PlaceRow: View {
    var place: Place
    
    var body: some View {
        HStack {
            place.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(place.name)
            Spacer()
            
            if place.isFavorite{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct PlaceRow_Previews: PreviewProvider {
    static var place = ModelData().places
    static var previews: some View {
        Group {
            PlaceRow(place: places[0])
            PlaceRow(place: places[1])
        }
        .previewLayout(.fixed(width: 300, height:70))

    }
}
