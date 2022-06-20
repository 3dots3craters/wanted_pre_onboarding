//
//  Weather.swift
//  WeatherApp
//
//  Created by hayeon on 2022/06/20.
//

import Foundation

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


/*
{
    "coord": {
     "lon": -122.08,
     "lat": 37.39
    },
    "weather": [
     {
        "id": 800,
        "main": "Clear",
        "description": "clear sky",
        "icon": "01d"
     }
    ],
    "base": "stations",
    "main": {
     "temp": 282.55,
     "feels_like": 281.86,
     "temp_min": 280.37,
     "temp_max": 284.26,
     "pressure": 1023,
     "humidity": 100
    },
    "visibility": 10000,
    "wind": {
     "speed": 1.5,
     "deg": 350
    },
    "clouds": {
     "all": 1
    },
    "dt": 1560350645,
    "sys": {
     "type": 1,
     "id": 5122,
     "message": 0.0139,
     "country": "US",
     "sunrise": 1560343627,
     "sunset": 1560396563
    },
    "timezone": -25200,
    "id": 420006353,
    "name": "Mountain View",
    "cod": 200
}
*/
