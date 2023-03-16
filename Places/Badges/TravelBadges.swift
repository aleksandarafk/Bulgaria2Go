//
//  TravelBadges.swift
//  Places
//
//  Created by Aleksandar Karamirev on 21/02/2023.
//

import SwiftUI

struct TravelBadges: View {
    var name: String

    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
    }
}

struct TravelBadges_Previews: PreviewProvider {
    static var previews: some View {
        TravelBadges(name: "Testing")
    }
}
