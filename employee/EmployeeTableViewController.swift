//
//  EmployeeTableViewController.swift
//  employee
//
//  Created by Sahna Melly Marselina on 01/03/23.
//

import UIKit

class EmployeeTableViewController: UIViewController {
    // MARK: Properties

    var data: [Employee]?

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()
    }

    // MARK: Private Method

    private func setupTableview() {
        tableView.delegate = self
        tableView.dataSource = self
        registerTableViewCell()
    }

    private func registerTableViewCell() {
        let cell = UINib(nibName: "EmployeeTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "empcell")
    }

    // MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if segue.identifier == "goToPreviewFromTable", let vc = segue.destination as? PreviewViewController, let data = sender as? Employee {
            vc.emp = data
            vc.isHideButton = true
        }
    }
}

extension EmployeeTableViewController: UITableViewDataSource {
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "empcell", for: indexPath) as! EmployeeTableViewCell

        cell.label.text = data?[indexPath.item].name
        cell.accoupationLabel.text = data?[indexPath.item].occupation
        if let age = data?[indexPath.item].age, age != "" {
            cell.ageLabel.text = "(\(age) yo)"
        } else {
            cell.ageLabel.text = "(Unknown yo)"
        }

        return cell
    }
}

extension EmployeeTableViewController: UITableViewDelegate {
    // MARK: Delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint("index \(indexPath.item)")
        performSegue(withIdentifier: "goToPreviewFromTable", sender: data?[indexPath.item])
    }
}
