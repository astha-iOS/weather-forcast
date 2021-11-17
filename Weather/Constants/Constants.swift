//
//  Constant.swift
//  Weather
//
//  Created by Astha yadav on 15/11/21.
//

import Foundation
import UIKit

enum Stroyboard{
    static let stroyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)

}
/// Holds constants for Open Weather API URL's
enum WeatherAPIUrl {
    static let apiBaseURL = "http://api.openweathermap.org"
    static let forcastUrl = "/data/2.5/forecast/daily?"
}

/// Holds constants for Open Weather API
enum WeatherAPIKey {
    static let key = "648a3aac37935e5b45e09727df728ac2"
    static let cityName = "Paris"
    static let cnt = 16

}

/// Holds constants for Notification names
enum NotificationNames {
    static let networkReachability = "networkReachability"
    static let kCFLocaleTemperatureUnitKey = "kCFLocaleTemperatureUnitKey"
}

/// Holds constants for Cell identifiers
enum Identifiers {
    static let weatherTableCellIdentifier = "WeatherListTableViewCell"
    static let weatherDetailViewController = "WeatherDetailViewController"
}

/// Holds constants for date formate and time zone
enum Formates {
    static let dateFormate = "dd MMM yyyy (EEEE)"
    static let timeZone = "CET"
}

/// Holds constants for jsonDecoder
enum Decoder {
    static let decoder = JSONDecoder()
}
