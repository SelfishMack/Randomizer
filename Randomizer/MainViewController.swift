//
//  ViewController.swift
//  Randomizer
//


import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    @IBOutlet var randomValueLabel: UILabel!
    @IBOutlet var getRandomNumberButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomNumberButton.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingsViewController else { return }
        settingVC.minimumValue = minimumValueLabel.text
        settingVC.maximumValue = maximumValueLabel.text
    }
    
    @IBAction func getRandomNumberButtonTapped() {
        let minNumValue = Int(String(minimumValueLabel.text ?? "0")) ?? 0
        let maxNumValue = Int(String(maximumValueLabel.text ?? "100")) ?? 100
        
        randomValueLabel.text = String(Int.random(in: minNumValue...maxNumValue))
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let settingVC = segue.source as? SettingsViewController else { return }
        minimumValueLabel.text = settingVC.minimumValueTF.text
        maximumValueLabel.text = settingVC.maximumValueTF.text
    }
}
