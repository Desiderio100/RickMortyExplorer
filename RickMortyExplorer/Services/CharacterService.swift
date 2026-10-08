// CharacterService.swift - Hace la petición GET a la API

import Foundation

// Clean Code: responsabilidad única, este archivo solo se comunica con la API
struct CharacterService {
    static let endpoint = "https://rickandmortyapi.com/api/character"

    func fetchCharacters() async throws -> [ShowCharacter] {
        guard let url = URL(string: Self.endpoint) else { throw APIError.unknown }

        // Manejo de errores: sin conexión, código HTTP y respuesta inválida
        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            if let http = response as? HTTPURLResponse, !(200...299).contains(http.statusCode) {
                throw APIError.serverError(code: http.statusCode)
            }

            return try JSONDecoder().decode(CharacterResponse.self, from: data).results
        } catch let error as APIError {
            throw error
        } catch let error as URLError {
            let offlineCodes: [URLError.Code] = [.notConnectedToInternet, .networkConnectionLost, .cannotFindHost, .cannotConnectToHost]
            throw offlineCodes.contains(error.code) ? APIError.noConnection : APIError.unknown
        } catch {
            throw APIError.unknown
        }
    }
}
