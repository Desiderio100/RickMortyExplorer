// StateViews.swift - Pantallas de carga y de error

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView("Cargando personajes…")
            .controlSize(.large)
    }
}

// Vista reutilizable, recibe la acción de reintentar desde afuera
struct ErrorView: View {
    let error: APIError
    let retry: () -> Void

    var body: some View {
        ContentUnavailableView {
            Label("No se pudieron cargar los personajes", systemImage: error.icon)
        } description: {
            Text(error.message)
        } actions: {
            Button("Reintentar", action: retry)
                .buttonStyle(.borderedProminent)
        }
    }
}
