//
//  TestDataProvder.swift
//  WeatherTests
//
//  Created by Astha yadav on 17/11/21.
//

import Foundation
@testable import Weather

class TestDataProvider {
    
   static func buildWeather()->Weather{
    return Weather(id: 101, main: "cloudy", description: "mostly cloudy", icon: "01d")
   }
    
    static func buildOneDayForcast()->OneDayForcast{
        return OneDayForcast(dt: 1637060400, sunrise: 1637046083, sunset: 1637078980, temp: buildTemp(), feels_like: buildFeelsLike(), pressure: 1023, humidity: 76, weather:[buildWeather()], speed: 4.72, deg: 12, gust: 8.25, clouds: 92, pop: 0.00, rain: 1.00)
    }
    
    static func buildCity()->City{
        return City(id: 22, name: "Paris", coord: buildCoordinate(), country: "FR", timezone: 3231, population: 23231)
    }
    
    static func buildCoordinate()->Coordinate{
        return Coordinate(lat: 52536.22, lon: 67263.32)
    }
    
    static func buildCityForcast()->CityForecast{
        return CityForecast(cod: "200", message: 0.00, cnt: 16, list: [buildOneDayForcast()], city: buildCity())
    }
    
    static func buildTemp()->Temp{
        return Temp(day: 45.81, min: 25.48, max: 48.47, night: 47.7, eve: 48.45, morn: 46.27)
    }
    
    static func buildFeelsLike()->FeelsLike{
        return FeelsLike(day: 45.81, night: 47.7, eve: 48.45, morn: 46.27)
    }
}
