//
//  WeatherDetailViewController.swift
//  Weather
//
//  Created by Astha yadav on 16/11/21.
//

import UIKit

class WeatherDetailViewController: UITableViewController {
    
    @IBOutlet weak var weatherStatusLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var sunriseTimeLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var sunsetTimeLabel: UILabel!
    @IBOutlet weak var chanceOfRainLabel: UILabel!
    @IBOutlet weak var feelsLikeMorningLabel: UILabel!
    @IBOutlet weak var feelsLikeDayLabel: UILabel!
    @IBOutlet weak var feelsLikeEveningLabel: UILabel!
    @IBOutlet weak var feelsLikeNightLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var dayLikeLabel: UILabel!
    
    var weatherDetail:OneDayForcast!
    
    private var weatherDetailVM:WeatherDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherDetailVM = WeatherDetailViewModel(list: weatherDetail)
        setWeatherDetail()
    }

    func setWeatherDetail() {
        self.title = weatherDetailVM.getTimestempToDateString(time: weatherDetail.dt!)
        
        self.sunriseTimeLabel.text = weatherDetailVM.sunrise
        self.sunsetTimeLabel.text = weatherDetailVM.sunset
        self.dayLikeLabel.text = weatherDetailVM.dayLikeStatus
        self.maxTempLabel.text = weatherDetailVM.maxTemp
        self.minTempLabel.text = weatherDetailVM.minTemp
        self.humidityLabel.text = weatherDetailVM.humidity
        self.pressureLabel.text = weatherDetailVM.pressure
        self.chanceOfRainLabel.text = weatherDetailVM.rain
        self.feelsLikeMorningLabel.text = weatherDetailVM.feelsLikeMorning
        self.feelsLikeDayLabel.text = weatherDetailVM.feelsLikeDay
        self.feelsLikeEveningLabel.text = weatherDetailVM.feelsLikeEvening
        self.feelsLikeNightLabel.text = weatherDetailVM.feelsLikeNight
        self.weatherImageView.image = weatherDetailVM.weatherImage
        self.weatherStatusLabel.text = weatherDetailVM.weatherDescription
    }
  
}
