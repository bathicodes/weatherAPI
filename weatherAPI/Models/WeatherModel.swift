//
//  WeatherModel.swift
//  weatherAPI
//
//  Created by Bathiya Seneviratne on 2020-12-03.
//

import Foundation

struct WeatherModel : Decodable {
    let main : Weather
}

struct Weather : Decodable {
    let temp : Double
    let feels_like : Double
    let humidity : Double
}

struct OtherData : Decodable {
    let visibility : Int
    let name : String
}
