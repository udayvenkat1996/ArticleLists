//
//  APIService.swift
//  TestExample45
//
//  Created by Uday Venkat on 13/06/24.
//

import Foundation

protocol APIServiceProtocol {
    func fetchListData(completion: @escaping (Result<[Doc], Error>) -> Void)
}

class APIService: APIServiceProtocol {
    private let url = URL(string: "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=election&api-key=j5GCulxBywG3lX211ZAPkAB8O381S5SM")!

    func fetchListData(completion: @escaping (Result<[Doc], Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }

            do {
                let result = try JSONDecoder().decode(ListModel.self, from: data)
                completion(.success(result.response.docs))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
