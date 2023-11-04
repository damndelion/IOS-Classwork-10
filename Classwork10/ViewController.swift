//
//  ViewController.swift
//  Classwork10
//
//  Created by Daniar on 04.11.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private let names = ["Test Competition", "Test Competition 2", "Test Competition 3", "Test Competition 4", "Test Competition 5", "Test Competition 6", "Test Competition 7", "Test Competition 8", "Test Competition 9", "Test Competition 10", "Test Competition 11", "Test Competition 12", "Test Competition 13", "Test Competition 14", "Test Competition 15"]
    private let times = ["2023-11-1 - 2023-11-11", "2023-11-2 - 2023-11-12", "2023-11-3 - 2023-11-13", "2023-11-4 - 2023-11-14", "2023-11-5 - 2023-11-15", "2023-11-6 - 2023-11-16", "2023-11-17 - 2023-11-17", "2023-11-8 - 2023-11-18", "2023-11-9 - 2023-11-19", "2023-11-10 - 2023-11-20", "2023-11-11 - 2023-11-21", "2023-11-12 - 2023-11-22", "2023-11-13 - 2023-11-23", "2023-11-14 - 2023-11-24", "2023-11-15 - 2023-11-15"]
    private let lineColors = [".red", ".blue", ".green", ".yellow", ".red", ".green", ".red", ".yellow", ".green", ".red", ".blue", ".green", ".red", ".blue", ".green", ".blue", ".yellow", ".green"]
    private let timesLeft = ["10 days left", "Completed", "10 days left", "Completed", "Completed", "10 days left", "10 days left", "Completed", "10 days left", "10 days left", "10 days left", "Completed", "10 days left", "10 days left", "Completed"]
    private let sections = [""]
    
    private lazy var namesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NameTableViewCell.self, forCellReuseIdentifier: "NameTableViewCell")
        tableView.layer.borderColor = UIColor.white.cgColor
       
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        view.backgroundColor = .cyan
        namesTableView.dataSource = self
        namesTableView.delegate = self
        
        setupUI()
    }
    
    private lazy var wholeView: UIView = {
        let view = UIView()
        return view
      }()
    
   
    
}

//MARK: - Table view data source methods
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            names.count
        default:
            3
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameTableViewCell", for: indexPath) as! NameTableViewCell
        switch indexPath.section {
        case 0:
            cell.configure(name: names[indexPath.row], time: times[indexPath.row], timeLeft: timesLeft[indexPath.row], color: lineColors[indexPath.row])
        default:
            cell.configure(name: names[indexPath.row], time: times[indexPath.row], timeLeft: timesLeft[indexPath.row], color: lineColors[indexPath.row])
        }
        return cell
    }
}

//MARK: - Table view delegate methods
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        (view.window?.windowScene?.screen.bounds.height ?? 0) * 0.1
    }
}

// MARK: - UI setup methods
private extension ViewController {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(namesTableView)
    }
    
    func setupConstraints() {
        namesTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
