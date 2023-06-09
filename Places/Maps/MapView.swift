//
//  MapView.swift
//  Place
//
//  Created by Aleksandar Karamirev on 10/02/2023.
//

import SwiftUI
import MapKit

//the map view for each unique landmark
struct MapView: View{
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()

    var body: some View{
        Map(coordinateRegion: $region)
            .onAppear{
                setRegion(coordinate)
            }
            .ignoresSafeArea()

        }
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider{
    static var previews: some View{
        MapView(coordinate: CLLocationCoordinate2D(latitude: 41.7150, longitude: 25.4659))
    }
}
