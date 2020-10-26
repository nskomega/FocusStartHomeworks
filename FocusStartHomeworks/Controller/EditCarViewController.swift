//
//  EditCarViewController.swift
//  FocusStartHomeworks
//
//  Created by Mikhail Danilov on 18.10.2020.
//

import UIKit

protocol EditCarViewControllerDelegate {
    func reloadData()
    func addNewCar(car: Car)
    func updateCar(car: Car, index: Int)
}

class EditCarViewController: UIViewController {

    @IBOutlet weak var manufacturerText: UITextField!
    @IBOutlet weak var modelText: UITextField!
    @IBOutlet weak var yearOfIssueText: UITextField!
    @IBOutlet weak var carNumberText: UITextField!
    @IBOutlet weak var typePikerView: UIPickerView!
    
    private var car: Car?
    private var selectIndex = 0
    
    
    var delegate: EditCarViewControllerDelegate?
    
    private var typs: [Body] = [.none, .jeep, .sedan, .cupe, .universal]
    
    private var selectType = Body.none
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        typePikerView.delegate = self
        typePikerView.dataSource = self
        
        if let car = car  {
            manufacturerText.text = car.manufacturer
            modelText.text = car.model
            let years = String(car.yearOfIssue ?? 0)
            yearOfIssueText.text = years
            carNumberText.text = String(car.carNumber ?? "")
            
            if let index = self.typs.firstIndex(of: car.body) {
                self.typePikerView.selectRow(index, inComponent: 0, animated: true)
                self.selectType = self.typs[index]
            }
        }
    }
    
    func setConfig(car: Car?, selectIndex: Int) {
        self.car = car
        self.selectIndex = selectIndex
    }
    
    @IBAction func saveBtn(_ sender: Any) {

        if selectType != .none {
            let manufacturer = manufacturerText.text ?? ""
            let model = modelText.text ?? ""
            let yearOfIssue: Int = Int(yearOfIssueText.text ?? "0") ?? 0
            let cardNumber = carNumberText.text ?? ""
            
            
            let newCar = Car(manufacturer: manufacturer, model: model, body: selectType, yearOfIssue: yearOfIssue, carNumber: cardNumber)
            if car == nil {
                delegate?.addNewCar(car: newCar)
            } else {
                delegate?.updateCar(car: newCar, index: selectIndex)
            }
            
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension EditCarViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
        selectType = Body(rawValue: typs[row].rawValue) ?? Body.none
    }
}
