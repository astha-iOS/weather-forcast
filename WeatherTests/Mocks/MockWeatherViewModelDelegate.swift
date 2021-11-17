//
//  MockWeatherViewModelDelegate.swift
//  WeatherTests
//
//  Created by Astha yadav on 16/11/21.
//

import Foundation
@testable import Weather
class MockWeatherViewModelDelegate: WeatherViewModelDelegate{
    
    var oneDayForcast: [OneDayForcast]?
    var error: Error?
    

    func didUpdateWeather(_ weather: [OneDayForcast]) {
        self.oneDayForcast = weather;
    }
    
    func didFailWithError(error: Error) {
        self.error = error
    }
}
