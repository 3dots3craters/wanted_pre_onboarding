//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by hayeon on 2022/06/20.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var descript: UILabel!
    @IBOutlet weak var temp_min: UILabel!
    @IBOutlet weak var temp_max: UILabel!
    @IBOutlet weak var feels_like: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    var weather: weatherInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let info = weather else { return }
        updateView(with: info)
    }
    
    func updateView(with info: weatherInfo) {
        cityName.text = info.name
        temp.text = "\(Int(info.temp - 273))℃"
        descript.text = info.description
        temp_min.text = "\(Int(info.temp_min - 273))℃"
        temp_max.text = "\(Int(info.temp_max - 273))℃"
        feels_like.text = "\(Int(info.feels_like - 273))℃"
        humidity.text = "\(info.humidity)%"
        pressure.text = "\(info.pressure)hPa"
        speed.text = "\(Int(info.speed))m/s"
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
