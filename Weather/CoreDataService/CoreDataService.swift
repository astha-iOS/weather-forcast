//
//  CoreDataServiceViewModel.swift
//  Weather
//
//  Created by Astha yadav on 15/11/21.
//

import Foundation
import CoreData

class CoreDataService{
    private let request = NSFetchRequest<LastWeatherData>(entityName: "OfflineWeatherData")
    
    private let managedObjectContext = Persistent.shared.managedObjectContext()
    var savedWeather = CityForecast?.self
    var storedData:Data?
    init() {
        self.storedData = Data()
    }
    
    func fetchOfflineWeatherForcast() -> Data? {
        do{
            let result = try managedObjectContext.fetch(request)
            for data in result{
                self.storedData = data.weatherData! as Data
            }
        }catch{
            print(error.localizedDescription)
            return nil
        }
        return self.storedData
    }
    
    func saveData(){
        do{
            try managedObjectContext.save()
        }catch let error{
            print(error)
            print(error.localizedDescription)
        }
    }
    
    func addWeatherDataOffline(weatherData:Data){
        let newWeatherData =  LastWeatherData(context: managedObjectContext)
        newWeatherData.weatherData = weatherData
        saveData()
    }
    
    func updateOfflineWeatherEntity(weatherData:Data){
        do {
            let results = try managedObjectContext.fetch(request)
            if results.count != 0 {
                results[0].setValue(weatherData, forKey: "weatherData")
                saveData()
            }else{
                self.addWeatherDataOffline(weatherData: weatherData)
            }
        } catch {
            print("Fetch Failed: \(error)")
        }
    }
    
}
