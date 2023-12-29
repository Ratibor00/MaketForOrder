//
//  BookingDataFetch.swift
//  MaketForOrder
//
//  Created by Ratibor on 28.12.2023.
//

import Foundation

class BookingDataFetcher {
    static func fetchData(completion: @escaping (BookingDataModel) -> Void, failure: @escaping (Error) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff") else {
            let error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
            failure(error)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    failure(error)
                }
                return
            }

            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(BookingDataModel.self, from: data)
                    DispatchQueue.main.async {
                        completion(jsonData)
                    }
                } catch {
                    DispatchQueue.main.async {
                        failure(error)
                    }
                }
            }
        }.resume()
    }
}
