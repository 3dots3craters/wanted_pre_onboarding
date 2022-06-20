//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by hayeon on 2022/06/20.
//

import Foundation

protocol WeatherModelProtocol {
    func weatherRetrieved(weather: CurrentWeather)
}

class WeatherModel {
    
    var delegate : WeatherModelProtocol?
    
    
    func getLatLon(of cityName: String) -> [Double]? {
        let urlString = "http://api.openweathermap.org/geo/1.0/direct?q=\(cityName),\(countryCode)&limit={limit}&appid=\(Storage().apiKey)"
        
        let url = URL(string: urlString)
        guard url != nil else {
            print("Can not create url object")
            return nil
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do {
                    let Weather
                }
            }
            
        }
        
    }
    
    func getWeather(of cityName: String) {
        
        let latLon = getLatLon(of: cityName)
        
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(latLon[0])&lon=\(latLon[1])&appid=\(Storage().apiKey)"
        delegate?.weatherRetrieved(weather: CurrentWeather데이터)
    }
}
