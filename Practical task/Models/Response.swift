//
//  Response.swift
//  Practical tasks
//
//  Created by Yoel Jimenez del Valle on 7/22/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import Foundation
struct ResponseWoeid : Codable {
    let consolidatedWeather : [ConsolidatedWeather]?
    let time : String?
    let sun_rise : String?
    let sun_set : String?
    let timezone_name : String?
    let parent : Parent?
    let sources : [Sources]?
    let title : String?
    let location_type : String?
    let woeid : Int?
    let latt_long : String?
    let timezone : String?
    enum CodingKeys: String, CodingKey {
        case consolidatedWeather = "consolidated_weather"
        case time = "time"
        case sun_rise = "sun_rise"
        case sun_set = "sun_set"
        case timezone_name = "timezone_name"
        case parent = "parent"
        case sources = "sources"
        case title = "title"
        case location_type = "location_type"
        case woeid = "woeid"
        case latt_long = "latt_long"
        case timezone = "timezone"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        consolidatedWeather = try values.decodeIfPresent([ConsolidatedWeather].self, forKey: .consolidatedWeather)
        time = try values.decodeIfPresent(String.self, forKey: .time)
        sun_rise = try values.decodeIfPresent(String.self, forKey: .sun_rise)
        sun_set = try values.decodeIfPresent(String.self, forKey: .sun_set)
        timezone_name = try values.decodeIfPresent(String.self, forKey: .timezone_name)
        parent = try values.decodeIfPresent(Parent.self, forKey: .parent)
        sources = try values.decodeIfPresent([Sources].self, forKey: .sources)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        location_type = try values.decodeIfPresent(String.self, forKey: .location_type)
        woeid = try values.decodeIfPresent(Int.self, forKey: .woeid)
        latt_long = try values.decodeIfPresent(String.self, forKey: .latt_long)
        timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
    }
}
struct Parent : Codable {
    let title : String?
    let location_type : String?
    let woeid : Int?
    let latt_long : String?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case location_type = "location_type"
        case woeid = "woeid"
        case latt_long = "latt_long"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        location_type = try values.decodeIfPresent(String.self, forKey: .location_type)
        woeid = try values.decodeIfPresent(Int.self, forKey: .woeid)
        latt_long = try values.decodeIfPresent(String.self, forKey: .latt_long)
    }
}
struct Sources : Codable {
    let title : String?
    let slug : String?
    let url : String?
    let crawl_rate : Int?
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case slug = "slug"
        case url = "url"
        case crawl_rate = "crawl_rate"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        crawl_rate = try values.decodeIfPresent(Int.self, forKey: .crawl_rate)
    }
}
struct ConsolidatedWeather : Codable {
    let id : Int?
    let weather_state_name : String?
    let weather_state_abbr : String?
    let wind_direction_compass : String?
    let created : String?
    let applicable_date : String?
    let min_temp : Double?
    let max_temp : Double?
    let the_temp : Double?
    let wind_speed : Double?
    let wind_direction : Double?
    let air_pressure : Double?
    let humidity : Double?
    let visibility : Double?
    let predictability : Int?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case weather_state_name = "weather_state_name"
        case weather_state_abbr = "weather_state_abbr"
        case wind_direction_compass = "wind_direction_compass"
        case created = "created"
        case applicable_date = "applicable_date"
        case min_temp = "min_temp"
        case max_temp = "max_temp"
        case the_temp = "the_temp"
        case wind_speed = "wind_speed"
        case wind_direction = "wind_direction"
        case air_pressure = "air_pressure"
        case humidity = "humidity"
        case visibility = "visibility"
        case predictability = "predictability"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        weather_state_name = try values.decodeIfPresent(String.self, forKey: .weather_state_name)
        weather_state_abbr = try values.decodeIfPresent(String.self, forKey: .weather_state_abbr)
        wind_direction_compass = try values.decodeIfPresent(String.self, forKey: .wind_direction_compass)
        created = try values.decodeIfPresent(String.self, forKey: .created)
        applicable_date = try values.decodeIfPresent(String.self, forKey: .applicable_date)
        min_temp = try values.decodeIfPresent(Double.self, forKey: .min_temp)
        max_temp = try values.decodeIfPresent(Double.self, forKey: .max_temp)
        the_temp = try values.decodeIfPresent(Double.self, forKey: .the_temp)
        wind_speed = try values.decodeIfPresent(Double.self, forKey: .wind_speed)
        wind_direction = try values.decodeIfPresent(Double.self, forKey: .wind_direction)
        air_pressure = try values.decodeIfPresent(Double.self, forKey: .air_pressure)
        humidity = try values.decodeIfPresent(Double.self, forKey: .humidity)
        visibility = try values.decodeIfPresent(Double.self, forKey: .visibility)
        predictability = try values.decodeIfPresent(Int.self, forKey: .predictability)
    }
}

