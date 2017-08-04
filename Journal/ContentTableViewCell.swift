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

    var selectedRow = Int()

    @IBOutlet private(set) weak var circleOfSeperator: UIView!

    @IBOutlet private(set) weak var journeyImageView: UIImageView!

    @IBOutlet private(set) weak var journeyTitleLabel: UILabel!

    @IBOutlet private(set) weak var shadowView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpCircleOfSeperator()

        setUpJourneyImage()

        setUpShadowView()

    }

    private func setUpCircleOfSeperator() {

        let circleView = circleOfSeperator!

        circleView.backgroundColor = UIColor.white

        circleView.layer.borderColor = UIColor(red: 171/255, green: 179/255, blue: 176/255, alpha: 1.0).cgColor

        circleView.layer.borderWidth = 1

        circleView.layer.cornerRadius = circleView.frame.width/2

    }

    private func setUpShadowView() {

        let view = shadowView!

        view.layer.backgroundColor = UIColor.white.cgColor

        view.layer.shadowColor = UIColor.black.cgColor

        view.layer.shadowOffset = CGSize(width: 0, height: 0)

        view.layer.shadowRadius = 4

        view.layer.shadowOpacity = 0.3

        view.layer.cornerRadius = 8

    }

    private func setUpJourneyImage() {

        let imageView = journeyImageView!

        imageView.contentMode = .scaleAspectFill

        imageView.layer.cornerRadius = 8

    }

}
