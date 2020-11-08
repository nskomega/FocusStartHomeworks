//
//  CustomTableViewCell.swift
//  FocusStartHomeworks4
//
//  Created by Mikhail Danilov on 05.11.2020.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(24)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(18)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setConfig(myData: MyData) {
        print("myData.title>", myData.title)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        self.addSubview(infoLabel)
        
        self.backgroundColor = .lightGray
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        titleLabel.text = myData.title
        
        infoLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        infoLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8).isActive = true
        infoLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        if myData.info.isEmpty {
            infoLabel.widthAnchor.constraint(equalToConstant: 0).isActive = true
        } else {
            infoLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        }
        
        infoLabel.text = myData.info

        
        
        subTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8).isActive = true
        subTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: infoLabel.leftAnchor, constant: -16).isActive = true
        subTitleLabel.text = myData.subTitle
   
     
    }

}
