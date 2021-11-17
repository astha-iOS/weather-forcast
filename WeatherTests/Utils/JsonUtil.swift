//
//  JsonUtil.swift
//  WeatherTests
//
//  Created by Astha yadav on 17/11/21.
//

import Foundation
@testable import Weather

class JsonUtil{
    static func toJsonString(json: CityForecast) -> String {
        let jsonEncoder = JSONEncoder()
        do{
            let jsonData = try jsonEncoder.encode(json)
            return String(data: jsonData, encoding: String.Encoding.utf8)!
        }catch{
            print(error)
            return ""
        }
    }
}
