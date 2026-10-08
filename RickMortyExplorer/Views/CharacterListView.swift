// CharacterListView.swift - Nivel 1: lista de personajes

import SwiftUI

struct CharacterListView: View {
    @State private var viewModel = CharacterListViewModel()

    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Explorar")
                .navigationDestination(for: ShowCharacter.self) { character in
                    CharacterDetailView(character: character)
                }
        }
        .task { await viewModel.loadCharacters() }
    }

    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading {
            LoadingView()
        } else if let error = viewModel.apiError {
            ErrorView(error: error) {
                Task { await viewModel.loadCharacters() }
            }
        } else {
            characterList
        }
    }

    private var characterList: some View {
        List {
            Picker("Estado", selection: $viewModel.selectedFilter) {
                ForEach(viewModel.filters, id: \.self) { filter in
                    Text(filter)
                }
            }
            .pickerStyle(.segmented)
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)

            ForEach(viewModel.filteredCharacters) { character in
                NavigationLink(value: character) {
                    CharacterRowView(character: character)
                }
                .cardRow()
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color(.systemGroupedBackground))
        .searchable(text: $viewModel.searchText, prompt: "Buscar personaje")
    }
}
