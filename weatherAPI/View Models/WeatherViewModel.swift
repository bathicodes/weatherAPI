//
//  WeatherViewModel.swift
//  weatherAPI
//
//  Created by Bathiya Seneviratne on 2020-12-03.
//

import Foundation

class WeatherViewModel : ObservableObject {
    
    @Published private var weather : Weather?
    @Published private var other : OtherData?
    
    var temperature : Double {
        guard let temp = weather?.temp else {
            return 0.0
        }
        return temp
    }
    
    var name : String {
        guard let name = other?.name else {
            return "N/A"
        }
        return name
    }
    
    func fetchWeather() {
        WeatherService().getWeather{ result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    self.weather = weather
                }
            case.failure(_ ):
                print("Error")
            }
        }
    }
    
    func fetchData(){
        WeatherService().getData { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.other = data
                }
            case .failure(_ ):
                print("Error")
            }
        }
    }
}
