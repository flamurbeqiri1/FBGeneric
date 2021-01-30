//
//  AuthenticationService.swift
//  FBGeneric
//
//  Created by Flamur Beqiri on 30.1.21.
//

import Foundation

public protocol AuthenticationService {
    var currentAuthData: AuthDataProtocol? { get }

    func logout(completion: @escaping (Result<Void>) -> Void)
    func login(username: String, password: String, completion: @escaping (Result<AuthDataProtocol>) -> Void)
    func signup(fullName: String, email: String, password: String, completion: @escaping (Result<Void>) -> Void)
    func askPasswordReset(email: String, completion: @escaping (Result<Void>) -> Void)
    func verifyPasswordResetCode(actionCode: String, completion: @escaping (Result<Void>) -> Void)
    func confirmPasswordReset(actionCode: String, newPassword: String, completion: @escaping (Result<Void>) -> Void)
    func changePasswordReset(newPassword: String, confirmPassword: String, completion: @escaping (Result<Void>) -> Void)
}

public extension AuthenticationService {
    var isAuthenticated: Bool { return currentAuthData != nil }

    func authHeader() -> [String: String] {
        guard let token = self.currentAuthData?.token else {
            fatalError("Must not be called if there is no token")
        }
        let header = ["Authorization": "Basic \(token)"]
        return header
    }
}

enum AuthenticationServiceError: String {
    case userNotLoggedIn = "Not logged in"
    case serverError = "Server Error."
    case emailExist = "E-Mail already exist."
    case emailOrPasswordIncorrect = "E-Mail/ Passwort wrong."
    case emailNotVerified = "E-mail not verified."
    case emailEmpty = "E-Mail field cannot be empty!"
    case usernameEmpty = "Username is empty"
    case emailNotValid = "Email is not valid."
    case passwordEmpty = "Passwortfeld field cannot be empty!"
    case passwordShort6Char = "Passwort cannot be shorter than 6 characters."
    case passwordConfirmNoMatch = "Passwords do not match!"
    case fullNameEmpty = "Field cannot be empty!"
}

extension AuthenticationServiceError: LocalizedError {
    public var errorDescription: String? {
        return rawValue
    }
}

enum AuthenticationServiceCustomError: Error {
    case runtimeError(String)
}

