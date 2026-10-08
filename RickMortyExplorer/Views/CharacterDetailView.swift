// CharacterDetailView.swift - Nivel 2: detalle de un personaje

import SwiftUI

struct CharacterDetailView: View {
    let character: ShowCharacter
    @Environment(FavoritesStore.self) private var favorites

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                CharacterImageView(url: character.image)
                    .frame(width: 240, height: 240)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(
                        LinearGradient(colors: [.portal.opacity(0.45), .portal.opacity(0.05)], startPoint: .top, endPoint: .bottom),
                        in: RoundedRectangle(cornerRadius: 28)
                    )

                VStack(alignment: .leading, spacing: 8) {
                    Text(character.name)
                        .font(.largeTitle.bold())
                    StatusBadge(character: character)
                }

                VStack(spacing: 0) {
                    DetailRow(icon: "person.fill", title: "Especie", value: character.species)
                    Divider()
                    DetailRow(icon: "figure.dress.line.vertical.figure", title: "Género", value: character.genderText)
                    Divider()
                    DetailRow(icon: "globe.americas.fill", title: "Origen", value: character.origin.name)
                    Divider()
                    DetailRow(icon: "mappin.and.ellipse", title: "Ubicación", value: character.location.name)
                    Divider()
                    DetailRow(icon: "tv.fill", title: "Episodios", value: "\(character.episode.count)")
                }
                .background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 16))
            }
            .padding(20)
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                favorites.toggle(character)
            } label: {
                Image(systemName: favorites.isFavorite(character) ? "bookmark.fill" : "bookmark")
            }
        }
    }
}

// Clean Code: vista pequeña y reutilizable para cada dato del personaje
struct DetailRow: View {
    let icon: String
    let title: String
    let value: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(.tint)
                .frame(width: 24)
            Text(title)
                .foregroundStyle(.secondary)
            Spacer()
            Text(value)
                .fontWeight(.medium)
                .multilineTextAlignment(.trailing)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
}
