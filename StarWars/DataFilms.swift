//
//  DataFilms.swift
//  StarWars
//
//  Created by TekUp University 2 on 18/2/2023.
//

import SwiftUI

   struct DataFilms : Decodable {
    let title : String
    let  episode:  Int
    let description : String
    let director : String
    let producer : String
    let date : String
       enum CodingKeys: String, CodingKey {
            case episode = "episode_id", title, director, producer, date = "release_date", description = "opening_crawl"
          }
}
    
