//
//  TableViewController.swift
//  FocusStartHomeworks4
//
//  Created by Mikhail Danilov on 05.11.2020.
//

import UIKit

protocol IMyTableDelegte {
    func show(news: News)
}

class TableViewController: UITableViewController {

    var list: [News] = [
        News(title: "Россия выдала грабителя", subTitle: "МОСКВА, 7 ноя - РИА Новости. Россия выдала Италии злоумышленника", info: "17:25",imgName: "pik1", imgName2: "pik2"),
        News(title: "СБУ завела дело на главу партии Шария за карту Украины без Крыма", subTitle: "МОСКВА, 7 ноя — РИА Новости. Депутат Верховной рады от ", info: "17:40",imgName: "pik2", imgName2: "pik6"),
        News(title: "Белгородская ОНК готова", subTitle: "ЯРОСЛАВЛЬ, 7 ноя — РИА Новости. Общественная наблюдательная комиссия (ОНК) Белгородской области не владеет официальной информацией об этапировании в местную колонию Михаила Ефремова, осужденного за смертельное ДТП, но если это так и актеру потребуется помощь, то комиссия готова отреагировать, заявила РИА Новости председатель областной ОНК Наталья Сокольская", info: "",imgName: "pik6", imgName2: "pik5"),
        News(title: "Россиянин рассказал", subTitle: "что происходит в отелях Доминиканы", info: "14:15",imgName: "pik3", imgName2: "pik1"),
        News(title: "В Махачкале почти 40 ", subTitle: "", info: "",imgName: "pik3", imgName2: "pik2")
    ]
    var delegate: IMyTableDelegte?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Новости"
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = list[indexPath.row]
        delegate?.show(news: news)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomTableViewCell()
        let news = list[indexPath.row]
        cell.setConfig(news: news)
        return cell
    }
}
