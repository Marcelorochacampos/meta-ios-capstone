//
//  Home.swift
//  littlelemon
//
//  Created by Marcelo Campos on 16/03/24.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared
    
    var body: some View {
        TabView {
            Menu()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .tabItem { Label("Menu", systemImage: "list.dash") }
            
            UserProfile()
                .tabItem { Label("Profile", systemImage: "square.and.pencil") }
                
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
