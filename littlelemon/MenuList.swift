//
//  MenuList.swift
//  littlelemon
//
//  Created by Marcelo Campos on 16/03/24.
//

import Foundation

protocol MenuListProtocol {
    var menu: [MenuItem] { get }
}

struct MenuList: Decodable, MenuListProtocol {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}
