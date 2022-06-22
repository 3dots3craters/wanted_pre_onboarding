//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by hayeon on 2022/06/20.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var descript: UILabel!
    @IBOutlet weak var temp_min: UILabel!
    @IBOutlet weak var temp_max: UILabel!
    @IBOutlet weak var feels_like: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    var weather: CurrentWeather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let info = weather else { return }
        Task {
            await weatherImage.loadImage(icon: info.weather[0].icon)
        }
        updateView(with: info)
    }
}

extension WeatherViewController {
    
    func updateView(with info: CurrentWeather) {
        temp.text = "\(Int(info.main.temp - 273))℃"
        descript.text = info.weather[0].description
        temp_min.text = "\(Int(info.main.temp_min - 273))℃"
        temp_max.text = "\(Int(info.main.temp_max - 273))℃"
        feels_like.text = "\(Int(info.main.feels_like - 273))℃"
        humidity.text = "\(info.main.humidity)%"
        pressure.text = "\(info.main.pressure)hPa"
        speed.text = "\(Int(info.wind.speed))m/s"
    }
}
