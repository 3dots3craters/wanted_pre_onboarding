//
//  Error.swift
//  WeatherApp
//
//  Created by hayeon on 2022/06/20.
//

import Foundation

enum WeatherDownloadError: Error {
    case invalidURLString
    case invalidServerResponse
}
