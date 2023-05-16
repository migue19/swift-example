//
//  DimoTransferHeader.swift
//  WhiteLabel
//
//  Created by MIGUEL MEXICANO HERRERA on 03/05/23.
//  Copyright © 2023 Banregio. All rights reserved.
//
import UIKit
class DimoTransferHeader: UITableViewHeaderFooterView, ReusableView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var imageButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "ic_favorite_start_all"), for: .normal)
        button.setTitle("test", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        contentView.addSubviews(imageButton, titleLabel)
        contentView.backgroundColor = .clear
    }
    func setupView(title: String) {
        titleLabel.text = title
    }
    private func setupConstraints() {
        imageButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        imageButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 17).isActive = true
        imageButton.widthAnchor.constraint(equalToConstant: 19).isActive = true
        imageButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 26).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -21).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: imageButton.rightAnchor, constant: 15).isActive = true
    }
}
