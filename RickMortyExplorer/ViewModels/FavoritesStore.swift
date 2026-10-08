// FavoritesStore.swift - Personajes guardados, compartidos entre pestañas

import Foundation
import Observation

@MainActor
@Observable
final class FavoritesStore {
    var favorites: [ShowCharacter] = []

    func isFavorite(_ character: ShowCharacter) -> Bool {
        favorites.contains { $0.id == character.id }
    }

    func toggle(_ character: ShowCharacter) {
        if isFavorite(character) {
            favorites.removeAll { $0.id == character.id }
        } else {
            favorites.append(character)
        }
    }
}
