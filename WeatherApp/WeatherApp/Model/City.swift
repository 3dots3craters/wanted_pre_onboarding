//
//  City.swift
//  WeatherApp
//
//  Created by hayeon on 2022/06/20.
//

import Foundation

struct CityInfo : Codable {
    var lat : Double
    var lon : Double
    var country : String
}

struct City {
//    private let cityList = ["공주", "광주(전라남도)", "구미", "군산", "대구", "대전", "목포", "부산", "서산", "서울", "속초", "수원", "순천", "울산", "익산", "전주", "제주시", "천안", "청주", "춘천"]
    
    private let cityList = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]
    
   
    func getCityList() -> [String] {
        return cityList
    }
    
}
