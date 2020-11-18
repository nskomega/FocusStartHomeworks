//
//  DetailViewController.swift
//  FocusStartHomeworks4
//
//  Created by Mikhail Danilov on 05.11.2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    private enum Constants {
        static let topsubTitleLabel: CGFloat = 16
        static let topsubTitleLabelNumberOfLines: CGFloat = 0
        static let topmainImageView: CGFloat = 44
        static let widthImageView: CGFloat = 320
        static let cornerRadiusMainImageView: CGFloat = 36
        static let cornerRadiusSecondImageView: CGFloat = 56
    }
    
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isScrollEnabled = true
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(Constants.topsubTitleLabel)
        label.numberOfLines = Int(Constants.topsubTitleLabelNumberOfLines)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mainImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .white
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.layer.cornerRadius = Constants.cornerRadiusMainImageView
        imageview.clipsToBounds = true
        
        return imageview
    }()
    
    let secondImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .white
        imageview.layer.cornerRadius =  Constants.cornerRadiusSecondImageView
        imageview.clipsToBounds = true
        
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setData(news: News) {
        self.title = news.title
        self.navigationController?.navigationBar.tintColor = .orange
        
        subTitleLabel.text = news.subTitle

        if let img1 = UIImage(named: news.imgName) {
            mainImageView.image = img1
        }
        if let img2 = UIImage(named: news.imgName2) {
            secondImageView.image = img2
        }
    }
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(scrollView)
        scrollView.addSubview(subTitleLabel)
        scrollView.addSubview(mainImageView)
        scrollView.addSubview(secondImageView)
        
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        subTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.topsubTitleLabel).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.topsubTitleLabel).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Constants.topmainImageView).isActive = true

        
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: Constants.widthImageView).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: Constants.widthImageView).isActive = true
        mainImageView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: Constants.topmainImageView).isActive = true
        
        secondImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondImageView.widthAnchor.constraint(equalToConstant: Constants.widthImageView).isActive = true
        secondImageView.heightAnchor.constraint(equalToConstant: Constants.widthImageView).isActive = true
        secondImageView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: Constants.topmainImageView).isActive = true
        secondImageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: -Constants.topmainImageView).isActive = true
        
        subTitleLabel.setShadowEffect(color: .orange)
        mainImageView.setShadowEffect( color: .blue)
        secondImageView.setShadowEffect( color: .red)
        
        self.view.backgroundColor = .white
    }
}

extension UIView {
    
    private enum Constants {
        static let setShadowEffectCGFloat5: CGFloat = 5
        static let setShadowEffectCGFloat10: CGFloat = 10
        static let setShadowEffectCGFloat0: CGFloat = 0
        static let setShadowEffectCGFloat1: Float = 1
        static let layerShadowOpacity: Float = 1
    }
    
    func setShadowEffect(x: CGFloat = Constants.setShadowEffectCGFloat5, y: CGFloat = Constants.setShadowEffectCGFloat10, color: UIColor, width: CGFloat = Constants.setShadowEffectCGFloat10, opacity: Float = Constants.setShadowEffectCGFloat1) {
        
        let shadowView = UIView()
        shadowView.backgroundColor = .yellow
        if let superView = self.superview {
            
            shadowView.translatesAutoresizingMaskIntoConstraints = false
            superView.insertSubview(shadowView, belowSubview: self)
            
            shadowView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            shadowView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            shadowView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            shadowView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            shadowView.smoothShadow(shadowRadius: width, size: CGSize(width: x, height: y), color: color, cornerRadius: self.layer.cornerRadius)
            shadowView.backgroundColor = self.backgroundColor
            superView.layoutIfNeeded()
        }
    }
    
    func smoothShadow(shadowRadius: CGFloat, size: CGSize, color: UIColor, cornerRadius: CGFloat = Constants.setShadowEffectCGFloat0) {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = color.cgColor
        layer.shadowOffset = size
        layer.shadowOpacity = Constants.layerShadowOpacity
        layer.shadowRadius = shadowRadius
        clipsToBounds = true
        layer.masksToBounds = false
    }
}
