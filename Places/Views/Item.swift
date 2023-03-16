//
//  Item.swift
//  Places
//
//  Created by Aleksandar Karamirev on 20/02/2023.
//

import SwiftUI
    //the design for each category item
struct Item: View {
    var place: Place
    var body: some View {
        VStack{
            place.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(place.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct Item_Previews: PreviewProvider {
    static var previews: some View {
        Item(place: ModelData().places[0])
    }
}

