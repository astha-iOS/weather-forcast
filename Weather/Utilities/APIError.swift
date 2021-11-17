//
//  APIError.swift
//  Weather
//
//  Created by Astha yadav on 15/11/21.
//

import Foundation

enum APIError: Error {
    case dataFailed         
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .dataFailed:
            return NSLocalizedString("Data not found", comment: "Data not found")
        }

    }

}
