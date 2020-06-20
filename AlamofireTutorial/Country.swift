//
//  Country.swift
//  AlamofireTutorial
//
//  Created by admin on 6/19/20.
//  Copyright © 2020 Long. All rights reserved.
//

import Foundation

struct Country: Decodable {
    
    // Decodable dùng để giải mã dữ liệu bên ngoài dùng trong app
    var name: String?
    var capital: String?
    var countryCode: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case capital = "capital"
        case countryCode = "alpha3Code"
        
    }
}
