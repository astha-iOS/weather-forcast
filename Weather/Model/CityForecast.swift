//
//  Weather.swift
//  Weather
//
//  Created by Astha yadav on 15/11/21.
//

import Foundation

struct CityForecast: Codable{
    let cod: String
    let message: Double
    let cnt: Int
    let list: [OneDayForcast]
    let city: City
}

// MARK: City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coordinate
    let country: String
    let timezone: Int
    var population: Int?
}

// MARK: List
struct OneDayForcast: Codable {
    let dt: Int?
    let sunrise: Int?
    let sunset: Int?
    let temp: Temp?
    let feels_like: FeelsLike?
    let pressure:Int?
    let humidity:Int?
    let weather: [Weather]
    let speed:Double?
    let deg:Int?
    let gust:Double?
    let clouds:Int?
    let pop:Double?
    let rain:Double?


}

// MARK: Temp
struct Temp:Codable{
    let day:Double?
    let min:Double?
    let max:Double?
    let night:Double?
    let eve:Double?
    let morn:Double?
    
}

// MARK: FeelsLike
struct FeelsLike:Codable{
    let day:Double?
    let night:Double?
    let eve:Double?
    let morn:Double?
}


// MARK: WeatherList
struct Weather: Codable{
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

