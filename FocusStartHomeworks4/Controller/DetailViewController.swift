//
//  DetailViewController.swift
//  FocusStartHomeworks4
//
//  Created by Mikhail Danilov on 05.11.2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isScrollEnabled = true
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mainImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .white
        imageview.image = UIImage(named: "211_icon")
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.layer.cornerRadius = 36
        imageview.clipsToBounds = true
        
        return imageview
    }()
    
    let secondImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .white
        imageview.image = UIImage(named: "219_icon")
        imageview.layer.cornerRadius = 56
        imageview.clipsToBounds = true
        
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

        
    }
    
    func setData(myData: MyData) {
        self.title = myData.title
        subTitleLabel.text = myData.subTitle
        secondImageView.isHidden = false
        mainImageView.isHidden = false

        subTitleLabel.setShadowEffect(color: .orange)
        mainImageView.setShadowEffect( color: .blue)
        secondImageView.setShadowEffect( color: .red)
    }
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(scrollView)
        scrollView.addSubview(subTitleLabel)
        scrollView.addSubview(mainImageView)
        scrollView.addSubview(secondImageView)
        
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
        
        subTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 44).isActive = true

        
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 320).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 320).isActive = true
        mainImageView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 44).isActive = true
        mainImageView.isHidden = true
        
        secondImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondImageView.widthAnchor.constraint(equalToConstant: 320).isActive = true
        secondImageView.heightAnchor.constraint(equalToConstant: 320).isActive = true
        secondImageView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 44).isActive = true
        secondImageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: -44).isActive = true
        secondImageView.isHidden = true
        
        self.view.backgroundColor = .white
    }
}

extension UIView {
 
    func setShadowEffect(x: CGFloat = 5, y: CGFloat = 10, color: UIColor, width: CGFloat = 10, opacity: Float = 1) {
        
        let shadowView = UIView()
        shadowView.backgroundColor = .yellow
        if let superView = self.superview {
            
            shadowView.translatesAutoresizingMaskIntoConstraints = false
            superView.insertSubview(shadowView, belowSubview: self)
            
            shadowView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            shadowView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            shadowView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
            shadowView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            shadowView.smoothShadow(shadowRadius: width, size: CGSize(width: x, height: y), color: color, cornerRadius: self.layer.cornerRadius)
            shadowView.backgroundColor = self.backgroundColor
            superView.layoutIfNeeded()
        }
    }
    
    func smoothShadow(shadowRadius: CGFloat, size: CGSize, color: UIColor, cornerRadius: CGFloat = 0) {
        print("color>", color)
        layer.cornerRadius = cornerRadius
        layer.shadowColor = color.cgColor
        layer.shadowOffset = size
        layer.shadowOpacity = 1
        layer.shadowRadius = shadowRadius
        clipsToBounds = true
        layer.masksToBounds = false
    }
}
