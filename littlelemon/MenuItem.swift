//
//  MenuItem.swift
//  littlelemon
//
//  Created by Marcelo Campos on 16/03/24.
//

import Foundation

protocol MenuItemProtocol: Identifiable {
    var id: UUID { get }
    var title: String { get set }
    var dishDescription: String { get set }
    var price: String { get set }
    var image: String { get set }
    var category: String { get set }
}

struct MenuItem: Decodable, MenuItemProtocol {
    let id = UUID()
    var title: String
    var dishDescription: String
    var price: String
    var image: String
    var category: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case dishDescription = "description"
        case price = "price"
        case image = "image"
        case category = "category"
    }
}
