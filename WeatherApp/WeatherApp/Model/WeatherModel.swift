//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by hayeon on 2022/06/20.
//

import Foundation
import UIKit

class WeatherModel {
    
    func getWeatherInfo(of city: String) async throws -> CurrentWeather {
        
        guard let url = URL(string: Storage().weatherURLprefix + city + Storage().weatherURLappid + Storage().apiKey + Storage().weatherURLsuffix) else {
            throw WeatherDownloadError.invalidURLString
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw WeatherDownloadError.invalidServerResponse
        }
        let currentWeather = try JSONDecoder().decode(CurrentWeather.self, from: data)
        return currentWeather
    }
    
    func getWeatherImage(icon: String) throws -> UIImage? {
        
        guard let url = URL(string: "http://openweathermap.org/img/wn/\(icon)@2x.png") else {
            throw ImageDownloadError.invalidURLString
        }
        let data = try Data(contentsOf: url)
        return UIImage(data: data)
    }
    
}
