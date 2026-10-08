// CharacterImageView.swift - Imagen del personaje con su estado de carga

import SwiftUI

// Se reutiliza en la lista y en el detalle
struct CharacterImageView: View {
    let url: URL

    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                Image(systemName: "photo")
                    .font(.title)
                    .foregroundStyle(.secondary)
            default:
                // Estado de carga de la imagen
                ProgressView()
            }
        }
        .background(Color(.secondarySystemBackground))
    }
}
