// APIError.swift - Errores de red con un mensaje claro para el usuario

import Foundation

enum APIError: Error {
    case noConnection
    case serverError(code: Int)
    case unknown

    var message: String {
        switch self {
        case .noConnection:
            return "Sin conexión. Revisa tu internet e intenta de nuevo."
        case .serverError(let code):
            return "Error del servidor (código \(code)). Intenta más tarde."
        case .unknown:
            return "Algo salió mal. Intenta de nuevo."
        }
    }

    var icon: String {
        switch self {
        case .noConnection: return "wifi.slash"
        default: return "exclamationmark.triangle"
        }
    }
}
