//
//  Coffee.swift
//  Coffee Ordering
//
//  Created by Hanif Ramadhan Abdillah on 15/07/2021.
//

import Foundation

struct Coffee {
    
    let name: String
    let imageURL: String
    let price: Double?
    
}

extension Coffee {
    static func all() -> [Coffee] {
        return [
            Coffee(name: "Cappucino", imageURL: "Cappucino", price: 2.5),
            Coffee(name: "Espresso", imageURL: "Espresso", price: 2.1),
            Coffee(name: "Regular", imageURL: "Regular", price: 1.0),
        ]
    }
}
