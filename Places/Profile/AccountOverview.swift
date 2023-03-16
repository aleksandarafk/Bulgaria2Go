//
//  AccountOverview.swift
//  Place
//
//  Created by Aleksandar Karamirev on 22/02/2023.
//


import SwiftUI

struct AccountOverviewMenu: View {
    var name: String
    var email: String
    var profilePicture: Image
    
    var body: some View {
        HStack(spacing: 16) {
            profilePicture
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                Text(email)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
    }
}

struct AccountOverviewMenu_Previews: PreviewProvider {
    static var previews: some View {
        AccountOverviewMenu(name: "Aleksandar Karamirev", email: "aleksandarn314@gmail.com", profilePicture: Image("Profile"))
            .previewLayout(.fixed(width: 375, height: 100))
    }
}
