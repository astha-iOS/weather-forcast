//
//  WeatherListTableViewCell.swift
//  Weather
//
//  Created by Astha yadav on 15/11/21.
//

import UIKit

class WeatherListTableViewCell: UITableViewCell {

    @IBOutlet weak var cloudImageView: UIImageView!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var timestempLabel: UILabel!
    var weatherDetailVM:WeatherDetailViewModel?
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(list:OneDayForcast){
        
        self.weatherDetailVM = WeatherDetailViewModel(list: list)
        
        timestempLabel.text = weatherDetailVM?.dateWithDayName
        maxTempLabel.text = weatherDetailVM?.maxTemp
        minTempLabel.text = weatherDetailVM?.minTemp
        cloudImageView.image = weatherDetailVM?.weatherImage
        
    }

}
