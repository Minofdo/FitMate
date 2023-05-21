//
//  ImageFetcher.swift
//  FitMate
//
//  Created by Minoli Fernando on 2023-05-21.
//

import UIKit

class ImageFetcher {
    
    static func fetchExerciseImage(_ path: String, completion:@escaping (UIImage?) -> ()) {
        let url = URL(string: path)!
        // Fetch Image Data
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    completion(UIImage(data: data))
                } else {
                    completion(nil)
                }
            }
        }).resume()
        
    }
    
}
