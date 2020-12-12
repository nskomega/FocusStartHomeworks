//
//  CompanyTableViewCell.swift
//  FocusStartHomeworks8
//
//  Created by Mikhail Danilov on 06.12.2020.
//

import UIKit
import SnapKit

class CompanyTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    private enum Constants {
        static let labelTextSize16: CGFloat = 16
        static let constraint200: CGFloat = 200
        static let constraint250: CGFloat = 250
        static let constraint30: CGFloat = 30
    }
    
    // MARK: - Subviews
    private let companyLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .orange
        label.textColor = .black
        label.font = label.font.withSize(Constants.labelTextSize16)
        
        return label
    }()

    // MARK: - Property
    var company: Company?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadView() {
        self.addSubview(companyLabel)
        
        companyLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(Constants.constraint200)
            $0.height.equalTo(Constants.constraint30)
        }
    }
    
    func setConfig(compay: Company) {
        loadView()
        
        self.company = compay
        companyLabel.text = compay.name
    }
}
