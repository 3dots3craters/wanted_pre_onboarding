//
//  UIImageViewExtension.swift
//  WeatherApp
//
//  Created by hayeon on 2022/06/21.
//

import UIKit

extension UIImageView {
    
    func loadImage(icon key: String) async {
        let cacheKey = NSString(string: key)
        if let cachedImage = ImageCache.shared.object(forKey: cacheKey) {
            self.image = cachedImage
            return
        }
        
        do {
            guard let newImage = try getWeatherImage(icon: key) else {
                return
            }
            ImageCache.shared.setObject(newImage, forKey: cacheKey)
            self.image = newImage
        }
        catch {
            print("image error")
        }
    }
}
