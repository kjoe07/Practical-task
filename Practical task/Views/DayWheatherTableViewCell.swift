//
//  DayWheatherTableViewCell.swift
//  Practical tasks
//
//  Created by Yoel Jimenez del Valle on 7/22/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import UIKit
import Kingfisher
class DayWheatherTableViewCell: UITableViewCell {
    @IBOutlet weak var dayName: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var imageICon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setup(data: ConsolidatedWeather?,vm: WheatherDateViewModel,tempVM: WheaterTempViewModel){
        let urlString = "https://www.metaweather.com/static/img/weather/png/\(data?.weather_state_abbr ?? "").png"
        imageICon.kf.setImage(with: URL(string: urlString)!)
        dayName.text = vm.date(date: data?.applicable_date ?? "")
        temp.text = "\(tempVM.temp(temp: data?.max_temp ?? 0))/\(tempVM.temp(temp: data?.min_temp ?? 0))"
    }

}
