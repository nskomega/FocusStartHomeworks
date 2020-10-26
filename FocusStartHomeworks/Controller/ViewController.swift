//
//  ViewController.swift
//  FocusStartHomeworks
//
//  Created by Mikhail Danilov on 18.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    private var typs: [Body] = [.none, .jeep, .sedan, .cupe, .universal]
    private var cars: [Car]?
    private var carsFilter: [Car]?
    
    @IBOutlet weak var panelView: UIView!
    @IBOutlet weak var pikerType: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        panelView.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        pikerType.delegate = self
        pikerType.dataSource = self
    }
    
    @IBAction func tapCarEditVC(_ sender: Any) {
        showEditCarView(car: nil, selectIndex: 0)
    }
    
    @IBAction func tapfilter(_ sender: Any) {
        panelView.isHidden = false
    }
    
    @IBAction func tapSelectType(_ sender: Any) {
        panelView.isHidden = true
    }
    func showEditCarView(car: Car?, selectIndex: Int) {
        let subCatVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditCarViewController") as! EditCarViewController
        subCatVC.setConfig(car: car, selectIndex: selectIndex)
        subCatVC.delegate = self
        self.navigationController?.pushViewController(subCatVC, animated: true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let car = carsFilter?[indexPath.row] {
            showEditCarView(car: car, selectIndex: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("cars?.count>",carsFilter?.count)
        return carsFilter?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let car = carsFilter?[indexPath.row] {
            print("car.model>", car.model)
            let type = car.body.rawValue
            var title = car.manufacturer + " " + car.model + " " + type
            
            if car.yearOfIssue == 0 {
                title = title + " -"
            } else {
                let years = String(car.yearOfIssue ?? 0) ?? "-"
                title = title + " " + years
            }
            if car.carNumber?.count != 0 {
                let number = car.carNumber ?? ""
                title = title + " " + number
            }
            cell.textLabel?.text = title
        }
        
        
        return cell
    }
}

extension ViewController: EditCarViewControllerDelegate {
    
    func updateCar(car: Car, index: Int) {
        cars?[index] = car
        tableView.reloadData()
        carsFilter = cars
    }
    
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
        carsFilter = cars
        tableView.reloadData()
    }
}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typs.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typs[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if let selectType = Body(rawValue: typs[row].rawValue), let cars = cars {
            if selectType == .none {
              carsFilter = cars
              tableView.reloadData()
            } else {
                carsFilter?.removeAll()
                for car in cars {
                    if car.body == selectType {
                        carsFilter?.append(car)
                    }
                }
                tableView.reloadData()
            }
        }
    }
}
