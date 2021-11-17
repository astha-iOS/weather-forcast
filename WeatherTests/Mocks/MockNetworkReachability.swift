//
//  MockNetworkReachability.swift
//  WeatherTests
//
//  Created by Astha yadav on 17/11/21.
//

import Foundation
@testable import Weather

class MockNetworkReachability : NetworkReachability{
     override class func isConnectedToNetwork() -> Bool {
        return false
    }
}
