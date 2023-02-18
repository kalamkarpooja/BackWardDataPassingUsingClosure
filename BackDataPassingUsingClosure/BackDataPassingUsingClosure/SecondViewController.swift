//
//  SecondViewController.swift
//  BackDataPassingUsingClosure
//
//  Created by Mac on 03/02/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var phoneNoTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    var studentInfo : ((Student)->Void)?
    var firstName : String = ""
    var city : String = ""
    var phoneNo : Int = 0
    var lastName : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func submitBtn(_ sender: Any) {
        firstName = firstNameTextField.text ?? "pooja"
        city = cityTextField.text ?? "pune"
        phoneNo = phoneNoTextField.text?.codingKey.intValue ?? 906776107
        lastName = lastNameTextField.text ?? "kalamkar"
        
        var studentObject = Student.init(firstName: firstName, city: city, lastName: lastName, phoneNo: Int(phoneNo))
        
        studentInfo?(studentObject)  //closure call
        
        navigationController?.popViewController(animated: true)
}
}






















