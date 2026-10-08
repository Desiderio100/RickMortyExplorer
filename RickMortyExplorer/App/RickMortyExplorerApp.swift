// RickMortyExplorerApp.swift - Punto de entrada y pestañas de la app

import SwiftUI

@main
struct RickMortyExplorerApp: App {
    @State private var favorites = FavoritesStore()

    var body: some Scene {
        WindowGroup {
            TabView {
                CharacterListView()
                    .tabItem { Label("Explorar", systemImage: "person.3") }

                FavoritesView()
                    .tabItem { Label("Guardados", systemImage: "bookmark") }

                AboutView()
                    .tabItem { Label("Info", systemImage: "info.circle") }
            }
            .environment(favorites)
            .tint(.portal)
        }
    }
}
