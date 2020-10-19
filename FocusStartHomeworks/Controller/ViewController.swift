//
//  ViewController.swift
//  FocusStartHomeworks
//
//  Created by Mikhail Danilov on 18.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var cars: [Car] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
    }
    
    @IBAction func tapCarEditVC(_ sender: Any) {
        let subCatVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditCarViewController") as! EditCarViewController
        //subCatVC.car = subCategory
        subCatVC.delegate = self
        self.navigationController?.pushViewController(subCatVC, animated: true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let car = cars[indexPath.row]
        let type = car.body?.rawValue ?? ""
        var title = car.manufacturer + " " + car.model + " " + type
        
        if car.yearOfIssue == 0 {
            title = title + " -"
        } else {
            title = title + " " + String(car.yearOfIssue)
        }
        if car.carNumber.count != 0 {
            title = title + " " + car.carNumber
        }
        
        cell.textLabel?.text = title
        return cell
    }
}

extension ViewController: EditCarViewControllerDelegate {
    func reloadData() {
        tableView.reloadData()
    }
    
    func addNewCar(car: Car) {
        cars.append(car)
        tableView.reloadData()
    }
}
