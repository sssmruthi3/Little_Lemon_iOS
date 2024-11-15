//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Byron Cantillano on 11/12/24.
//

import Foundation

struct MenuItem: Decodable, Identifiable {
    var id = Int()
    let title: String
    let description: String
    let price: String
    let image: String
    let category: String
}
