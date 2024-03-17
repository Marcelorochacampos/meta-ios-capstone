//
//  UserProfile.swift
//  littlelemon
//
//  Created by Marcelo Campos on 16/03/24.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    let firstName: String = UserDefaults.standard.string(forKey: kFirstName) ?? "N/A"
    let lastName: String = UserDefaults.standard.string(forKey: kLastName) ?? "N/A"
    let email: String = UserDefaults.standard.string(forKey: kEmail) ?? "N/A"
    var body: some View {
        VStack {
            Text("Personal information")
                .font(.system(size: 16))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .top, .bottom], 6)
            
            VStack {
                Text("Avatar")
                    .font(.system(size: 10))
                    .foregroundColor(Color(hex: 0x00495E57))
                
                Image("profile-image-placeholder")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding([.leading], 6)
            
            Text("First name")
                .font(.system(size: 12))
                .foregroundColor(Color(hex: 0x00495E57))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding([.leading], 6)
            Text(firstName)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .top, .bottom], 12)
                .border(.gray, width: 0.5)
                .cornerRadius(8)
                .padding([.bottom], 15)
            
            Text("Last name")
                .font(.system(size: 12))
                .foregroundColor(Color(hex: 0x00495E57))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding([.leading], 6)
            Text(lastName)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .top, .bottom], 12)
                .border(.gray, width: 0.5)
                .cornerRadius(8)
                .padding([.bottom], 15)
            
            Text("Email")
                .font(.system(size: 12))
                .foregroundColor(Color(hex: 0x00495E57))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding([.leading], 6)
            Text(email)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .top, .bottom], 12)
                .border(.gray, width: 0.5)
                .cornerRadius(8)
                .padding([.bottom], 15)

            Button(action: {
                UserDefaults.standard.set(false ,forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("Logout")
            }
            .frame(width: 350, height: 40)
            .foregroundColor(.black)
            .background(.yellow)
            .cornerRadius(8)

            Spacer()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .padding([.trailing], 12)
        .padding([.leading], 6)
    }
}

#Preview {
    UserProfile()
}
