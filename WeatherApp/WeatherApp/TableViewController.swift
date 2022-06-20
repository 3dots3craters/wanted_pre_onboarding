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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    

    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return cityList.count
    }
    */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cityList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherInfo", for: indexPath) as! TableViewCell
        // Configure the cell...
        Task {
            do {
                let cityInfo = try await model.getCityInfo(of: cityList[indexPath.row])
                let cityWeather = try await model.getWeather(lat: cityInfo.lat, lon: cityInfo.lon)
                cell.weatherImage.image = model.getWeatherImage(icon: cityWeather.weather[0].icon)
                cell.tempHumidityLable?.text = "\(Int(cityWeather.main.temp) - 273)℃/\(cityWeather.main.humidity)%"
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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
