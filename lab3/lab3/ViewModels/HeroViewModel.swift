//
//  HeroViewModel.swift
//  lab3
//
//  Created by Мирас Нуралиев on 14.03.2026.
//

import Foundation
import Combine

@MainActor
class HeroViewModel: ObservableObject {

    @Published var hero: Hero?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let service = HeroService()

    func loadRandomHero() async {
        
        isLoading = true
        errorMessage = nil
        
        do {
            hero = try await service.fetchHero()
        } catch {
            errorMessage = "Failed to load hero"
        }
        
        isLoading = false
    }
}
