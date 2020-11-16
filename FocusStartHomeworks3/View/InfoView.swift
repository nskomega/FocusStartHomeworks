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
        static let imageViewImage = "images"
        static let titleLabelText = "Заголовок"
        static let titleLabelFont = 25
        static let infoTitleLabelText = "Много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста много текста"
        static let infoTitleLabelFonts = 24
        static let infoTitleLabelNumberOfLines = 0
        static let topAnchor8: CGFloat = 8
        static let anchor90: CGFloat = 90
        static let topAnchor16: CGFloat = 16
        static let heightAnchor40: CGFloat = 40
        

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
        imageView.image = UIImage(named: Constants.imageViewImage)
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .green
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.titleLabelText
        label.textAlignment = .center
        label.textColor = .black
        label.font = label.font.withSize(CGFloat(Constants.titleLabelFont))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoTitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .orange
        label.text = Constants.infoTitleLabelText
        label.textAlignment = .center
        label.textColor = .black
        label.font = label.font.withSize(CGFloat(Constants.infoTitleLabelFonts))
        label.numberOfLines = Constants.infoTitleLabelNumberOfLines
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    func configure(isLandscape: Bool) {
        self.backgroundColor = .white
        
        self.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(infoTitleLabel)
        
        scrollView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        if isLandscape {
            imageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: Constants.topAnchor8).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: Constants.anchor90).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: Constants.anchor90).isActive = true
            imageView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
            
            titleLabel.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: Constants.anchor90).isActive = true
            titleLabel.topAnchor.constraint(equalTo:  self.scrollView.topAnchor, constant: Constants.topAnchor8).isActive = true
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.anchor90).isActive = true
            
        } else {
            imageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: Constants.topAnchor8).isActive = true
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            imageView.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.topAnchor16).isActive = true
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.heightAnchor40).isActive = true
        }
        
        infoTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        infoTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.topAnchor16).isActive = true
        infoTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        infoTitleLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
}
