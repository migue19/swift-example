//
//  DimoTransfersPresenter.swift
//  WhiteLabel
//
//  Created by MIGUEL MEXICANO HERRERA on 18/04/23.
//  Copyright © 2023 Banregio. All rights reserved.
//
import Foundation
class JSDimoTransfersPresenter {
    var view: DimoTransfersViewProtocol?
    var interactor: DimoTransfersInteractorInputProtocol?
    var router: DimoTransfersRouterProtocol?
}
extension JSDimoTransfersPresenter: DimoTransfersPresenterProtocol {
    func getData() {
        interactor?.requestData()
    }
}
extension JSDimoTransfersPresenter: DimoTransfersInteractorOutputProtocol {
    func sendError(message: String) {
    }
    func receiveData() {
    }
}
