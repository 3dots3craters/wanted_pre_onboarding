//
//  Error.swift
//  WeatherApp
//
//  Created by hayeon on 2022/06/20.
//

import Foundation

struct DownloadError {
    
    // MARK: - Error message
    
    let WeatherInvalidURLString = "weather error - invalidURLString"
    let WeatherInvalidServerResponse = "weather error - invalidServerResponse"
    let ImageInvalidURLString = "image error - invalidURLString"
    let ImageInvalidServerResponse = "image error - invalidServerResponse"
    let ImageInvalidUIImage = "image error - invalidUIImage"
    let GeoInvalidURLString = "geo error - invalidURLString"
    let GeoInvalidServerResponse = "geo error - invalidServerResponse"
    
    // MARK: - Error function
    
    func printMessage(about error: Error) {
        
        print("----------error----------")
        switch error {
        case WeatherDownloadError.invalidURLString:
            print(WeatherInvalidURLString)
        case WeatherDownloadError.invalidServerResponse:
            print(WeatherInvalidServerResponse)
        case ImageDownloadError.invalidURLString:
            print(ImageInvalidURLString)
        case ImageDownloadError.invalidServerResponse:
            print(ImageInvalidServerResponse)
        case ImageDownloadError.invalidUIImage:
            print(ImageInvalidUIImage)
        case GeoDownloadError.invalidURLString:
            print(GeoInvalidURLString)
        case GeoDownloadError.invalidServerResponse:
            print(GeoInvalidServerResponse)
        default:
            print("error: \(error)")
        }
    }
}

// MARK: - Error Definition

enum WeatherDownloadError: Error {
    case invalidURLString
    case invalidServerResponse
}

enum ImageDownloadError: Error {
    case invalidURLString
    case invalidServerResponse
    case invalidUIImage
}

enum GeoDownloadError: Error {
    case invalidURLString
    case invalidServerResponse
}

