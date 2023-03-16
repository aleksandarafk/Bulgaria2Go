//
//  PlaceDetail.swift
//  Place
//
//  Created by Aleksandar Karamirev on 10/02/2023.
//

import SwiftUI

struct PlaceDetail: View {
    @State private var selectedLanguage: Int = {
        let languageCode = Locale.current.languageCode
        if languageCode == "ar" {
            return 1
        } else if languageCode == "bg" {
            return 2
        } else if languageCode == "nl" {
            return 3
        } else {
            return 0
        }
    }()

    let languages = ["en", "ar", "bg", "nl"]
    var place: Place
    var body: some View {
        ScrollView {
            VStack {
                MapView(coordinate: place.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                PlaceImage(image: place.image)
                    .offset(y: -130)
                    .offset(x: -110)
                    .padding(.bottom, -130)
                VStack(alignment: .leading, spacing: 16) {
                    Text(place.name.localizableString(languages[selectedLanguage]))
                        .font(.largeTitle)
                        .bold()
                    HStack {
                        Image(systemName: "info.bubble.fill")
                        Text(place.park.localizableString(languages[selectedLanguage]))
                            .font(.subheadline)

                    }
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        Text(place.state.localizableString(languages[selectedLanguage]))
                            .font(.subheadline)

                    }

                    Divider()
                    Text(place.description.localizableString(languages[selectedLanguage]))
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                .background(.white)
                .cornerRadius(16)

            }
            .background(.white)
            .shadow(radius: 10)

            .padding(.top, 16)
            .padding(.bottom, 32)
        }
        
        .navigationTitle(place.name.localizableString(languages[selectedLanguage]))
        .navigationBarTitleDisplayMode(.inline)
        .environment(\.layoutDirection, languages[selectedLanguage] == "ar" ? .rightToLeft : .leftToRight)
    }
}

struct PlaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetail(place: ModelData().places[0])
    }
}



