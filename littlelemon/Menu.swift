//
//  Menu.swift
//  littlelemon
//
//  Created by Marcelo Campos on 16/03/24.
//

import SwiftUI

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var searchText: String = ""

    var body: some View {
        VStack {
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
            
            
            VStack {
                Text("ORDER FOR DELIVERY!")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding([.leading], 20)
                    .fontWeight(.bold)
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(["Starters", "Mains", "Desserts", "Drinks"], id: \.self) { item in
                            Button(action: {}) {
                                Text(item)
                            }
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40)
                            .background(Color(hex: 0x00E6E6E6))
                            .foregroundColor(Color(hex: 0x00495E57))
                            .cornerRadius(15)
                        }
                    }
                }
            }

            NavigationView {
                FetchedObjects(
                    predicate: buildPredicate(searchText),
                    sortDescriptors: buildSortDescriptors()
                ) { (dishes: [Dish]) in
                    List {
                        ForEach(dishes, id: \.self) { dish in
                            NavigationLink(destination: DishDetails(dish: dish)) {
                                VStack {
                                    Text("\(dish.title ?? "")")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .fontWeight(.bold)
                                        
                                    HStack {
                                        VStack {
                                            Text(dish.dishDescription ?? "")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 12))
                                                .foregroundStyle(Color(hex: 0x00495E57))
                                            
                                            Text("$\(dish.price ?? "")")
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 14))
                                                .fontWeight(.bold)
                                                .foregroundStyle(Color(hex: 0x00495E57))
                                        }
                                        AsyncImage(url: URL(string: dish.image ?? "")) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 50, height: 50)
                                    }
                                }
                                
                            }
                        }
                    }
                    .searchable(text: $searchText, prompt: "Search ...")
                }
            }
        }
        .onAppear {
            getMenuData()
        }
    }
    
    func getMenuData() {
        
        let endpoint = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        
        let url = URL(string: endpoint)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let fullMenu = try? JSONDecoder().decode(MenuList.self, from: data) {
                    let menuItems: [MenuItem] = fullMenu.menu
                    Dish.clear(viewContext)
                    Dish.storeMenuItems(items: menuItems, viewContext)
                    
               }
            }
            
            
        }
        task.resume()
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(
            key: "title",
            ascending: true,
            selector: #selector(NSString.localizedStandardCompare(_:))
        )]
    }
    
    func buildPredicate(_ search: String) -> NSPredicate {
        if search.isEmpty {
            return NSPredicate(value: true)
        }
        return NSPredicate(format: "title CONTAINS[cd] %@", search)
    }
}

#Preview {
    Menu()
}
