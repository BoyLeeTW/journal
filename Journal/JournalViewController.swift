//
//  ViewController.swift
//  Journal
//
//  Created by Brad on 04/08/2017.
//  Copyright © 2017 Brad. All rights reserved.
//

import UIKit

class JournalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var journalListTableView: UITableView!

    let journalManager = JournalManager()

    var journal: [Journal] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchJournal()

    }

    override func viewWillAppear(_ animated: Bool) {

        fetchJournal()

    }

    func fetchJournal() {

        journal = journalManager.fetchData()

        self.journalListTableView.reloadData()

    }

    func numberOfSections(in tableView: UITableView) -> Int {

        return 2

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section {

        case 0:

            return 1

        default :

            return journal.count

        }

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {

            self.journalListTableView.estimatedRowHeight = 200.00

            self.journalListTableView.rowHeight = UITableViewAutomaticDimension

            switch indexPath.section {

            case 0:

                let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)

                cell.selectionStyle = UITableViewCellSelectionStyle.none

                return cell

            default:

                // swiftlint:disable force_cast
                let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell", for: indexPath) as! ContentTableViewCell

                guard let photoData = journal[indexPath.row].photo as? Data

                    else { return cell }
                // swiftlint:enable force_cast

                cell.journeyTitleLabel.text = journal[indexPath.row].title

                cell.journeyImageView.image = UIImage(data: photoData)

                return cell

            }

    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {

        if indexPath.section == 0 {

            return false

        } else {

            return true
        }

    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {

            journalManager.deleteJournal(indexPath: indexPath.row)

            fetchJournal()

            print("delete")

        }

    }

}
