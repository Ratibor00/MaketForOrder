//
//  RoomDataFetcher.swift
//  MaketForOrder
//
//  Created by Ratibor on 27.12.2023.
//

import Foundation

class RoomsDataFetcher {
    static func loadRooms(completion: @escaping (Result<[Room], Error>) -> Void) {
        guard var components = URLComponents(string: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        guard let url = components.url else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(RoomsModel.self, from: data)
                completion(.success(result.rooms))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
