//
//  ImageCache.swift
//  WeatherApp
//
//  Created by hayeon on 2022/06/21.
//

import UIKit

class ImageCacheManager {
    
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}
