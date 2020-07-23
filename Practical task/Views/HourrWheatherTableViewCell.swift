//
//  HourrWheatherTableViewCell.swift
//  Practical tasks
//
//  Created by Yoel Jimenez del Valle on 7/23/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import UIKit

class HourrWheatherTableViewCell: UITableViewCell {
    @IBOutlet weak var wheatherName:UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var windDirection:UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var airPresure: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var visibilty: UILabel!
    @IBOutlet weak var predictability: UILabel!
    @IBOutlet weak var hourIco: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(val: ConsolidatedWeather?,unitVM:WheaterTempViewModel,percentVM:PercentageViewModel){
        wheatherName.text = val?.weather_state_name ?? ""
        windSpeed.text = unitVM.winSpeed(speed: val?.wind_speed ?? 0)
        windDirection.text = "\(val?.wind_direction_compass ?? "") - \(unitVM.windDegree(degree: val?.wind_direction ?? 0))"
        temp.text = unitVM.temp(temp: val?.the_temp ?? 0)
        airPresure.text = unitVM.presure(preasure: val?.air_pressure ?? 0)
        humidity.text = percentVM.percentage(value: val?.humidity ?? 0)
        visibilty.text = unitVM.miles(miles: val?.visibility ?? 0)
        predictability.text = percentVM.percentage(value: Double(val?.predictability ?? 0))
        hourIco.kf.setImage(with: URL(string: "https://www.metaweather.com/static/img/weather/png/\(val?.weather_state_abbr ?? "").png"))
    }

}
