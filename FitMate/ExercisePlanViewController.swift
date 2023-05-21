//
//  ExercisePlanViewController.swift
//  FitMate
//
//  Created by Minoli Fernando on 2023-05-20.
//

import UIKit

class ExercisePlanViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ExercisePlanDelegate {
    
    let tableView = UITableView()
    let cellId = "planCellId"
    var selectedGoal = "Muscle Build"
    var plans :[[Exercise]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Select Plan"
        setUpView()
        
        let type = String(selectedGoal.prefix(1));
        
        Firebase.getRandomPlans(type){ (plans) in
            if let plans = plans {
                self.plans = plans
                self.tableView.reloadData()
            } else {
                let errorAlert = UIAlertController(
                    title: "ERROR",
                    message: "Error occurred when retrieving data. Please try again later.", preferredStyle: .alert
                )
                errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(errorAlert, animated: true, completion: nil)
            }
        }
    }
    
    func setUpView() {
        view.backgroundColor = .purple
        tableView.backgroundColor = .purple
        navigationController?.navigationBar.isHidden = false
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .purple
        appearance.shadowColor = .clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.text = "Showing Plans for \(selectedGoal)"
        
        //tableView.backgroundColor = .purple
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ExercisePlanTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.showsVerticalScrollIndicator = true
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
        tableView.rowHeight = 150
        
        view.addSubview(label)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            label.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            label.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        plans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ExercisePlanTableViewCell
        cell.backgroundColor = .clear
        cell.delegate = self
        cell.index = indexPath.row
        cell.exercises = plans[indexPath.row]
        if (cell.image.image!.isSymbolImage) {
            ImageFetcher.fetchExerciseImage(plans[indexPath.row][0].thumbnail){ (image) in
                if let img = image {
                    cell.image.image = img
                    tableView.reloadData()
                }
            }
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func didPressRow(sender: [Exercise]){
        let planDetailView = PlanDetailsViewController()
        planDetailView.title = "Plan Details"
        navigationController?.pushViewController(planDetailView, animated: true)
    }
    
}
