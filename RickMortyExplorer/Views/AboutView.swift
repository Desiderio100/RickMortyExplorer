// AboutView.swift - Pestaña Info: qué hace la app y qué API usa

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Aplicación") {
                    Text("Explora los personajes de Rick and Morty, filtra por estado, busca por nombre y guarda tus favoritos.")
                }

                Section("Fuente de datos") {
                    Text("The Rick and Morty API")
                    Text(CharacterService.endpoint)
                        .font(.footnote.monospaced())
                        .foregroundStyle(.tint)
                }

                Section("Arquitectura MVVM") {
                    Label("Modelo: ShowCharacter", systemImage: "cube")
                    Label("Vista: vistas de SwiftUI", systemImage: "rectangle.on.rectangle")
                    Label("ViewModel: CharacterListViewModel", systemImage: "gearshape.2")
                }
            }
            .navigationTitle("Info")
        }
    }
}
