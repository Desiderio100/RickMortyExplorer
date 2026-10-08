// CharacterRowView.swift - Fila de la lista: imagen, nombre, especie y estado

import SwiftUI

// Vista pequeña, solo recibe el personaje que va a mostrar
struct CharacterRowView: View {
    let character: ShowCharacter

    var body: some View {
        HStack(spacing: 14) {
            CharacterImageView(url: character.image)
                .frame(width: 64, height: 64)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading, spacing: 4) {
                Text(character.name)
                    .font(.headline)
                Text(character.species)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                StatusBadge(character: character)
            }
        }
        .padding(.vertical, 4)
    }
}
