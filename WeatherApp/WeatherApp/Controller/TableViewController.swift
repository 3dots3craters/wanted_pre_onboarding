//
//  TableViewController.swift
//  WeatherApp
//
//  Created by hayeon on 2022/06/20.
//

import UIKit



class TableViewController: UITableViewController {
    
    let cityList = City().getCityList()
    var cityData = [Int : CurrentWeather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "날씨"
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherInfo", for: indexPath) as! TableViewCell

        Task {
            do {
                let idx = indexPath.row
                let geo = try await getCityInfo(of: cityList[idx][0])
                let weather = try await getWeatherInfo(lat: geo.lat, lon: geo.lon)
                
                cityData[idx] = weather
                await cell.weatherImage.loadImage(icon: cityData[idx]?.weather[0].icon ?? "01d")
                cell.tempHumidityLable?.text = "\(Int(cityData[idx]?.main.temp ?? 273) - 273)℃ / \(cityData[idx]?.main.humidity ?? 50)%"
            }
            catch {
                DownloadError().printMessage(about: error)
            }
        }
        
        cell.cityName?.text = cityList[indexPath.row][1]
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let destination = segue.destination as? WeatherViewController else { return }
        
        if let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
            destination.weather = cityData[selectedIndex]
            destination.navigationItem.title = cityList[selectedIndex][1]
        }
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "weatherVC", sender: self)
    }

}
