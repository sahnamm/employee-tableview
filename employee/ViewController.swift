//
//  ViewController.swift
//  employee
//
//  Created by Sahna Melly Marselina on 01/03/23.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties

    var emps: [Employee] = []

    @IBOutlet var nameTF: UITextField!
    @IBOutlet var ageTF: UITextField!
    @IBOutlet var occupationTF: UITextField!
    @IBOutlet var viewListButton: UIButton!

    // MARK: Life Cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewListButton.setTitle("View List (\(emps.count))", for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Action

    @IBAction func submitOnClick(_ sender: UIButton) {
        performSegue(withIdentifier: "goToPreview", sender: populateData())
    }

    @IBAction func viewListOnClick(_ sender: UIButton) {
        performSegue(withIdentifier: "goToList", sender: emps)
    }

    @IBAction func unwindToHome(_ sender: UIStoryboardSegue) {
        // add to array
        if let data = populateData() {
            emps.append(data)
        }
    }

    // MARK: Private Method

    private func populateData() -> Employee? {
        guard let name = nameTF.text, name != "" else {
            fatalError("Name is missing")
        }

        guard let oc = occupationTF.text, oc != "" else {
            fatalError("Occupation is missing")
        }

        let employee = Employee(name: name, age: ageTF.text, occupation: oc)
        return employee
    }

    // MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if let vc = segue.destination as? PreviewViewController, let data = sender as? Employee {
            vc.emp = data
            vc.isHideButton = false
        } else if let vc = segue.destination as? EmployeeTableViewController, let data = sender as? [Employee] {
            vc.data = data
        }
    }
}
