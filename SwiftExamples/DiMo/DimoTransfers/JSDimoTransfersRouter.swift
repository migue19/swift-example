//
//  DimoTransfersRouter.swift
//  WhiteLabel
//
//  Created by MIGUEL MEXICANO HERRERA on 18/04/23.
//  Copyright © 2023 Banregio. All rights reserved.
//
class JSDimoTransfersRouter {
    var view: JSDimoTransfersVC
    private var presenter: JSDimoTransfersPresenter
    private var interactor: JSDimoTransfersInteractor
    init() {
        self.view = JSDimoTransfersVC()
        self.presenter = JSDimoTransfersPresenter()
        self.interactor = JSDimoTransfersInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension JSDimoTransfersRouter: DimoTransfersRouterProtocol {
}
