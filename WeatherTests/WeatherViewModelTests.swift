//
//  WeatherViewModelTests.swift
//  WeatherTests
//
//  Created by Astha yadav on 13/11/21.
//

import XCTest
@testable import Weather

class WeatherViewModelTests: XCTestCase {
    
    var target: WeatherViewModel!
    var mockWeatherRestClient: MockWeatherRestClient!

    override func setUp(){
        
    }

    func testGetWeatherInfoOnSuccessShouldReturnNonNilWeatherData(){
        //given
        let cityForcast = TestDataProvider.buildCityForcast()
        let jsonString  = JsonUtil.toJsonString(json: cityForcast)
        let data = Data(jsonString.utf8)
        mockWeatherRestClient = MockWeatherRestClient(data:data, error: NSError())
        let deletgate = MockWeatherViewModelDelegate()
        self.target = .init(delegate: deletgate, restClient:mockWeatherRestClient)

        //when
        target.getWeatherData(city: "Paris", recordCount: 16)

        //then
        XCTAssertNil(deletgate.error)
        XCTAssertNotNil(deletgate.oneDayForcast)
        XCTAssertEqual(deletgate.oneDayForcast?.count, 1)
    }
    
    func testGetWeatherInfoFromLocalDBWhenNetworkNotAvailable(){
        //given

        let deletgate = MockWeatherViewModelDelegate()
        let mockMockNetworkReachability = MockNetworkReachability.self;
        mockWeatherRestClient = MockWeatherRestClient(data:nil, error: NSError())
        self.target = .init(delegate: deletgate, restClient:mockWeatherRestClient)

        //when
        target.getWeatherData(city: "Paris", recordCount: 16, networkReachability: mockMockNetworkReachability)

        //then
        XCTAssertNil(deletgate.error)
        XCTAssertNotNil(deletgate.oneDayForcast)
    }

    func testGetWeatherInfoOnErrorShouldReturnNonNilWeatherData(){
        //given
        let error = NSError(domain: "Weather", code: 404, userInfo: ["description":"Entity not found"])
        mockWeatherRestClient = MockWeatherRestClient(data: nil, error: error)
        //given
        let deletgate = MockWeatherViewModelDelegate()
        self.target = .init(delegate: deletgate, restClient:mockWeatherRestClient)

        //when
        target.getWeatherData(city: "Paris", recordCount: 16)

        //then
        XCTAssertNotNil(deletgate.error)
        XCTAssertNil(deletgate.oneDayForcast)
    }
}
