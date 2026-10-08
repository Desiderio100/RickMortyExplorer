// CharacterListViewModel.swift - Estado de la lista: datos, carga, error, filtro y búsqueda

import Foundation
import Observation

// Clean Code: la lógica vive en el ViewModel y la vista solo muestra el resultado
@MainActor
@Observable
final class CharacterListViewModel {
    var characters: [ShowCharacter] = []
    var isLoading = true
    var apiError: APIError?
    var selectedFilter = "Todos"
    var searchText = ""

    let filters = ["Todos", "Vivo", "Muerto", "Desconocido"]
    private let service = CharacterService()

    var filteredCharacters: [ShowCharacter] {
        characters.filter { character in
            let matchesFilter = selectedFilter == "Todos" || character.statusText == selectedFilter
            let matchesSearch = searchText.isEmpty || character.name.localizedCaseInsensitiveContains(searchText)
            return matchesFilter && matchesSearch
        }
    }

    func loadCharacters() async {
        isLoading = true
        apiError = nil

        do {
            characters = try await service.fetchCharacters()
        } catch {
            apiError = error as? APIError ?? .unknown
        }

        isLoading = false
    }
}
