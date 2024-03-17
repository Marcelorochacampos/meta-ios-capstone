//
//  Dish+CoreDataClass.swift
//  littlelemon
//
//  Created by Marcelo Campos on 16/03/24.
//
//

import Foundation
import CoreData


public class Dish: NSManagedObject {

    static func storeMenuItems(items: [MenuItem], _ context: NSManagedObjectContext) {
        for item in items {
            let dish = Dish(context: context)
            dish.title = item.title
            dish.dishDescription = item.dishDescription
            dish.category = item.category
            dish.price = item.price
            dish.image = item.image
        }
    }
    
    static func clear(_ context: NSManagedObjectContext) {
        let request = Dish.fetchRequest()
        do {
            guard let results = try context.fetch(request) as? [Dish], results.count > 0
            else { return }
            for dish in results {
                context.delete(dish)
            }
            return
        } catch(let error) {
            print(error.localizedDescription)
            return
        }
    }
}
