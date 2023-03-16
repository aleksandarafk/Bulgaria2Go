//
//  Acount.swift
//  Places
//
//  Created by Aleksandar Karamirev on 21/02/2023.
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
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                Text(email)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
    }
}

struct AccountOverviewMenu_Previews: PreviewProvider {
    static var previews: some View {
        AccountOverviewMenu(name: "John Doe", email: "johndoe@example.com", profilePicture: Image(systemName: "globe"))
            .previewLayout(.fixed(width: 375, height: 100))
    }
}
