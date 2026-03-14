//
//  Hero.swift
//  lab3
//
//  Created by Мирас Нуралиев on 14.03.2026.
//

import Foundation

struct Hero: Codable {
    let id: Int
    let name: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let connections: Connections
    let images: Images
}

struct Powerstats: Codable {
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
}

struct Appearance: Codable {
    let gender: String?
    let race: String?
    let eyeColor: String?
    let hairColor: String?
}

struct Biography: Codable {
    let fullName: String?
    let placeOfBirth: String?
    let publisher: String?
    let alignment: String?
}

struct Work: Codable {
    let occupation: String?
}

struct Connections: Codable {
    let groupAffiliation: String?
}

struct Images: Codable {
    let lg: String
}
