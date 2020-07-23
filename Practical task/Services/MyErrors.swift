//
//  MyErrors.swift
//  TopDriver
//
//  Created by Yoel Jimenez del Valle on 7/28/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import Foundation
enum MyErrors: Error{
    case invalidUser
    case invalidPassword
    case invalidUserAndPassword
    case invalidEmail
    case invalidRecoverApiMessage(message: String)
    case decodedFailed
    case tokenExpired
    case nodata
    
}
extension MyErrors:LocalizedError{
    var errorDescription: String?{
        switch self {
        case .invalidUser:
            return "El campo nombre de usuario no puede estar en vacia" //NSLocalizedString("Description of invalid username", comment: "El campo nombre de usuario no puede estar en vacia")//
        case .invalidPassword:
            return "La contraseña no puede estar vacia"
        case .invalidUserAndPassword:
            return "Usuario y contraseña no pueden estar vacios"
        case .invalidEmail:
            return "el email no es valido"
        case .invalidRecoverApiMessage(let message):
            return message
        case .decodedFailed:
            return "Respuesta incorrecta desde el servidor"
        case .tokenExpired:
            return "token expirado"
        case .nodata:
            return "No data"
        }
    }
}
