//
//  DimoTransfersVC.swift
//  WhiteLabel
//
//  Created by MIGUEL MEXICANO HERRERA on 18/04/23.
//  Copyright © 2023 Banregio. All rights reserved.
//
import Foundation
import UIKit
class JSDimoTransfersVC: UIViewController {
    var presenter: DimoTransfersPresenterProtocol?
    var dataSource: [DimoTransferData] = [
        DimoTransferData(title: "Ale Seguros *2834", description: "Celular"),
        DimoTransferData(title: "Ana García *0070", description: "Celular"),
        DimoTransferData(title: "Claudia Villarreal *9239", description: "Celular"),
        DimoTransferData(title: "Enedelia *9239", description: "Celular")
    ]
    lazy var searchBar: UISearchBar = {
        var searchBar = UISearchBar()
        searchBar.placeholder = "Buscar"
        searchBar.delegate = self
        searchBar.barTintColor = .systemBackground
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    lazy var newTransferButton: UIButton = {
        var button = UIButton(type: .custom)
        button.contentHorizontalAlignment = .left
        button.setTitle("Nueva Transferencia", for: .normal)
        button.setImage(UIImage(named: "ic_transfer_add_black"), for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemBackground
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.registerHeader(DimoTransferHeader.self)
        tableView.registerFile(DimoTransfersCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getData()
    }
    func setupView() {
        self.view.backgroundColor = .systemBackground
        setNavBar()
        addSubviews()
        setupConstraints()
    }
    func getData() {
        presenter?.getData()
    }
    /// Function for add views and subview in superview
    func addSubviews() {
        self.view.addSubviews(searchBar, newTransferButton)
        self.view.addSubview(tableView)
    }
    ///  Function for add constraints to superview and subviews
    func setupConstraints() {
        searchBar.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
        searchBar.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 12).isActive = true
        searchBar.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -12).isActive = true
        newTransferButton.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor, constant: 10).isActive = true
        newTransferButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        newTransferButton.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        newTransferButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        tableView.topAnchor.constraint(equalTo: self.newTransferButton.bottomAnchor, constant: -22).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    private func setupSearchBar() {
        let toolBarSearch = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 44))
        toolBarSearch.barStyle = .default
        toolBarSearch.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(title: "Close",
                                         style: .plain, target: self, action: #selector(doneToolbarTapped))
        doneButton.tintColor = .red
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBarSearch.setItems([space, doneButton], animated: false)
        searchBar.inputAccessoryView = toolBarSearch
    }
    private func setNavBar() {
        self.title = "Transferencias"
        navigationController?.navigationBar.shadowImage = UIImage()
        let btnBack = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .done, target: self, action: #selector(sendBack))
        navigationController?.navigationBar.tintColor = .white
        self.navigationItem.leftBarButtonItem = btnBack
        let imageCustom = UIImage(named: "ic_settings")?.withRenderingMode(.alwaysTemplate)
        let imgView = UIImageView.init(image: imageCustom)
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: imgView.image, style: .plain, target: self, action: #selector(showSettingsView))
    }
    @objc func sendBack() {
        self.dismiss(animated: true, completion: nil)
    }
    @objc func showSettingsView() {
    }
    @objc fileprivate func doneToolbarTapped() {
    }
}
/// Protocolo para recibir datos del presenter.
extension JSDimoTransfersVC: DimoTransfersViewProtocol {
}
extension JSDimoTransfersVC: UISearchBarDelegate {
}
extension JSDimoTransfersVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (action, sourceView, completionHandler) in

        } // end
        let editAction = UIContextualAction(style: .normal, title: "Edit") {
            (action, sourceView, completionHandler) in
        }
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        // Delete should not delete automatically
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        
        return swipeConfiguration
    }
}
extension JSDimoTransfersVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as DimoTransfersCell
        let data = dataSource[indexPath.row]
        cell.setupCell(data: data)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title = "Cuentas favoritas"
        let header = tableView.dequeueReusableHeaderFooterView() as DimoTransferHeader
        header.setupView(title: title)
        return header
    }
}
