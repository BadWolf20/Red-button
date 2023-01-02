//
//  ButtonViewController.swift
//  Red button
//
//  Created by Roman on 02.01.2023.
//

import UIKit

class ButtonViewController: UIViewController {


    // MARK: - Views
    lazy var redButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Push", for: .normal)
        button.addTarget(self, action: #selector(headerButton), for: .touchUpInside)
        button.backgroundColor = .red
        button.setTitleColor(.green, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 50

        return button
    }()

    lazy var numLable: UILabel = {
        let label = UILabel()

        label.textColor = .red
        label.font = .systemFont(ofSize: 20,
                                 weight: .regular)
        label.textAlignment = .center

        let date = Date.now

        let stringDate =
        date.formatted(
            .iso8601
                .month()
                .day()
                .year()
                .dateSeparator(.dash)
        )
        var dateList = UserDefaults.standard.dictionary(forKey: "List")
        label.text = String((dateList?[stringDate] ?? 0) as! Int)
        return label
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {

        super.viewDidLoad()

        setupHierarchy()
        setupLayout()

    }

    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(numLable)
        view.addSubview(redButton)
    }

    private func setupLayout() {
        redButton.translatesAutoresizingMaskIntoConstraints = false
        redButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        redButton.widthAnchor.constraint(equalTo: redButton.heightAnchor).isActive = true
        redButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        numLable.translatesAutoresizingMaskIntoConstraints = false
        numLable.bottomAnchor.constraint(equalTo: redButton.topAnchor, constant: -30).isActive = true
        numLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true


    }

}

// MARK: - Functions
extension ButtonViewController {

    // Button actions
    @objc func headerButton() {
        let date = Date.now

        let stringDate =
        date.formatted(
            .iso8601
                .month()
                .day()
                .year()
                .dateSeparator(.dash)
        )

        let rot = (Int(numLable.text!) ?? 0) + 1
        numLable.text = String(rot)


        //UserDefaults.standard.set(rot, forKey: "Number")
        //UserDefaults.standard.removeObject(forKey: "Number")
        var dateList = UserDefaults.standard.dictionary(forKey: "List")
        dateList![stringDate] = rot
        UserDefaults.standard.set(dateList, forKey: "List")
    }

    // Functions


}

// MARK: - Constants

extension ButtonViewController {
    enum Colors {
        static let ColectionViewBackGround: UIColor = .orange
    }

    enum Metric {
        // SectionHeader
        static let headerHeight: CGFloat = 30
        // collectionView
        static let collectionViewTopIndent: CGFloat = 0
    }
}

