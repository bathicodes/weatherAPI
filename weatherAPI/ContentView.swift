//
//  ContentView.swift
//  weatherAPI
//
//  Created by Bathiya Seneviratne on 2020-12-03.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var weatherVM = WeatherViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Temperature : \(Int(self.weatherVM.temperature))")
                .font(.largeTitle)
            Text("Name : \(self.weatherVM.name)")
                .font(.largeTitle)
            
                .onAppear() {
                    self.weatherVM.fetchWeather()
                    self.weatherVM.fetchData()
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
