//
//  Dish+CoreDataProperties.swift
//  Little Lemon
//
//  Created by Byron Cantillano on 11/12/24.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var title: String?
    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var category: String?
    @NSManaged public var dishDescription: String?

}

extension Dish : Identifiable {

}
