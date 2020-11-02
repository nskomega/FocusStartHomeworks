//
//  SecondView.swift
//  FocusStartHomeworks3
//
//  Created by Mikhail Danilov on 01.11.2020.
//

import UIKit

class InfoView: UIView {


    private enum Constants {
        static let screenHeight = UIScreen.main.bounds.height
        static let screenWidth = UIScreen.main.bounds.width
    }
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        
        scroll.isScrollEnabled = true
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "images")
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .green
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Заголовок"
        label.textAlignment = .center
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let infoTitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .orange
        label.text = "Много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста"
        label.textAlignment = .center
        label.textColor = .black
        label.font = label.font.withSize(24)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    func configure(isLandscape: Bool) {
        print("configure>isLandscape>", isLandscape)
        self.backgroundColor = .white
        self.frame.origin.y = 0
        self.frame.origin.x = 0
        self.frame.size.height = Constants.screenHeight
        self.frame.size.width = Constants.screenWidth
        print("self.frame.size.height>", self.frame.size.height)
        print("self.frame.size.width>" ,self.frame.size.width)
        
        self.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(infoTitleLabel)
        
        if isLandscape {
            scrollView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0.0).isActive = true
            scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0).isActive = true
            scrollView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0.0).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0).isActive = true
            
            imageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 8.0).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
            imageView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
            
            titleLabel.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 90).isActive = true
            titleLabel.topAnchor.constraint(equalTo:  self.scrollView.topAnchor, constant: 8).isActive = true
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            titleLabel.heightAnchor.constraint(equalToConstant: 90).isActive = true
            
            infoTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            infoTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
            infoTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            infoTitleLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
            
        } else {
            scrollView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0.0).isActive = true
            scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0).isActive = true
            scrollView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0.0).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0).isActive = true
            
            imageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 8.0).isActive = true
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            imageView.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16).isActive = true
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            infoTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            infoTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
            infoTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            infoTitleLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        }
        
    }
}
