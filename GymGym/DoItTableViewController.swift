//
//  DoItTableViewController.swift
//  GymGym
//
//  Created by Anton Ratiy on 29.08.2022.
//

import UIKit

class DoItTableViewController: UITableViewController {

    @IBOutlet weak var table: UITableView!
     
    struct Gym {
        let title: String
        let imageName: String
    }
    
    let training: [Gym] = [
        Gym(title: "Груди", imageName: "arny1"),
        Gym(title: "Ноги", imageName: "arny2"),
        Gym(title: "Банка", imageName: "arny3"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: String(describing: CustomTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CustomTableViewCell.self))
        
    }
}

// MARK: - Table view data source
extension DoItTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return training.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gym = training[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "gymCell", for: indexPath) as! CustomTableViewCell
        cell.label.text = gym.title
        cell.iconImageView.image = UIImage (named: gym.imageName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 179
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}
