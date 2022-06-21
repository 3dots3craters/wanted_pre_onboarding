//
//  TableViewController.swift
//  WeatherApp
//
//  Created by hayeon on 2022/06/20.
//

import UIKit



class TableViewController: UITableViewController {
    
    let cityList = City().getCityList()
    var model = WeatherModel()
    var data = [Int : weatherInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cityList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherInfo", for: indexPath) as! TableViewCell

        Task {
            do {
                let idx = indexPath.row                
                let weather = try await model.getWeatherInfo(of: cityList[idx])
                
                data[idx] = weatherInfo(temp: weather.main.temp, feels_like: weather.main.feels_like, temp_min: weather.main.temp_min, temp_max: weather.main.temp_max, pressure: weather.main.pressure, humidity: weather.main.humidity, speed: weather.wind.speed, description: weather.weather[0].description, icon: weather.weather[0].icon, name: cityList[idx])
                
                await cell.weatherImage.loadImage(icon: data[idx]?.icon ?? "01d")
                cell.tempHumidityLable?.text = "\(Int(data[idx]?.temp ?? 273) - 273)℃/\(data[idx]?.humidity ?? 50)%"
            }
            catch WeatherDownloadError.invalidURLString {
                print("weather error - invalidURLString")
            }
            catch WeatherDownloadError.invalidServerResponse {
                print("weather error - invalidServerResponse")
            }
        }
        cell.cityName?.text = cityList[indexPath.row]
        
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let destination = segue.destination as? WeatherViewController else { return }
        if let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
            destination.weather = data[selectedIndex]
        }
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Click - \(indexPath.row)")
        self.performSegue(withIdentifier: "weatherVC", sender: self)
    }

}
