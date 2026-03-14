//
//  HeroService.swift
//  lab3
//
//  Created by Мирас Нуралиев on 14.03.2026.
//

import Foundation

class HeroService {

    func fetchHero() async throws -> Hero {

        let randomId = Int.random(in: 1...731)

        let url = URL(string:
        "https://akabab.github.io/superhero-api/api/id/\(randomId).json")!

        let (data, _) = try await URLSession.shared.data(from: url)

        let hero = try JSONDecoder().decode(Hero.self, from: data)

        return hero
    }
}
