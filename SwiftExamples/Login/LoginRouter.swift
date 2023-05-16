//
//  LoginRouter.swift
//  SwiftExamples
//
//  Created by MIGUEL MEXICANO HERRERA on 10/05/23.
//  
//

class LoginRouter {
    var view: LoginVC
    private var presenter: LoginPresenter
    private var interactor: LoginInteractor
    init() {
        self.view = LoginVC()
        self.presenter = LoginPresenter()
        self.interactor = LoginInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension LoginRouter: LoginRouterProtocol {
}
