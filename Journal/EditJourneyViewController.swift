//
//  EditJourneyViewController.swift
//  Journal
//
//  Created by Brad on 04/08/2017.
//  Copyright © 2017 Brad. All rights reserved.
//

import UIKit

class EditJourneyViewController: UIViewController {

    @IBOutlet var editJourneyView: UIView!

    @IBOutlet private(set) weak var crossButton: UIButton!

    @IBOutlet private(set) weak var journeyImageView: UIImageView!

    @IBOutlet private(set) weak var journeyTitleTextField: UITextField!

    @IBOutlet private(set) weak var journeyContentTextView: UITextView!

    @IBOutlet private(set) weak var saveButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpSaveButton()

        setUpCrossButton()

    }

    private func setUpSaveButton() {

        let button  = saveButton!

        button.layer.cornerRadius = button.bounds.height/1.6

        button.layer.shadowOpacity = 0.25

        button.layer.shadowOffset = CGSize(width: -1, height: -1)

        button.layer.shadowColor = UIColor.black.cgColor

        button.layer.shadowRadius = 5

//        button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
    }

    private func setUpCrossButton() {

        let button = crossButton!

        button.addTarget(self, action: #selector(handleTouchCrossButton), for: .touchUpInside)

    }

    func handleTouchCrossButton() {

        self.dismiss(animated: true, completion: nil)

    }

    private func setUpImageView() {

        let imageView = journeyImageView!

    }

    override var preferredStatusBarStyle: UIStatusBarStyle {

        return .lightContent

    }
}
