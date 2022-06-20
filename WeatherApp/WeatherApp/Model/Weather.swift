//
//  Weather.swift
//  WeatherApp
//
//  Created by hayeon on 2022/06/20.
//

import Foundation

struct weatherInfo {
    var temp : Double
    var feels_like : Double
    var temp_min : Double
    var temp_max : Double
    var pressure : Int
    var humidity : Int
    var speed : Double
    var description : String
    var icon : String
    var name : String
}

struct CityInfo : Codable {
    var lat : Double
    var lon : Double
    var country : String
}

struct CurrentWeather : Codable {
    var weather : [weather]
    var main : main
    var wind : wind
}

struct weather : Codable {
    var description : String
    var icon : String
}

struct main : Codable {
    var temp : Double
    var feels_like : Double
    var temp_min : Double
    var temp_max : Double
    var pressure : Int
    var humidity : Int
}

struct wind : Codable {
    var speed : Double
}

