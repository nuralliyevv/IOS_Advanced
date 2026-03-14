//
//  ContentView.swift
//  lab1
//
//  Created by Мирас Нуралиев on 14.03.2026.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Data Arrays
    
    let itemNames = [
        "Cat",
        "Dog",
        "Rabbit",
        "Panda",
        "Turtle"
    ]
    
    let itemIcons = [
        "cat.fill",
        "dog.fill",
        "hare.fill",
        "pawprint.fill",
        "tortoise.fill"
    ]
    
    let itemDescriptions = [
        "Cats are independent and playful pets loved around the world.",
        "Dogs are loyal companions and great friends for humans.",
        "Rabbits are small fluffy animals that love to hop.",
        "Pandas are adorable bears that love eating bamboo.",
        "Turtles are slow-moving reptiles that love to bask in the sun."
    ]
    
    let itemRatings = [
        5,
        5,
        4,
        3,
        5,
        4
    ]
    
    // MARK: State
    
    @State private var currentIndex = 0
    @State private var tapCount = 0
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            // Icon
            Image(systemName: itemIcons[currentIndex])
                .font(.system(size: 80))
                .foregroundStyle(.blue)
            
            // Name
            Text(itemNames[currentIndex])
                .font(.title)
                .bold()
            
            Divider()
                .padding(.horizontal)
            
            // Description
            Text(itemDescriptions[currentIndex])
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Rating
            ratingView
            
            // Button
            Button("Surprise Me!") {
                changeCard()
            }
            .buttonStyle(.borderedProminent)
            
            // Tap counter
            Text("Cards explored: \(tapCount)")
                .padding(.top)
        }
        .padding()
    }
    
    // MARK: Rating
    
    @ViewBuilder
    var ratingView: some View {
        let rating = itemRatings[currentIndex]

        if rating == 0 {
            Text("No rating")
        } else {
            Text(String(repeating: "🐾", count: rating))
        }
    }
    
    // MARK: Random Logic
    
    func changeCard() {
        
        var newIndex: Int
        
        repeat {
            newIndex = Int.random(in: 0..<itemNames.count)
        } while newIndex == currentIndex
        
        currentIndex = newIndex
        
        tapCount += 1
    }
}

#Preview {
    ContentView()
}
