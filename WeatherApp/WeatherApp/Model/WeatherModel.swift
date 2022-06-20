//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by hayeon on 2022/06/20.
//

import Foundation
import UIKit

class WeatherModel {
    
    func getWeather(lat: Double, lon: Double) async throws -> CurrentWeather {
        guard let url = URL(string: Storage().weatherURLprefix + "\(lat)" + Storage().weatherURLLon + "\(lon)" + Storage().weatherURLappid + Storage().apiKey + Storage().weatherURLsuffix) else {
            throw WeatherDownloadError.invalidURLString
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw WeatherDownloadError.invalidServerResponse
        }
        
        let currentWeather = try JSONDecoder().decode(CurrentWeather.self, from: data)
        
        return currentWeather
    }
    
    func getWeatherImage(icon: String) -> UIImage? {
        let url = URL(string: "http://openweathermap.org/img/wn/\(icon)@2x.png")
        
        do {
            let data = try Data(contentsOf: url!)
            return UIImage(data: data)
        }
        catch {
            print("Get Image Error")
        }
        return nil
    }
    
    func getCityInfo(of cityName: String) async throws -> CityInfo {
        
        guard let url = URL(string: Storage().geoURLprefix + cityName + Storage().geoURLsuffix + Storage().apiKey) else {
            throw WeatherDownloadError.invalidURLString
        }
       
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw WeatherDownloadError.invalidServerResponse
        }
        let cities = try JSONDecoder().decode([CityInfo].self, from: data)
        
        return cities.filter({$0.country == "KR"})[0]
        
    }
    
}
