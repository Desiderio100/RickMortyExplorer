// StatusBadge.swift - Etiqueta con el estado del personaje

import SwiftUI

struct StatusBadge: View {
    let character: ShowCharacter

    var body: some View {
        Label(character.statusText, systemImage: "circle.fill")
            .font(.caption.weight(.semibold))
            .foregroundStyle(color)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(color.opacity(0.15), in: Capsule())
    }

    private var color: Color {
        switch character.status {
        case "Alive": return .green
        case "Dead": return .red
        default: return .gray
        }
    }
}
