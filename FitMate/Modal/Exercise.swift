//
//  Exercise.swift
//  FitMate
//
//  Created by Minoli Fernando on 2023-05-20.
//

import Foundation

struct Exercise: Codable {
    let bodyParts: [String]
    let caloriesBurnedPerMinute: Int
    let category: String
    let description: String
    let difficulty: String
    let durationMinutes: Int
    let id: String
    let imageURL: String
    let name: String
    let howTo: [String]
    let videoURL: String
    
    enum CodingKeys: String, CodingKey {
        case bodyParts = "body_parts"
        case caloriesBurnedPerMinute = "calories_burned_per_minute"
        case category
        case description
        case difficulty
        case durationMinutes = "duration_minutes"
        case id
        case imageURL = "thumbnail"
        case name
        case howTo = "how_to"
        case videoURL = "video_url"
    }
}
