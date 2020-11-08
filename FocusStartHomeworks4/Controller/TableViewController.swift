//
//  TableViewController.swift
//  FocusStartHomeworks4
//
//  Created by Mikhail Danilov on 05.11.2020.
//

import UIKit

protocol MyTableDelegte {
    func selectData(data: MyData)
}

class TableViewController: UITableViewController {

    var list = [MyData]()
    var delegate: MyTableDelegte?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list.append(MyData(title: "Россия выдала грабителя", subTitle: "МОСКВА, 7 ноя - РИА Новости. Россия выдала Италии злоумышленника", info: "17:25"))
        list.append(MyData(title: "СБУ завела дело на главу партии Шария за карту Украины без Крыма", subTitle: "МОСКВА, 7 ноя — РИА Новости. Депутат Верховной рады от ", info: "17:40"))
        list.append(MyData(title: "Белгородская ОНК готова", subTitle: "ЯРОСЛАВЛЬ, 7 ноя — РИА Новости. Общественная наблюдательная комиссия (ОНК) Белгородской области не владеет официальной информацией об этапировании в местную колонию Михаила Ефремова, осужденного за смертельное ДТП, но если это так и актеру потребуется помощь, то комиссия готова отреагировать, заявила РИА Новости председатель областной ОНК Наталья Сокольская", info: ""))
        list.append(MyData(title: "Россиянин рассказал", subTitle: "что происходит в отелях Доминиканы", info: "14:15"))
        list.append(MyData(title: "В Махачкале почти 40 ", subTitle: "", info: ""))
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("numberOfRowsInSection>", list.count)
        return list.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = list[indexPath.row]
        print("", data.title)
        delegate?.selectData(data: data)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomTableViewCell()

        print("CustomTableViewCell>", list.count)
        let data = list[indexPath.row]
        cell.setConfig(myData: data)
        
        return cell
    }
}
