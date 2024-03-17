//
//  DishDetails.swift
//  littlelemon
//
//  Created by Marcelo Campos on 16/03/24.
//

import SwiftUI

struct DishDetails: View {
    var dish: Dish
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            
            Text(dish.title ?? "N/A")
            Text(dish.price ?? "N/A")
        }
    }
}
