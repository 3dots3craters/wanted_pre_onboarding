//
//  Storage.swift
//  WeatherApp
//
//  Created by hayeon on 2022/06/20.
//

import Foundation

struct Storage {
    let apiKey = "895083fae53f0d29ae25a13576a18856"
    let geoURLprefix = "http://api.openweathermap.org/geo/1.0/direct?q="
    let geoURLsuffix = "&limit=5&appid="
    let weatherURLprefix = "https://api.openweathermap.org/data/2.5/weather?lat="
    let weatherURLLon = "&lon="
    let weatherURLappid = "&appid="
    let weatherURLsuffix = "&lang=kr"
    let imageURLprefix = "http://openweathermap.org/img/wn/"
    let imageURLsuffix = "@2x.png"
}
