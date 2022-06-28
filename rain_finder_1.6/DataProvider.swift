//
//  DataProvider.swift
//  rain_finder_1.6
//
//  Created by Tomasz Zuczek on 28/06/2022.
//

import Foundation

class DataProvider{

    enum Error: Swift.Error {
        case badURL
        case badData
        case other(Swift.Error)
    }

    public func loadCsvData(then block: @escaping(Result<String, Error>) -> Void) {
        let url = URL(string: "https://davidmegginson.github.io/ourairports-data/airports.csv")!

        let task = URLSession.shared.downloadTask(with: url) { localURL, urlResponse, error in

            guard error == nil else {
                block(.failure(.other(error!)))
                return
            }

            guard let localURL = localURL else {
                block(.failure(.badURL))
                return
            }

            guard let string = try? String(contentsOf: localURL) else {
                block(.failure(.badData))
                return
            }

            block(.success(string))
            
        }

        task.resume()
    }
    
}
