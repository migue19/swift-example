//
//  DimoTransfersCell.swift
//  WhiteLabel
//
//  Created by MIGUEL MEXICANO HERRERA on 21/04/23.
//  Copyright © 2023 Banregio. All rights reserved.
//

import UIKit
// swiftlint:disable trailing_whitespace
class DimoTransfersCell: UITableViewCell, ReusableView {
    private lazy var imageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_clock")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupAccessoryView()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        backgroundColor = .systemBackground
        selectionStyle = .none
        contentView.addSubviews(imageIcon, titleLabel, descriptionLabel)
    }
    private func setupConstraints() {
        imageIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        imageIcon.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        imageIcon.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageIcon.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: imageIcon.rightAnchor, constant: 12).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: imageIcon.rightAnchor, constant: 12).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
    /// Function for build to cell
    /// - Parameter data: Object with parameters for create cell e.j.: title, description
    func setupCell(data: DimoTransferData) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
    }
    /// Function for build to accesory view
    func setupAccessoryView() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 9, height: 18))
        imageView.image = UIImage(named: "ic_system_right_arrow")
        imageView.tintColor = UIColor(named: "IconsColor")
        imageView.contentMode = .scaleAspectFit
        self.accessoryView = imageView
    }
}
