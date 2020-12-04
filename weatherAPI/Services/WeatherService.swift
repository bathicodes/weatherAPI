//
//  WeatherService.swift
//  weatherAPI
//
//  Created by Bathiya Seneviratne on 2020-12-03.
//

import Foundation

enum NetworkError : Error {
    case BadURL
    case NoData
    case DecodingError
}

class WeatherService {
        
    func getWeather(completion : @escaping(Result<Weather?,NetworkError>) -> Void){
        
        guard let url = URL.weatherURL() else {
            return completion(.failure(.BadURL))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.NoData))
            }
            let weatherResponse = try? JSONDecoder().decode(WeatherModel.self, from: data)
            if let weatherResponse = weatherResponse {
                completion(.success(weatherResponse.main))
            } else {
                completion(.failure(.DecodingError))
            }
        }.resume()
        
    }
    
    func getData(completion : @escaping(Result<OtherData?,NetworkError>) -> Void){
        guard let url = URL.weatherURL() else {
            return completion(.failure(.BadURL))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.NoData))
            }
            let otherResponse = try? JSONDecoder().decode(OtherData.self, from: data)
            if let otherResponse = otherResponse {
                completion(.success(otherResponse))
            } else {
                completion(.failure(.DecodingError))
            }
        }.resume()
    }
}
