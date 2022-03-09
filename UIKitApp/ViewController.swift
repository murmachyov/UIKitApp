//
//  ViewController.swift
//  UIKitApp
//
//  Created by Murmachyov on 05.03.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var segmentetControl: UISegmentedControl!
    @IBOutlet var mainLablel: UILabel!
    @IBOutlet var slideer: UISlider!
    @IBOutlet var textFild: UITextField!
    @IBOutlet var datePiker: UIDatePicker!


    override func viewDidLoad() {
        super.viewDidLoad()

//        Leybl
        mainLablel.font = mainLablel.font.withSize(35)
        mainLablel.textAlignment = .center
        mainLablel.numberOfLines = 3


//        сегментированное управление
        segmentetControl.insertSegment(withTitle: "Third", at: 2, animated: false)

//        Slideer
        slideer.value = 1
        slideer.minimumValue = 0
        slideer.maximumValue = 1
        slideer.minimumTrackTintColor = .green
        slideer.maximumTrackTintColor = .yellow
        slideer.thumbTintColor = .purple
        mainLablel.text = String(slideer.value)

//        Date Piker
//    datePiker.locale = Locale.current
//        datePiker.locale = Locale(identifier: "ru_RU")

    }


    @IBAction func segmentedControlAction() {
        switch segmentetControl.selectedSegmentIndex {
            case 0:
                mainLablel.text = "The first segmented is selected"
                mainLablel.textColor = .white
            case 1:
                mainLablel.text = "The second segment is selected"
                mainLablel.textColor = .red
            default:
                mainLablel.text = "The third segment is selected"
                mainLablel.textColor = .blue
        }
    }
    

    @IBAction func sliderAction() {
        mainLablel.text = String(slideer.value)
        let sliderValue = CGFloat(slideer.value)
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(sliderValue)
    }

    @IBAction func daneButtonPressed() {
        guard let inputText = textFild.text, !inputText.isEmpty else {
            showAlert(with: "Text fild is empty", and: "Please enter your name")
            return
        }
        if let _ = Double(inputText) {
            showAlert(with: "Wrong format", and: "Please enter your name")
            return
        }

        mainLablel.text = textFild.text
        textFild.text = ""
    }

    @IBAction func chooseDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
//        dateFormatter.locale = Locale(identifier: "ru_RU")

        mainLablel.text = dateFormatter.string(from: datePiker.date)

    }

}

// MARK: - Private Methods
extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAktion = UIAlertAction(title: "Ok", style: .default) { _ in
            self.textFild.text = ""
        }
        alert.addAction(okAktion)
        present(alert, animated: true)
    }

}

