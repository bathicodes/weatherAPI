//
//  URLExtension.swift
//  weatherAPI
//
//  Created by Bathiya Seneviratne on 2020-12-03.
//

import Foundation

extension URL {
    static func weatherURL() -> URL? {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=London&appid=a0805d388a39e56abde9ae0adcac2106") else {
            return nil
        }
        return url
    }
}
