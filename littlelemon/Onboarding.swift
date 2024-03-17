//
//  Onboarding.swift
//  littlelemon
//
//  Created by Marcelo Campos on 16/03/24.
//

import SwiftUI

let kFirstName = "FIRST_NAME"
let kLastName = "LAST_NAME"
let kEmail = "EMAIL"
let kIsLoggedIn = "IS_LOGGED_IN"

struct Onboarding: View {

    @State var isLoggedIn: Bool = false
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                VStack {
                    Text("Little Lemon")
                        .font(.title)
                        .foregroundStyle(.yellow)
                        .fontWeight(.bold)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding([.leading], 20)
                    
                    HStack {
                        VStack {
                            Text("Chicago")
                                .font(.title2)
                                .foregroundStyle(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                .padding([.leading], 20)
                            
                            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                .font(.system(size: 15))
                                .foregroundStyle(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                .padding([.leading], 20)
                        }
                        VStack {
                            Image("hero-image")
                                .resizable()
                                .frame(height: 100)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding([.bottom], 20)
                .background(Color(hex: 0x00495E57))
                
                TextField("First name ...", text: $firstName)
                    .frame(width: 350, height: 50)
                    .padding([.leading], 8)
                    .border(.gray, width: 0.2)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                
                TextField("Last name", text: $lastName)
                    .frame(width: 350, height: 50)
                    .padding([.leading], 8)
                    .border(.gray, width: 0.2)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                
                TextField("Email", text: $email)
                    .frame(width: 350, height: 50)
                    .padding([.leading], 8)
                    .border(.gray, width: 0.2)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                Button(action: {
                    if !firstName.isEmpty && !lastName.isEmpty && isValidEmail(email) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        
                        UserDefaults.standard.setValue(true, forKey: kIsLoggedIn)
                        
                        isLoggedIn = true
                    }
                    else {
                        
                    }
                }) {
                    Text("Register")
                        .frame(width: 350, height: 40)
                        .foregroundColor(.black)
                        .background(.yellow)
                        .cornerRadius(8)
                        
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .onAppear {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
        }
    }
    
    func isValidEmail(_ emailAddress: String) -> Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", regEx).evaluate(with: emailAddress)
    }
}

#Preview {
    Onboarding()
}
