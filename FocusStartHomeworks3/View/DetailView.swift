//
//  ThirdView.swift
//  FocusStartHomeworks3
//
//  Created by Mikhail Danilov on 01.11.2020.
//

import UIKit

class DetailView: UIView {

    private enum Constants {
        static let screenHeight = UIScreen.main.bounds.height
        static let screenWidth = UIScreen.main.bounds.width
    }

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "titleLabel"
        label.textAlignment = .center
        label.textColor = .black
        label.font = label.font.withSize(14)
        return label
    }()

    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "subTitleLabel subTitleLabel"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 20.0)
        return label
    }()
    
    private let infoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "infoTitleLabel infoTitleLabel infoTitleLabel infoTitleLabel"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 24.0)
        label.numberOfLines = 2
        return label
    }()
    
    private let mainButton: UIButton = {
        let button = UIButton()
        button.setTitle("mainButton", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .purple
        button.layer.borderColor = UIColor.purple.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 30
        return button
    }()
    
    private let secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("secondButton", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        return button
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        return imageView
    }()

    private let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }()
    
    func configurate() {
        self.backgroundColor = .white
        
        self.frame.origin.y = 0
        self.frame.origin.x = 0
        self.frame.size.height = Constants.screenHeight
        self.frame.size.width = Constants.screenWidth
        self.addSubview(titleLabel)
        self.addSubview(imageView)
        imageView.addSubview(activityIndicatorView)
        self.addSubview(mainButton)
        self.addSubview(secondButton)
        self.addSubview(subTitleLabel)
        self.addSubview(infoTitleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 64).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        subTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        subTitleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        subTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        infoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        infoTitleLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 16).isActive = true
        infoTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        infoTitleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        infoTitleLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -64).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        activityIndicatorView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        activityIndicatorView.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.4).isActive = true
        activityIndicatorView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.4).isActive = true
        
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        mainButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -24).isActive = true
        mainButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mainButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        mainButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.topAnchor.constraint(equalTo: mainButton.bottomAnchor, constant: 8).isActive = true
        secondButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        secondButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        secondButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
}
