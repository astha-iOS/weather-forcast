//
//  MockWeatherRestClient.swift
//  WeatherTests
//
//  Created by Astha yadav on 15/11/21.
//

import Foundation
import XCTest
@testable import Weather

class MockWeatherRestClient: WeatherRestClientProtocol{
        
    var data: Data?
    var error: Error?
    
    init(data: Data?, error: Error?){
        self.data = data
        self.error = error
    }
    func getWeatherInfo(cityName: String, recordCount: Int, completion: @escaping CompletionBlock) {
        if self.data != nil{
            completion(Result.success(data!))
        }else{
            completion(Result.failure(error!))
        }
    }
}


