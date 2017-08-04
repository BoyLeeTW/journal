//
//  ViewController.swift
//  Journal
//
//  Created by Brad on 04/08/2017.
//  Copyright © 2017 Brad. All rights reserved.
//

import UIKit

class JourneyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var journeyListTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {

        return 2

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section {

        case 0:

            return 1

        default :

            return 1

        }

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {

            self.journeyListTableView.estimatedRowHeight = 200.00

            self.journeyListTableView.rowHeight = UITableViewAutomaticDimension

            switch indexPath.section {

            case 0:

                let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)

                return cell

            default:

                let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell", for: indexPath)

                return cell

            }

    }

}
