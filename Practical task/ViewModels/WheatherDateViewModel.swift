//
//  WheatherDayViewModel.swift
//  Practical tasks
//
//  Created by Yoel Jimenez del Valle on 7/22/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import UIKit
class WheatherDateViewModel{
    let formater = DateFormatter()
    init() {
        formater.locale = Locale.current
    }
    func date(date: String) -> String{
        formater.dateFormat = "yyyy-MM-dd"
        let date = formater.date(from: date)
        formater.dateFormat = "EEEE dd"
        return formater.string(from: date ?? Date())
    }
}
class WheaterTempViewModel{
    let formater = MeasurementFormatter()
    init(){
        formater.unitStyle = .short
        formater.numberFormatter.maximumFractionDigits = 0
        formater.unitOptions = .naturalScale
        formater.locale = Locale.current //Locale(identifier: "en_MX")
    }
    func temp(temp: Double) -> String{
        let measure = Measurement(value: temp, unit: UnitTemperature.celsius)
        return formater.string(from: measure)
    }
    func winSpeed(speed:Double) -> String{
        let measure = Measurement(value: speed, unit: UnitSpeed.milesPerHour)
        return formater.string(from: measure)//string(from: measure)
    }
    func windDegree(degree:Double) -> String{
        let measure = Measurement(value: degree, unit: UnitAngle.degrees)
        return formater.string(from: measure)
    }
    func presure(preasure:Double) -> String{
        let measure = Measurement(value: preasure, unit: UnitPressure.millibars)
        return formater.string(from: measure)
    }
    func miles(miles:Double) -> String{
        let measure = Measurement(value: miles, unit: UnitLength.miles)
        return formater.string(from: measure)
    }
}
class PercentageViewModel{
    let formater = NumberFormatter()
    
    init() {
        formater.numberStyle = .percent
        formater.maximumFractionDigits = 0
        formater.multiplier = 1
    }
    func percentage(value:Double) -> String{
        let number = NSNumber(value: value)
        return formater.string(from: number) ?? "0%"
    }
}
