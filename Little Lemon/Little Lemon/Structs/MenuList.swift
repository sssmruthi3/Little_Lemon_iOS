//
//  MenuList.swift
//  Little Lemon
//
//  Created by Byron Cantillano on 11/12/24.
//

import Foundation
import CoreData

struct MenuList: Decodable {
    let menu: [MenuItem]
}


func getMenuData(viewContext: NSManagedObjectContext) {
    PersistenceController.shared.clear()
    
    let littleLemonAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
    
    // Safely unwrap the URL
    guard let url = URL(string: littleLemonAddress) else {
        print("Invalid URL.")
        return
    }
    
    let request = URLRequest(url: url)
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        // Print error if it exists
        if let error = error {
            print("Error fetching data: \(error)")
            return
        }
        
        // Check if data is non-nil and attempt to decode
        if let data = data {
            do {
                let obj = try JSONDecoder().decode(MenuList.self, from: data)
                print("Decoded object:", obj)
                
                for dish in obj.menu {
                    let newDish = Dish(context: viewContext)
                    newDish.title = dish.title
                    newDish.price = dish.price
                    newDish.dishDescription = dish.description
                    newDish.image = dish.image
                    newDish.category = dish.category
                }
                try? viewContext.save()
            } catch {
                print("Failed to decode JSON:", error)
            }
        } else {
            print("No data received.")
        }
    }
    
    task.resume()
}
