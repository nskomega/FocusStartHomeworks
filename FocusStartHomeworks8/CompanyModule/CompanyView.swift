//
//  CompanyView.swift
//  FocusStartHomeworks8
//
//  Created by Mikhail Danilov on 06.12.2020.
//

import UIKit
import SnapKit
import RxSwift

class CompanyView: UIView {
    
    private var viewModel: CompanyViewModelProtocol?
    private let disposeBag = DisposeBag()
    
    // MARK: - Constants
    private enum Constants {
        static let labelSetTitleAccount = "Список компаний"
        static let addSetTitleButton = "+"
        static let labelTextSize20: CGFloat = 20
        static let constraint200: CGFloat = 200
        static let constraint250: CGFloat = 250
        static let constraint300: CGFloat = 300
        static let constraint400: CGFloat = 400
        static let constraint500: CGFloat = 500
        static let constraint30: CGFloat = 30
        static let constraint16: CGFloat = 16
        static let constraint8: CGFloat = 8
    }
    
    // MARK: - Subviews
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.labelSetTitleAccount
        label.textAlignment = .center
        label.textColor = .black
        label.font = label.font.withSize(Constants.labelTextSize20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.addSetTitleButton, for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    // MARK: Methods
    func setup(viewModel: CompanyViewModelProtocol) {
        self.viewModel = viewModel
        
        loadView()
        tableView.dataSource = self
        tableView.delegate = self
        
        addButton.rx.tap.subscribe(onNext: { [weak self] _ in
            self?.viewModel?.tapNewCompany()
        }).disposed(by: disposeBag)
        
        viewModel.companyListCount.asObservable()
            .subscribe(onNext: { [ weak self] count in
                print("companyListCount>", count)
                self?.tableView.reloadData()
            }).disposed(by: disposeBag)
    }
    
    func loadView() {
        self.addSubview(titleLabel)
        self.addSubview(tableView)
        self.addSubview(addButton)
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(40)
            $0.width.equalTo(Constants.constraint400)
            $0.height.equalTo(Constants.constraint30)
        }
        
        addButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.right.equalToSuperview().offset(-Constants.constraint16)
            $0.width.equalTo(Constants.constraint30)
            $0.height.equalTo(Constants.constraint30)
        }
        
        tableView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(addButton.snp.bottom).offset(Constants.constraint8)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

extension CompanyView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("viewModel?.companyList.count>", viewModel?.companyList.count)
        return viewModel?.companyList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CompanyTableViewCell()
      
        if let company = viewModel?.companyList[indexPath.row] {
            print("company.name>", company.name)
            cell.setConfig(compay: company)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // handle delete (by removing the data from your array and updating the tableview)
            guard let viewModel = viewModel else { return }
            
            let company = viewModel.companyList[indexPath.row]
            viewModel.deleteCompay(company: company, index: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        let company = viewModel.companyList[indexPath.row]
        viewModel.selectCompany(id: company.id)
    }
}
