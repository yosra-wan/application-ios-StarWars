//
//  urlSession.swift
//  StarWars
//
//  Created by TekUp University 2 on 17/2/2023.
//

import Foundation





  func fetchData<T: Decodable>(for url: URL, completion: @escaping (Result<T, Error>) -> Void) {

    self.dataTask(with: url) { (data, response, error) in

      if let error = error {

        completion(.failure(error))

      }



      if let data = data {

        do {

          let object = try JSONDecoder().decode(T.self, from: data)

          completion(.success(object))

        } catch let decoderError {

          completion(.failure(decoderError))

        }

      }

    }.resume()

  }

  

}
