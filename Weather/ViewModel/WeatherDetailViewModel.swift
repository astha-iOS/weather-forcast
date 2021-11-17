//
//  WeatherDetailViewModel.swift
//  Weather
//
//  Created by Astha yadav on 16/11/21.
//

import Foundation
import UIKit

class WeatherDetailViewModel {

    private var list: OneDayForcast?
    private var todayWeather: Weather?
    
    init(list:OneDayForcast?){
        self.list = list
        self.todayWeather = self.list?.weather.first
    }
    
    var dateWithDayName: String {
        guard let dt = list?.dt else { return "" }
        return getTimestempToDateString(time: dt)
    }
    
    var sunrise: String {
        guard let sunrise = list?.sunrise else { return "" }
        return getTimeString(time: sunrise)
    }
    
    var sunset: String {
        guard let sunset = list?.sunset else { return "" }
        return getTimeString(time: sunset)
    }
    
    var maxTemp: String{
        guard let max_temp = list?.temp?.max else { return "" }
        return "\(max_temp)°"
    }
    
    var minTemp: String{
        guard let min_temp = list?.temp?.min else { return "" }
        return "\(min_temp)°"
    }
    
    var dayLikeStatus: String{
        guard let temp_max = list?.temp?.max else { return "" }
        guard let temp_min = list?.temp?.min else { return "" }
        return getTempStatus(minTemp: temp_min, maxTemp: temp_max)
    }
    
    var humidity: String{
        guard let humidity = list?.humidity else { return "" }
        return "\(humidity) %"
    }
    
    var pressure: String{
        guard let pressure = list?.pressure else { return "" }
        return "\(pressure) hPa"
    }
    
    var rain: String{
        guard let rain = list?.rain else { return "" }
        return "\(rain) %"
    }
    
    var feelsLikeDay: String{
        guard let day = list?.feels_like?.day else { return "" }
        return "\(day)°"
    }
    
    var feelsLikeMorning: String{
        guard let morning = list?.feels_like?.morn else { return "" }
        return "\(morning)°"
    }
    
    var feelsLikeEvening: String{
        guard let evening = list?.feels_like?.eve else { return "" }
        return "\(evening)°"
    }
    
    var feelsLikeNight: String{
        guard let night = list?.feels_like?.night else { return "" }
        return "\(night)°"
    }

    var weatherImage: UIImage? {
        guard let icon = todayWeather?.icon else { return UIImage()}
        return UIImage(named: icon)
    }
    
    var weatherDescription: String {
        guard let description = todayWeather?.description else { return ""}
        return "\(description)"
    }
    
    func getTimestempToDateString(time:Int)->String{
        let epocTime = TimeInterval(time)
        let date = Date(timeIntervalSince1970: epocTime)
        let formatter = DateFormatter()
        formatter.dateFormat = Formates.dateFormate
        let dateString = formatter.string(from: date)
        return "\(dateString)"
    }
    
    func getTimeString(time: Int) -> String {
        let date = Date(timeIntervalSince1970: Double(time))
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: Formates.timeZone)!
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let result = ("\(hour):\(minutes)")
        return result
    }

    func getTempStatus(minTemp: Double, maxTemp: Double) -> String{
        if maxTemp > 25.00{
            return "Hot"
        }else if minTemp < 10.00{
            return "Cold"
        }else{
            return "Normal"
        }
    }
}
