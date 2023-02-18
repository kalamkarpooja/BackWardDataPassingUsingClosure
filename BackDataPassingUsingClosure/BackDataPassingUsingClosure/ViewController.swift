//
//  ViewController.swift
//  BackDataPassingUsingClosure
//
//  Created by Mac on 03/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studentTableView: UITableView!
    var secondViewController : SecondViewController = SecondViewController()
    var studentArray : [Student] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        studentTableView.delegate = self
        studentTableView.dataSource = self
        let uiNib = UINib(nibName: "StudentTableViewCell", bundle: nil)
        self.studentTableView.register(uiNib, forCellReuseIdentifier: "StudentTableViewCell")
    }

    @IBAction func addRecord(_ sender: Any) {
      secondViewController =   self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondViewController.studentInfo = {
            student in
            print(student)
            self.studentArray.append(student)
            self.studentTableView.reloadData()
        
            print("Name: \(student.firstName)","City: \(student.city)","phoneNO: \(student.phoneNo)","lastName:\(student.lastName)")
        }
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = self.studentTableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell") as! StudentTableViewCell
        
        let student = studentArray[indexPath.row]
        cell.firstNameLabel.text = student.firstName
        cell.cityLabel.text = student.city
        cell.phoneNoLabel.text = "\(student.phoneNo)"
        cell.lastNameLabel.text = student.lastName
        
                return cell
    }
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        108.0
    }
}
