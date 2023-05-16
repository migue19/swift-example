//
//  LoginInteractor.swift
//  SwiftExamples
//
//  Created by MIGUEL MEXICANO HERRERA on 10/05/23.
//  
//

class LoginInteractor {
    var presenter: LoginInteractorOutputProtocol?
}
extension LoginInteractor: LoginInteractorInputProtocol {
}
