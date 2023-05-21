//
//  TrainingScheduleViewController.swift
//  FitMate
//
//  Created by Minoli Fernando on 2023-05-21.
//

import UIKit

class TrainingScheduleViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    let switchArray = [
        UISwitch(),
        UISwitch(),
        UISwitch(),
        UISwitch(),
        UISwitch(),
        UISwitch(),
        UISwitch()
    ]
    let dateArray = [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday"
    ]
    
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
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "We will send you notifications to remind your workout."
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        scrollView.addSubview(label)
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            label.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10),
            label.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            label.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
        ])
        
        for index in switchArray.indices {
            switchArray[index].translatesAutoresizingMaskIntoConstraints = false
            switchArray[index].isOn = true
            switchArray[index].layer.cornerRadius = (switchArray[index].frame.height / 2.0)
            switchArray[index].backgroundColor = .systemGray2
            switchArray[index].clipsToBounds = true
            switchArray[index].setOn(true, animated: false)
            scrollView.addSubview(switchArray[index])
            
            if (index % 2 == 0) {
                switchArray[index].leftAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
            } else {
                switchArray[index].leftAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            }
            if (index == 0) {
                switchArray[index].topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50).isActive = true
            } else {
                if (index % 2 == 0) {
                    switchArray[index].topAnchor.constraint(equalTo: switchArray[index-1].bottomAnchor, constant: 10).isActive = true
                } else {
                    switchArray[index].topAnchor.constraint(equalTo: switchArray[index-1].topAnchor).isActive = true
                }
            }
        }
        for index in dateArray.indices {
            let dateLabel = UILabel()
            dateLabel.translatesAutoresizingMaskIntoConstraints = false
            dateLabel.text = dateArray[index]
            dateLabel.textColor = .white
            dateLabel.font = .preferredFont(forTextStyle: .headline)
            scrollView.addSubview(dateLabel)
            
            dateLabel.leftAnchor.constraint(equalTo: switchArray[index].rightAnchor, constant: 10).isActive = true
            dateLabel.centerYAnchor.constraint(equalTo: switchArray[index].centerYAnchor).isActive = true
        }
        
        let testNotification = UIButton()
        testNotification.translatesAutoresizingMaskIntoConstraints = false
        testNotification.setTitle("Test Notification", for: .normal)
        testNotification.setTitleColor(.cyan, for: .normal)
        testNotification.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        scrollView.addSubview(testNotification)
        testNotification.addTarget(self, action: #selector(testNotificationFunc), for: .touchUpInside)
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save Schedule", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        button.backgroundColor = .systemPink.withAlphaComponent(0.5)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.layer.cornerRadius = 15
        //button.addTarget(self, action: #selector(saveDataAndSchedule), for: .touchUpInside)
        scrollView.addSubview(button)
        
        NSLayoutConstraint.activate([
            testNotification.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            testNotification.topAnchor.constraint(equalTo: switchArray.last!.bottomAnchor, constant: 50),
            
            button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            button.topAnchor.constraint(equalTo: testNotification.bottomAnchor, constant: 50),
            button.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50),
            button.widthAnchor.constraint(equalToConstant: 160),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func testNotificationFunc() {
        // https://www.hackingwithswift.com/books/ios-swiftui/scheduling-local-notifications
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.badge,.sound,.alert]) { granted, error in
            if error == nil {
                print("User permission is granted : \(granted)")
                if (!granted) {
                    DispatchQueue.main.async {
                        let errorAlert = UIAlertController(
                            title: "ERROR",
                            message: "Notification permissions are not granted.", preferredStyle: .alert
                        )
                        errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.present(errorAlert, animated: true, completion: nil)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    let errorAlert = UIAlertController(
                        title: "ERROR",
                        message: "Notification permissions are not granted.", preferredStyle: .alert
                    )
                    errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(errorAlert, animated: true, completion: nil)
                }
            }
        }
        //        Step-2 Create the notification content
        let content = UNMutableNotificationContent()
        content.title = "FitFlex"
        content.body = "Notification Works!"
        
        //        Step-3 Create the notification trigger
        let date = Date().addingTimeInterval(1)
        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        //       Step-4 Create a request
        let uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        //      Step-5 Register with Notification Center
        center.add(request) { error in
            if (error != nil) {
                DispatchQueue.main.async {
                    let errorAlert = UIAlertController(
                        title: "ERROR",
                        message: "Error occurred when displaying notification.", preferredStyle: .alert
                    )
                    errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(errorAlert, animated: true, completion: nil)
                }
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound, .banner])
    }
    
}
