//
//  CustomTableViewCell.swift
//  FocusStartHomeworks4
//
//  Created by Mikhail Danilov on 05.11.2020.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private enum Constants {
        static let titleLabelSize24: Int = 24
        static let titleLabelSize18: CGFloat = 18
        static let titleLabelSize20: CGFloat = 20
        static let titleLabelNumberOfLines: CGFloat = 0
        static let titleLabelAnchor16: CGFloat = 16
        static let titleLabelAnchor2: CGFloat = 2
        static let titleLabelAnchor8: CGFloat = 8
        static let titleLabelAnchor100: CGFloat = 100
        static let titleLabelAnchor0: CGFloat = 0
    }

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(CGFloat(Constants.titleLabelSize24))
        label.numberOfLines = Int(Constants.titleLabelNumberOfLines)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(Constants.titleLabelSize18)
        label.numberOfLines = Int(Constants.titleLabelNumberOfLines)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(Constants.titleLabelSize18)
        label.numberOfLines = Int(Constants.titleLabelNumberOfLines)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setConfig(news: News) {
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        self.addSubview(infoLabel)
        
        self.backgroundColor = .lightGray
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Constants.titleLabelAnchor16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -Constants.titleLabelAnchor16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.titleLabelAnchor2).isActive = true
        
        titleLabel.text = news.title
        
        infoLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -Constants.titleLabelAnchor16).isActive = true
        infoLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: Constants.titleLabelAnchor8).isActive = true
        infoLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        if news.info.isEmpty {
            infoLabel.widthAnchor.constraint(equalToConstant: Constants.titleLabelAnchor0).isActive = true
        } else {
            infoLabel.widthAnchor.constraint(equalToConstant: Constants.titleLabelAnchor100).isActive = true
        }
        
        infoLabel.text = news.info

        subTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Constants.titleLabelAnchor16).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: Constants.titleLabelAnchor8).isActive = true
        subTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: infoLabel.leftAnchor, constant: -Constants.titleLabelAnchor16).isActive = true
        subTitleLabel.text = news.subTitle
    }
}
