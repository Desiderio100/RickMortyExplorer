// Theme.swift - Color de acento y estilo de tarjeta de la app

import SwiftUI

extension Color {
    static let portal = Color(red: 0.16, green: 0.66, blue: 0.27)
}

extension View {
    //El estilo de tarjeta se define una vez y lo usan las dos listas
    func cardRow() -> some View {
        self
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
            .listRowBackground(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.secondarySystemGroupedBackground))
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
            )
    }
}
