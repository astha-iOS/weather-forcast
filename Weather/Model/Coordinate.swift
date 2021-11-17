//
//  Coordinate.swift
//  Weather
//
//  Created by Astha yadav on 15/11/21.
//

import Foundation

struct Coordinate: Codable {
    let lat: Double
    let lon: Double
}

extension Coordinate: Equatable {
    static func ==(A: Coordinate, B: Coordinate) -> Bool {
        return A.lat == B.lat && A.lon == B.lon
    }
}

