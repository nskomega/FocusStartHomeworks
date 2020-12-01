//
//  ImageTableViewCell.swift
//  FocusStartHomeworks7
//
//  Created by Mikhail Danilov on 01.12.2020.
//

import UIKit
import Alamofire
import AlamofireImage

protocol ImageTableViewCellDelegate {
    func showError(title:String, msg: String)
    func remove(url: URL)
}

class ImageTableViewCell: UITableViewCell {

    private lazy var mainImageView: UIImageView = {
        let uiimageView = UIImageView()
        uiimageView.contentMode = .scaleAspectFit
        uiimageView.translatesAutoresizingMaskIntoConstraints = false
        
        return uiimageView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        return indicator
    }()
    
    var url: URL?
    var delegate: ImageTableViewCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setConfig(url: URL?) {
        
        self.addSubview(mainImageView)
        self.addSubview(activityIndicator)
        
        mainImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        mainImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mainImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        activityIndicator.widthAnchor.constraint(equalToConstant: 50).isActive = true
        activityIndicator.heightAnchor.constraint(equalToConstant: 50).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        activityIndicator.isHidden = true
        
        self.url = url
        loadImage()
    }

    func loadImage() {
        guard let url = url else { return }
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        AF.request(url.absoluteString).responseImage {  [weak self] response in
            debugPrint(response)
            print(response.request)
            print(response.response)
            debugPrint(response.result)

            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.isHidden = true
            
            if case .success(let image) = response.result {
                self?.mainImageView.image = image
                print("image downloaded: \(image)")
            }
            
            if case .failure(let error) = response.result {
                self?.delegate?.showError(title: "Внимание", msg: "не смогли загрузить")
                self?.delegate?.remove(url: url)
            }
            
        }
    }
}
