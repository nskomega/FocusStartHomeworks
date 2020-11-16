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
        static let titleLabelText = "titleLabel"
        static let titleLabelTextFontsSize: CGFloat = 14.0
        static let subTitleLabelText = "subTitleLabel subTitleLabel"
        static let subTitleLabelFontsName = "AppleSDGothicNeo-Thin"
        static let subTitleLabelFontsSize: CGFloat = 20.0
        static let infoTitleLabelText = "infoTitleLabel infoTitleLabel infoTitleLabel infoTitleLabel"
        static let infoTitleLabelFontsName = "HelveticaNeue-Thin"
        static let infoTitleLabelFontsSize: CGFloat = 24.0
        static let infoTitleLabelNumberOfLines = 2
        static let mainButtonTitle = "mainButton"
        static let mainButtonTitleBorderWidth: CGFloat = 1
        static let mainButtonCornerRadius: CGFloat = 30
        static let secondButtonTitle = "secondButton"
        static let anchor64: CGFloat = 64
        static let anchor60: CGFloat = 60
        static let anchor200: CGFloat = 200
        static let anchor30: CGFloat = 30
        static let anchor16: CGFloat = 16
        static let anchor24: CGFloat = 24
        static let anchor8: CGFloat = 8
        static let multiplier09: CGFloat = 0.9
        static let multiplier03: CGFloat = 0.3
        static let multiplier04: CGFloat = 0.4
    }

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.titleLabelText
        label.textAlignment = .center
        label.textColor = .black
        label.font = label.font.withSize(Constants.titleLabelTextFontsSize)
        return label
    }()

    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.subTitleLabelText
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: Constants.subTitleLabelFontsName, size: Constants.subTitleLabelFontsSize)
        return label
    }()
    
    private let infoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.infoTitleLabelText
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: Constants.infoTitleLabelFontsName, size: Constants.infoTitleLabelFontsSize)
        label.numberOfLines = Constants.infoTitleLabelNumberOfLines
        return label
    }()
    
    private let mainButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.mainButtonTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .purple
        button.layer.borderColor = UIColor.purple.cgColor
        button.layer.borderWidth = Constants.mainButtonTitleBorderWidth
        button.layer.cornerRadius = Constants.mainButtonCornerRadius
        return button
    }()
    
    private let secondButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.secondButtonTitle, for: .normal)
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
        
        self.addSubview(titleLabel)
        self.addSubview(imageView)
        imageView.addSubview(activityIndicatorView)
        self.addSubview(mainButton)
        self.addSubview(secondButton)
        self.addSubview(subTitleLabel)
        self.addSubview(infoTitleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.anchor64).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: Constants.multiplier09).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: Constants.anchor30).isActive = true
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.anchor16).isActive = true
        subTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        subTitleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: Constants.multiplier09).isActive = true
        subTitleLabel.heightAnchor.constraint(equalToConstant: Constants.anchor30).isActive = true
        
        infoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        infoTitleLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: Constants.anchor16).isActive = true
        infoTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        infoTitleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: Constants.multiplier09).isActive = true
        infoTitleLabel.heightAnchor.constraint(equalToConstant: Constants.anchor60).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.anchor64).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: Constants.multiplier03).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: Constants.multiplier03).isActive = true
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        activityIndicatorView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        activityIndicatorView.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: Constants.multiplier04).isActive = true
        activityIndicatorView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: Constants.multiplier04).isActive = true
        
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        mainButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -Constants.anchor24).isActive = true
        mainButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mainButton.widthAnchor.constraint(equalToConstant: Constants.anchor60).isActive = true
        mainButton.heightAnchor.constraint(equalToConstant: Constants.anchor60).isActive = true
        
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.topAnchor.constraint(equalTo: mainButton.bottomAnchor, constant: Constants.anchor8).isActive = true
        secondButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        secondButton.widthAnchor.constraint(equalToConstant: Constants.anchor200).isActive = true
        secondButton.heightAnchor.constraint(equalToConstant: Constants.anchor60).isActive = true
    }
}
