// FavoritesView.swift - Pestaña con los personajes guardados

import SwiftUI

struct FavoritesView: View {
    @Environment(FavoritesStore.self) private var favorites

    var body: some View {
        NavigationStack {
            Group {
                if favorites.favorites.isEmpty {
                    ContentUnavailableView(
                        "Aún no hay guardados",
                        systemImage: "bookmark",
                        description: Text("Abre un personaje y toca el marcador para guardarlo.")
                    )
                } else {
                    List(favorites.favorites) { character in
                        NavigationLink(value: character) {
                            CharacterRowView(character: character)
                        }
                        .cardRow()
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .background(Color(.systemGroupedBackground))
                }
            }
            .navigationTitle("Guardados")
            .navigationDestination(for: ShowCharacter.self) { character in
                CharacterDetailView(character: character)
            }
        }
    }
}
