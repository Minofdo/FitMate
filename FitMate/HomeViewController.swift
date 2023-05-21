//
//  HomeViewController.swift
//  FitMate
//
//  Created by Minoli Fernando on 2023-05-19.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.viewControllers = [self]
        
        view.backgroundColor = .red
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .purple
        appearance.shadowColor = .clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

}
