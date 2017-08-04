//
//  ContentTableViewCell.swift
//  Journal
//
//  Created by Brad on 04/08/2017.
//  Copyright © 2017 Brad. All rights reserved.
//

import UIKit
import CoreData

class ContentTableViewCell: UITableViewCell {
    @IBOutlet private(set) weak var circleOfSeperator: UIView!

    @IBOutlet weak var journeyImageView: UIImageView!

    @IBOutlet weak var journeyTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpCircleOfSeperator()

        setUpJourneyImage()

    }

    private func setUpCircleOfSeperator() {

        let circleView = circleOfSeperator!

        circleView.backgroundColor = UIColor.white

        circleView.layer.borderColor = UIColor(red: 171/255, green: 179/255, blue: 176/255, alpha: 1.0).cgColor

        circleView.layer.borderWidth = 1

        circleView.layer.cornerRadius = circleView.frame.width/2

    }

    private func setUpJourneyImage() {

        let imageView = journeyImageView!

        imageView.backgroundColor = UIColor.clear

        imageView.layer.shadowColor = UIColor.black.cgColor

        imageView.layer.shadowOffset = CGSize(width: -1, height: -0.5)

        imageView.layer.shadowRadius = 1.5

        imageView.layer.shadowOpacity = 0.3

        imageView.layer.cornerRadius = 8

        imageView.contentMode = .scaleAspectFill
    }

}
