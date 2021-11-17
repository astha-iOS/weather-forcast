//
//  WeatherDetailViewModelTests.swift
//  WeatherTests
//
//  Created by Astha yadav on 17/11/21.
//

import XCTest
@testable import Weather

class WeatherDetailViewModelTests: XCTestCase {
    
    private var weatherDetailVM: WeatherDetailViewModel!
    
    override func setUp() {

    }
    
    func testWeatherFeelHotOrCold() throws{
        let weatherList = TestDataProvider.buildOneDayForcast()
        let testTarget = WeatherDetailViewModel(list: weatherList)
        XCTAssertEqual(testTarget.dayLikeStatus, "Hot")
        XCTAssertEqual(testTarget.maxTemp, "48.47°")
        XCTAssertEqual(testTarget.minTemp, "25.48°")
        XCTAssertEqual(testTarget.dateWithDayName, "16 Nov 2021 (Tuesday)")
        XCTAssertEqual(testTarget.sunset, "17:9")
        XCTAssertEqual(testTarget.sunrise, "8:1")
        XCTAssertEqual(testTarget.pressure, "1023 hPa")
        XCTAssertEqual(testTarget.rain, "1.0 %")
        XCTAssertEqual(testTarget.humidity, "76 %")
        XCTAssertEqual(testTarget.feelsLikeDay, "45.81°")
        XCTAssertEqual(testTarget.feelsLikeMorning, "46.27°")
        XCTAssertEqual(testTarget.feelsLikeEvening, "48.45°")
        XCTAssertEqual(testTarget.feelsLikeNight, "47.7°")
        XCTAssertEqual(testTarget.weatherImage, UIImage(named: "01d"))
        XCTAssertEqual(testTarget.weatherDescription, "mostly cloudy")
    }
    
}
