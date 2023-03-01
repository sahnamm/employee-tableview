//
//  PreviewViewController.swift
//  employee
//
//  Created by Sahna Melly Marselina on 01/03/23.
//

import UIKit

class PreviewViewController: UIViewController {
    // MARK: Properties

    var emp: Employee?
    var isHideButton: Bool?

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var occupationLabel: UILabel!
    @IBOutlet var saveButton: UIButton!

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: Private Method

    private func setupUI() {
        if let data = emp {
            imageView.image = UIImage(named: "user")
            nameLabel.text = data.name
            if let age = data.age, age != "" {
                ageLabel.text = age
            } else {
                ageLabel.text = "Unknown"
            }
            
            occupationLabel.text = data.occupation
        }

        saveButton.isHidden = isHideButton ?? false
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
