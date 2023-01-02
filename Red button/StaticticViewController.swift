//
//  StaticticViewController.swift
//  Red button
//
//  Created by Roman on 02.01.2023.
//

import UIKit

class StaticticViewController: UIViewController {
    // MARK: - Views
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingsTableViewCell")
        tableView.frame = CGRect.init(origin: .zero, size: view.frame.size)
        tableView.rowHeight = 40
        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Settings"


        setupHierarchy()
    }

    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    private func updateLayout(with size: CGSize) {
       tableView.frame = CGRect.init(origin: .zero, size: size)
    }

}

//  Добавление таблицы
extension StaticticViewController: UITableViewDataSource, UITableViewDelegate {




    // При выборе строки
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }

    // При момент до выбора строки (собираемся выбрать)
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 0 && indexPath.section == 0 {
            return nil
        }
        return indexPath
    }

    // Количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Количество ячеек в каждой секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dateList = UserDefaults.standard.dictionary(forKey: "List")

        return dateList?.count ?? 0
    }

    // Определение содержимого ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as! SettingsTableViewCell
        let savedArray = UserDefaults.standard.object(forKey: "List") as? [String: Int] ?? [String: Int]()

        let airportCodes = [String](savedArray.keys)
        let airportNames = [Int](savedArray.values)
        // Присвоение значений в ячейки
        var content = cell.defaultContentConfiguration()
        let cont: String = airportCodes[indexPath.row] + " ---- " + String(airportNames[indexPath.row])
        content.text = cont

        cell.contentConfiguration = content

        return cell
    }

    // Переход на нужное View
    func moveToSetttingView(_ pageName: String) {
        switch pageName{
        default:
            print("No page")
        }
    }

}

// Класс ячейки
class SettingsTableViewCell: UITableViewCell {
    // При повторном использовании
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
}
