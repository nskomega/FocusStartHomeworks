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
}

class EditCarViewController: UIViewController {

    @IBOutlet weak var manufacturerText: UITextField!
    @IBOutlet weak var modelText: UITextField!
    @IBOutlet weak var yearOfIssueText: UITextField!
    @IBOutlet weak var carNumberText: UITextField!
    
    @IBOutlet weak var typePikerView: UIPickerView!
    var car: Car?
    var delegate: EditCarViewControllerDelegate?
    
    var typs:[String] = ["Выберите тип кузова", Body.none.rawValue, Body.jeep.rawValue, Body.sedan.rawValue, Body.cupe.rawValue, Body.universal.rawValue]
    var selectType = Body.none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let car = car {
            manufacturerText.text = car.manufacturer
            modelText.text = car.model
//            bodyText.text = car.body
            yearOfIssueText.text = String(car.yearOfIssue)
            carNumberText.text = car.carNumber
        }
        
        
        typePikerView.delegate = self
        typePikerView.dataSource = self
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        let manufacturer = manufacturerText.text ?? ""
        let model = modelText.text ?? ""
        let yearOfIssue: Int = Int(yearOfIssueText.text ?? "0") ?? 0
        let cardNumber = carNumberText.text ?? ""
        
        if selectType != .none {
            let newCar = Car(manufacturer: manufacturer, model: model, body: selectType, yearOfIssue: yearOfIssue, carNumber: cardNumber)
            car = newCar
            delegate?.addNewCar(car: newCar)
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
        return typs[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        selectType = Body(rawValue: typs[row]) ?? Body.none
    }
}
