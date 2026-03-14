//
//  ContentView.swift
//  lab2
//
//  Created by Мирас Нуралиев on 14.03.2026.
//

import SwiftUI

struct FavoriteItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let emoji: String
}

struct ContentView: View {

    // MARK: - Sections Data

    @State private var actionMovies: [FavoriteItem] = [
        FavoriteItem(title: "Mad Max", subtitle: "2015", emoji: "🔥"),
        FavoriteItem(title: "John Wick", subtitle: "2014", emoji: "🔫"),
        FavoriteItem(title: "Gladiator", subtitle: "2000", emoji: "⚔️"),
        FavoriteItem(title: "The Dark Knight", subtitle: "2008", emoji: "🦇"),
        FavoriteItem(title: "Inception", subtitle: "2010", emoji: "🌀"),
        FavoriteItem(title: "Avengers", subtitle: "2012", emoji: "🦸"),
        FavoriteItem(title: "Matrix", subtitle: "1999", emoji: "💊"),
        FavoriteItem(title: "Terminator", subtitle: "1984", emoji: "🤖"),
        FavoriteItem(title: "Die Hard", subtitle: "1988", emoji: "💥"),
        FavoriteItem(title: "Top Gun", subtitle: "1986", emoji: "✈️")
    ]

    @State private var comedyMovies: [FavoriteItem] = [
        FavoriteItem(title: "The Mask", subtitle: "1994", emoji: "🎭"),
        FavoriteItem(title: "Home Alone", subtitle: "1990", emoji: "🏠"),
        FavoriteItem(title: "Superbad", subtitle: "2007", emoji: "😂"),
        FavoriteItem(title: "Rush Hour", subtitle: "1998", emoji: "🚓"),
        FavoriteItem(title: "Step Brothers", subtitle: "2008", emoji: "🤣"),
        FavoriteItem(title: "The Hangover", subtitle: "2009", emoji: "🍺"),
        FavoriteItem(title: "Dumb & Dumber", subtitle: "1994", emoji: "🤪"),
        FavoriteItem(title: "Mean Girls", subtitle: "2004", emoji: "👑"),
        FavoriteItem(title: "Shrek", subtitle: "2001", emoji: "🟢"),
        FavoriteItem(title: "Ghostbusters", subtitle: "1984", emoji: "👻")
    ]

    @State private var scifiMovies: [FavoriteItem] = [
        FavoriteItem(title: "Interstellar", subtitle: "2014", emoji: "🌌"),
        FavoriteItem(title: "Star Wars", subtitle: "1977", emoji: "⭐"),
        FavoriteItem(title: "Avatar", subtitle: "2009", emoji: "🌍"),
        FavoriteItem(title: "Dune", subtitle: "2021", emoji: "🏜️"),
        FavoriteItem(title: "Blade Runner", subtitle: "1982", emoji: "🌃"),
        FavoriteItem(title: "Alien", subtitle: "1979", emoji: "👽"),
        FavoriteItem(title: "Gravity", subtitle: "2013", emoji: "🛰️"),
        FavoriteItem(title: "Arrival", subtitle: "2016", emoji: "🛸"),
        FavoriteItem(title: "Tron", subtitle: "1982", emoji: "💡"),
        FavoriteItem(title: "Looper", subtitle: "2012", emoji: "⏳")
    ]

    @State private var horrorMovies: [FavoriteItem] = [
        FavoriteItem(title: "The Conjuring", subtitle: "2013", emoji: "👻"),
        FavoriteItem(title: "IT", subtitle: "2017", emoji: "🎈"),
        FavoriteItem(title: "The Ring", subtitle: "2002", emoji: "📼"),
        FavoriteItem(title: "Insidious", subtitle: "2010", emoji: "😱"),
        FavoriteItem(title: "Saw", subtitle: "2004", emoji: "🧩"),
        FavoriteItem(title: "Get Out", subtitle: "2017", emoji: "🚪"),
        FavoriteItem(title: "A Quiet Place", subtitle: "2018", emoji: "🤫"),
        FavoriteItem(title: "The Nun", subtitle: "2018", emoji: "⛪"),
        FavoriteItem(title: "Hereditary", subtitle: "2018", emoji: "🕯️"),
        FavoriteItem(title: "Midsommar", subtitle: "2019", emoji: "🌼")
    ]

    var body: some View {

        NavigationView {

            List {

                Section("Action") {
                    ForEach(actionMovies) { movie in
                        FavoriteRow(item: movie)
                    }
                }

                Section("Comedy") {
                    ForEach(comedyMovies) { movie in
                        FavoriteRow(item: movie)
                    }
                }

                Section("Sci-Fi") {
                    ForEach(scifiMovies) { movie in
                        FavoriteRow(item: movie)
                    }
                }

                Section("Horror") {
                    ForEach(horrorMovies) { movie in
                        FavoriteRow(item: movie)
                    }
                }

            }
            .navigationTitle("My Favorite Movies")
        }
    }
}

// MARK: - Row View

struct FavoriteRow: View {

    let item: FavoriteItem

    var body: some View {

        HStack(spacing: 12) {

            Text(item.emoji)
                .font(.largeTitle)

            VStack(alignment: .leading) {

                Text(item.title)
                    .font(.headline)

                Text(item.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ContentView()
}
