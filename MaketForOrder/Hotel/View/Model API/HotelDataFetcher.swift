//
//  JsonDataFetcher.swift
//  MaketForOrder
//
//  Created by Ratibor on 27.12.2023.
//

import Foundation

class HotelDataFetcher {
    static func fetchData(completion: @escaping (HotelDataModel) -> Void, failure: @escaping (Error) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                failure(error)
                return
            }

            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(HotelDataModel.self, from: data)
                    completion(jsonData)
                } catch {
                    failure(error)
                }
            }
        }.resume()
    }
}
