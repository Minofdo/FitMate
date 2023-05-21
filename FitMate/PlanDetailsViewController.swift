//
//  PlanDetailsViewController.swift
//  FitMate
//
//  Created by Minoli Fernando on 2023-05-21.
//

import UIKit

class PlanDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ExerciseDelegate {
    
    let tableView = UITableView()
    let cellId = "planDetCellId"
    
    var exerciseList :[Exercise] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .purple
        appearance.shadowColor = .clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        setUpView()
    }
    
    func setUpView() {
        tableView.backgroundColor = .purple
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ExerciseTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.showsVerticalScrollIndicator = true
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
        tableView.rowHeight = 150
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Select Plan", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        button.backgroundColor = .systemPink.withAlphaComponent(0.5)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(saveDataAndSchedule), for: .touchUpInside)
        
        view.addSubview(tableView)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 160),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -10)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exerciseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ExerciseTableViewCell
        cell.backgroundColor = .clear
        cell.delegate = self
        cell.exercise = exerciseList[indexPath.row]
        ImageFetcher.fetchExerciseImage(exerciseList[indexPath.row].thumbnail){ (image) in
            if let img = image {
                cell.imageObj = img
            }
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func didPressRow(sender: Exercise){
//        let planDetailView = PlanDetailsViewController()
//        planDetailView.title = "Plan Details"
//        navigationController?.pushViewController(planDetailView, animated: true)
    }
    
    @objc func saveDataAndSchedule() {
        // TODO: Save selected plan
        navigationController?.pushViewController(TrainingScheduleViewController(), animated: true)
    }

}
