//
//  RestClient.swift
//  Weather
//
//  Created by Astha yadav on 15/11/21.
//

import Foundation
import CoreData

typealias CompletionBlock = (Result<Data,Error>) -> Void


protocol WeatherRestClientProtocol{
    func getWeatherInfo(cityName: String,recordCount: Int,completion: @escaping CompletionBlock)
}

class WeatherRestClient: WeatherRestClientProtocol{

    private let baseUrl = "\(WeatherAPIUrl.apiBaseURL)\(WeatherAPIUrl.forcastUrl)"

    static var sharedObject: WeatherRestClient {
        let instance = WeatherRestClient()
        return instance
    }
    
    func getWeatherInfo(cityName: String,recordCount: Int,completion: @escaping CompletionBlock) {
        let apiUrl = "\(baseUrl)q=\(cityName)&cnt=\(recordCount)&appid=\(WeatherAPIKey.key)&units=metric"
        if let url = URL(string: apiUrl) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    completion(Result.failure(error!))
                    return
                }
                
                guard let _ = response as? HTTPURLResponse else {
                    completion(Result.failure(APIError.dataFailed))
                    return
                }
                if let data = data {
                    completion(.success(data))
                }
            }
            task.resume()
        }
    }
}

