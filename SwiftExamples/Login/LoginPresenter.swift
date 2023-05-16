//
//  LoginPresenter.swift
//  SwiftExamples
//
//  Created by MIGUEL MEXICANO HERRERA on 10/05/23.
//  
//

import Foundation

class LoginPresenter {
    var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    var router: LoginRouterProtocol?
}
extension LoginPresenter: LoginPresenterProtocol {
}
extension LoginPresenter: LoginInteractorOutputProtocol {
}
