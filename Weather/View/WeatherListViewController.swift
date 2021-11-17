//
//  WeatherListViewController.swift
//  Weather
//
//  Created by Astha yadav on 15/11/21.
//

import UIKit

class WeatherListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var weatherVM: WeatherViewModel!
    private var forcastArray = [OneDayForcast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = WeatherAPIKey.cityName
        self.weatherVM = WeatherViewModel(delegate: self, restClient: WeatherRestClient.sharedObject)
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refershWeatherData), for: .valueChanged)
        self.tableView.refreshControl = refreshControl
        
        self.weatherVM.getWeatherData(city: WeatherAPIKey.cityName, recordCount: WeatherAPIKey.cnt)    
    }
    
    @objc func refershWeatherData(refreshControl: UIRefreshControl) {
        self.weatherVM.getWeatherData(city: WeatherAPIKey.cityName, recordCount: WeatherAPIKey.cnt)
        refreshControl.endRefreshing()
    }
    
}

//MARK: - WeatherViewModelDelegate
extension WeatherListViewController: WeatherViewModelDelegate{
    
    func didUpdateWeather(_ weatherList: [OneDayForcast]) {
        self.forcastArray = weatherList
        DispatchQueue.main.async(){
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error.localizedDescription)
    }
}

//MARK: - UITableViewDelegate,UITableViewDataSource
extension WeatherListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forcastArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.weatherTableCellIdentifier) as! WeatherListTableViewCell
        
        cell.configure(list: forcastArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = Stroyboard.stroyboard.instantiateViewController(withIdentifier: Identifiers.weatherDetailViewController) as? WeatherDetailViewController
        detailVC?.weatherDetail = forcastArray[indexPath.row]
        self.navigationController?.pushViewController(detailVC!, animated: true)
    }
}
