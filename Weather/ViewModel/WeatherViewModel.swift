//
//  WeatherListViewModel.swift
//  Weather
//
//  Created by Astha yadav on 15/11/21.
//

import Foundation

protocol WeatherViewModelDelegate: AnyObject{
    func didUpdateWeather(_ forcastArray: [OneDayForcast])
    func didFailWithError(error: Error)
}

class WeatherViewModel{
    
    private var coreDataService:CoreDataService!
    private var restClient: WeatherRestClientProtocol!
    private var delegate: WeatherViewModelDelegate!
    private var networkReachability:NetworkReachability?

    init(delegate: WeatherViewModelDelegate?,restClient: WeatherRestClientProtocol) {
        self.delegate = delegate
        self.restClient = restClient
        self.coreDataService = CoreDataService()
    }
    
    func getWeatherData(city: String, recordCount: Int,
                        coreDataService:CoreDataService.Type=CoreDataService.self,
                        networkReachability:NetworkReachability.Type=NetworkReachability.self ){
        if networkReachability.isConnectedToNetwork(){
            self.restClient.getWeatherInfo(cityName: city,recordCount: recordCount){result  in
                switch result{
                case let .failure(error):
                    self.delegate.didFailWithError(error: error)
                case .success(let data):
                    self.coreDataService!.updateOfflineWeatherEntity(weatherData: data)
                    self.delegate?.didUpdateWeather(self.parseToOneDayForcast(data: data)!)
                }
            }
        }else{
            let storedData = self.coreDataService.fetchOfflineWeatherForcast()
            guard let data = storedData else { return}
            self.delegate?.didUpdateWeather(self.parseToOneDayForcast(data: data)!)
        }
        
    }
    
    func parseToOneDayForcast(data:Data) -> [OneDayForcast]?{
        do{
            let result = try Decoder.decoder.decode(CityForecast.self, from: data)
            return(result.list)
        }catch{
            print(error.localizedDescription)
            return []
        }
    }
}
