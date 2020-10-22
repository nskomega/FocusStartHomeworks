//
//  ViewController.swift
//  FocusStartHomeworks
//
//  Created by Mikhail Danilov on 18.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var cars: [Car]?

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
        print("cars?.count>",cars?.count)
        return cars?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let car = cars?[indexPath.row] {
            print("car.model>", car.model)
            let type = car.body.rawValue
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
        }
        
        
        return cell
    }
}

extension ViewController: EditCarViewControllerDelegate {
    func reloadData() {
        print(#function)
        tableView.reloadData()
    }
    
    func addNewCar(car: Car) {
        print(#function)
        if cars == nil {
            cars = [car]
        } else {
            cars?.append(car)
        }
        tableView.reloadData()
    }
}
