//
//  ContentView.swift
//  lab3
//
//  Created by Мирас Нуралиев on 14.03.2026.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = HeroViewModel()

    var body: some View {

        ZStack {

            LinearGradient(
                colors: [.blue.opacity(0.7), .purple],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack {

                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                        .tint(.white)
                }

                else if let hero = viewModel.hero {

                    ScrollView {

                        VStack(spacing: 25) {

                            AsyncImage(url: URL(string: hero.images.lg)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .shadow(radius: 10)
                            } placeholder: {
                                ProgressView()
                            }

                            Text(hero.name)
                                .font(.system(size: 40, weight: .black, design: .rounded))
                                .foregroundColor(.white)

                            heroInfo(hero)

                            powerStats(hero)

                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .padding()
                    }
                }

                else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.white)
                }

                Button {

                    Task {
                        await viewModel.loadRandomHero()
                    }

                } label: {

                    Text("🎲 Random Hero")
                        .font(.system(size: 20, weight: .bold))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .foregroundColor(.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 5)
                }
                .padding()

            }
        }
        .task {
            await viewModel.loadRandomHero()
        }
    }
}

extension ContentView {

    func heroInfo(_ hero: Hero) -> some View {

        VStack(alignment: .leading, spacing: 10) {

            Text("Full Name: \(hero.biography.fullName ?? "Unknown")")
            Text("Gender: \(hero.appearance.gender ?? "Unknown")")
            Text("Race: \(hero.appearance.race ?? "Unknown")")
            Text("Publisher: \(hero.biography.publisher ?? "Unknown")")
            Text("Occupation: \(hero.work.occupation ?? "Unknown")")
            Text("Eye Color: \(hero.appearance.eyeColor ?? "Unknown")")
            Text("Hair Color: \(hero.appearance.hairColor ?? "Unknown")")
            Text("Alignment: \(hero.biography.alignment ?? "Unknown")")

        }
        .font(.system(size: 17, weight: .semibold))
        .foregroundColor(.white)
    }

    func powerStats(_ hero: Hero) -> some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Power Stats")
                .font(.system(size: 22, weight: .heavy))
                .foregroundColor(.white)

            statBar("Intelligence", hero.powerstats.intelligence)
            statBar("Strength", hero.powerstats.strength)
            statBar("Speed", hero.powerstats.speed)
            statBar("Durability", hero.powerstats.durability)
            statBar("Power", hero.powerstats.power)
            statBar("Combat", hero.powerstats.combat)
        }
    }

    func statBar(_ title: String, _ value: Int) -> some View {

        VStack(alignment: .leading) {

            HStack {
                Text(title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)

                Spacer()

                Text("\(value)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }

            ProgressView(value: Double(value), total: 100)
                .scaleEffect(x: 1, y: 2.5)
                .tint(.yellow)
        }
    }
}

#Preview {
    ContentView()
}
