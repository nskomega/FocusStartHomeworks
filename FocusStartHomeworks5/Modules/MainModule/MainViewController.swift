//
//  MainViewController.swift
//  FocusStartHomeworks5
//
//  Created by Mikhail Danilov on 11.11.2020.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private var viewModel: MainViewModelProtocol?
    private var cars = [Car]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        print("viewDidLoad>")
    }
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(tableView)
        view.addSubview(mainButton)
        
        mainButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        mainButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        mainButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        mainButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.mainButton.topAnchor, constant: 16).isActive = true
    }
    
    func setup(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        self.viewModel?.delegate = self
        
        mainButton.addTarget(self, action: #selector(tapMainButton), for: .touchUpInside)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func tapMainButton() {
        viewModel?.tapMainButton()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let car = cars[indexPath.row]
        cell.textLabel?.text = car.marka + "  " + car.model + "  " + car.gosNomer
        return cell
    }
}

extension MainViewController: MainViewProtocol {
    
    func sendNewCar(car: Car) {
        cars.append(car)
        tableView.reloadData()
    }
}
