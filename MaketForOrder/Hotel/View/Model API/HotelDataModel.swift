//
//  JsonDataModel.swift
//  MaketForOrder
//
//  Created by Ratibor on 27.12.2023.
//

import Foundation

struct HotelDataModel: Codable {
    let id: Int
    let name: String
    let adress: String
    let minimal_price: Decimal
    let price_for_it: String
    let rating: Int
    let rating_name: String
    let image_urls: [String]
    let about_the_hotel: AboutTheHotel
    
    struct AboutTheHotel: Codable {
        let description: String
        let peculiarities: [String]
    }
    
}
