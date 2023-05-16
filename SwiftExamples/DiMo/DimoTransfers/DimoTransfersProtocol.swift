//
//  DimoTransfersProtocol.swift
//  WhiteLabel
//
//  Created by MIGUEL MEXICANO HERRERA on 18/04/23.
//  Copyright © 2023 Banregio. All rights reserved.
//
/// Protocolo que define los métodos y atributos para el view de DimoTransfers
/// PRESENTER -> VIEW
protocol DimoTransfersViewProtocol {
}
/// Protocolo que define los métodos y atributos para el routing de DimoTransfers
/// PRESENTER -> ROUTING
protocol DimoTransfersRouterProtocol {
}
/// Protocolo que define los métodos y atributos para el Presenter de DimoTransfers
/// VIEW -> PRESENTER
protocol DimoTransfersPresenterProtocol {
    func getData()
}
/// Protocolo que define los métodos y atributos para el Interactor de DimoTransfers
/// PRESENTER -> INTERACTOR
protocol DimoTransfersInteractorInputProtocol {
    func requestData()
}
/// Protocolo que define los métodos y atributos para el Interactor de DimoTransfers
/// INTERACTOR -> PRESENTER
protocol DimoTransfersInteractorOutputProtocol {
    func receiveData()
    func sendError(message: String)
}
