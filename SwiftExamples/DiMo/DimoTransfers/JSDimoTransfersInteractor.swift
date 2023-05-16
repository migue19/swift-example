//
//  DimoTransfersInteractor.swift
//  WhiteLabel
//
//  Created by MIGUEL MEXICANO HERRERA on 18/04/23.
//  Copyright © 2023 Banregio. All rights reserved.
//
/// Class with logic for favorite's screen
class JSDimoTransfersInteractor {
    var presenter: DimoTransfersInteractorOutputProtocol?
}
extension JSDimoTransfersInteractor: DimoTransfersInteractorInputProtocol {
    func requestData() {
        addFavorites()
    }
    func getFavorites() {
    }
    func addFavorites() {
    }
}
