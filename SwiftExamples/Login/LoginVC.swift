//
//  LoginVC.swift
//  SwiftExamples
//
//  Created by MIGUEL MEXICANO HERRERA on 10/05/23.
//  
//

import Foundation
import UIKit

class LoginVC: UIViewController {
    var presenter: LoginPresenterProtocol?
    
    lazy var tapButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Tap", for: .normal)
        button.addTarget(self, action: #selector(tapButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.view.addSubview(tapButton)
        tapButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tapButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    @objc func tapButtonAction() {
        let dimo = JSDimoTransfersRouter()
        let navigation = UINavigationController(rootViewController: dimo.view)
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
}
/// Protocolo para recibir datos del presenter.
extension LoginVC: LoginViewProtocol {
}
