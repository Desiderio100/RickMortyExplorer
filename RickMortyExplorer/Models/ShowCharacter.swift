// ShowCharacter.swift - Modelo que refleja el JSON de la API

import Foundation

// Respuesta de GET /api/character: solo nos interesa la lista de resultados
struct CharacterResponse: Decodable {
    let results: [ShowCharacter]
}

// las propiedades se llaman igual que en el JSON, así no hacen falta CodingKeys
struct ShowCharacter: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Place
    let location: Place
    let image: URL
    let episode: [String]

    struct Place: Decodable, Hashable {
        let name: String
    }

    var statusText: String {
        switch status {
        case "Alive": return "Vivo"
        case "Dead": return "Muerto"
        default: return "Desconocido"
        }
    }

    var genderText: String {
        switch gender {
        case "Male": return "Masculino"
        case "Female": return "Femenino"
        case "Genderless": return "Sin género"
        default: return "Desconocido"
        }
    }
}
