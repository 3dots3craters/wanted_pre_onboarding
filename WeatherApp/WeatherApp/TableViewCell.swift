//
//  TableViewCell.swift
//  WeatherApp
//
//  Created by hayeon on 2022/06/20.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
