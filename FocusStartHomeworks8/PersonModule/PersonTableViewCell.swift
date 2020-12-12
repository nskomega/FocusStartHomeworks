//
//  PersonTableViewCell.swift
//  FocusStartHomeworks8
//
//  Created by Mikhail Danilov on 06.12.2020.
//

import UIKit
import SnapKit

class PersonTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    private enum Constants {
        static let labelTextSize16: CGFloat = 16
        static let constraint200: CGFloat = 200
        static let constraint250: CGFloat = 250
        static let constraint30: CGFloat = 30
    }
    
    // MARK: - Subviews
    private let personNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = label.font.withSize(Constants.labelTextSize16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var person: Person?
    
    func setConfig(person: Person) {
        self.person = person
        print("setConfig>", person.name)
        
        personNameLabel.text = person.name + " " + String(person.age) + " " + String(person.workExperience) + " " + person.education + " " + person.position
        loadView()
    }
    
    func loadView() {
        self.addSubview(personNameLabel)
        
        personNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(Constants.constraint200)
            $0.height.equalTo(Constants.constraint30)
        }
    }
}
