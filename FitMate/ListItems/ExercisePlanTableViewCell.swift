//
//  ExercisePlanTableViewCell.swift
//  FitMate
//
//  Created by Minoli Fernando on 2023-05-20.
//

import UIKit

class ExercisePlanTableViewCell: UITableViewCell {
    
    let label = UILabel()
    
    var index :Int = 0 {
        didSet {
            label.text = "Plan \(index + 1)"
        }
    }
    var exercises :[Exercise] = [] {
        didSet {
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false;
        container.backgroundColor = .white.withAlphaComponent(0.85)
        container.layer.cornerRadius = 5
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = .boldSystemFont(ofSize: 30)
        
        contentView.addSubview(container)
        container.addSubview(label)

        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            //container.heightAnchor.constraint(equalToConstant: 300),
            
            label.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            label.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 5),
            
        ])
    }

}
