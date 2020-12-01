//
//  ViewController.swift
//  FocusStartHomeworks7
//
//  Created by Mikhail Danilov on 01.12.2020.
//

import UIKit

class MainViewController: UIViewController, ImageTableViewCellDelegate {

    private lazy var panelBarView: UIView = {
        let panelBar = UIView()
        panelBar.backgroundColor = .white
        panelBar.translatesAutoresizingMaskIntoConstraints = false
        
        return panelBar
    }()
    
    private lazy var urlTextfield: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .white
        textfield.borderStyle = .line
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        return textfield
    }()
    
    private lazy var loadImgButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .blue
        button.setTitle("load", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var line: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = .gray
        uiview.translatesAutoresizingMaskIntoConstraints = false
        
        return uiview
    }()
    
    
    private lazy var tableView: UITableView = {
        let uiTableView = UITableView()
        uiTableView.translatesAutoresizingMaskIntoConstraints = false
        
        return uiTableView
    }()
    
    var imageUrllist = [URL]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImgButton.addTarget(self, action: #selector(tapLoadButton), for: .touchUpInside)
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        
        view.addSubview(panelBarView)
        panelBarView.addSubview(urlTextfield)
        panelBarView.addSubview(loadImgButton)
        view.addSubview(line)
        view.addSubview(tableView)
        
        panelBarView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        panelBarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44).isActive = true
        panelBarView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        panelBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        loadImgButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        loadImgButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        loadImgButton.centerYAnchor.constraint(equalTo: panelBarView.centerYAnchor).isActive = true
        loadImgButton.rightAnchor.constraint(equalTo: panelBarView.rightAnchor, constant: -24).isActive = true
        
        urlTextfield.heightAnchor.constraint(equalToConstant: 30).isActive = true
        urlTextfield.centerYAnchor.constraint(equalTo: panelBarView.centerYAnchor).isActive = true
        urlTextfield.rightAnchor.constraint(equalTo: loadImgButton.leftAnchor, constant: -16).isActive = true
        urlTextfield.leftAnchor.constraint(equalTo: panelBarView.leftAnchor, constant: 24).isActive = true
        
        line.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        line.topAnchor.constraint(equalTo: panelBarView.bottomAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: line.bottomAnchor).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc func tapLoadButton() {
        if let text = urlTextfield.text , text.count > 0 {
            if let url = URL(string: text) {
                imageUrllist.append(url)
                tableView.reloadData()
                
            } else {
                showError(title: "Внимание!" , msg: "не действительный url адрес")
            }
        } else {
            showError(title: "Внимание!" , msg: "пусто урл")
        }
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return imageUrllist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ImageTableViewCell()
        cell.setConfig(url: imageUrllist[indexPath.row])
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
  
        return 100.0
    }
}

extension MainViewController {
    
    func remove(url: URL) {
        imageUrllist = imageUrllist.filter { $0 != url }
        tableView.reloadData()
    }
    
    func showError(title:String, msg: String) {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
            //print("You've pressed cancel");
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
