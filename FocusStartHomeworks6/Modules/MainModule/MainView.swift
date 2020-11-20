//
//  MainView.swift
//  FocusStartHomeworks5
//
//  Created by Mikhail Danilov on 20.11.2020.
//

import UIKit

class MainView: UIView {
    
    private enum Constants {
        static let mainButtonTitle = "+"
        static let anchor50: CGFloat = 50
        static let anchor16: CGFloat = 16
        static let anchor40: CGFloat = 40
    }
    
    private var viewModel: MainViewModelProtocol?
    private var cars = [Car]()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.mainButtonTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    func setup(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        self.backgroundColor = .white
        
        mainButton.addTarget(self, action: #selector(tapMainButton), for: .touchUpInside)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.newCar = { [weak self] car in
            self?.cars.append(car)
            self?.tableView.reloadData()
        }
        bulid()
    }
    
    @objc func tapMainButton() {
        viewModel?.tapMainButton()
    }
    
    func bulid() {
        self.addSubview(tableView)
        self.addSubview(mainButton)
        
        mainButton.widthAnchor.constraint(equalToConstant: Constants.anchor50).isActive = true
        mainButton.heightAnchor.constraint(equalToConstant: Constants.anchor50).isActive = true
        mainButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -Constants.anchor16).isActive = true
        mainButton.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.anchor40).isActive = true
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.mainButton.topAnchor, constant: Constants.anchor16).isActive = true
    }
}

extension MainView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if cars.count > indexPath.row {
            let car = cars[indexPath.row]
            cell.textLabel?.text = car.marka + "  " + car.model + "  " + car.gosNomer
        }
        return cell
    }
}
