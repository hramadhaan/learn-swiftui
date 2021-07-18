//
//  Order.swift
//  Coffee Ordering
//
//  Created by Hanif Ramadhan Abdillah on 15/07/2021.
//

import Foundation

struct Order: Codable {
    let name: String
    let size: String
    let coffeeName: String
    let total: Double?
}
