//
//  Row.swift
//  Places
//
//  Created by Aleksandar Karamirev on 20/02/2023.
//

import SwiftUI

//the category row as seen in the featured section
struct Row: View {
    var categoryName: String
    var items: [Place]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(items) { place in
                        NavigationLink{
                            PlaceDetail(place: place)
                        } label: {
                            Item(place: place)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct Row_Previews: PreviewProvider {
    static var landmarks = ModelData().places
    static var previews: some View {
        Row(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))
        )
    }
}
