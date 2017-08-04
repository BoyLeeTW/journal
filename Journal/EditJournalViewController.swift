//
//  EditJourneyViewController.swift
//  Journal
//
//  Created by Brad on 04/08/2017.
//  Copyright © 2017 Brad. All rights reserved.
//

import UIKit

class EditJournalViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    @IBOutlet private(set) weak var crossButton: UIButton!

    @IBOutlet private(set) weak var journeyImageView: UIImageView!

    @IBOutlet private(set) weak var journeyTitleTextField: UITextField!

    @IBOutlet private(set) weak var journeyContentTextView: UITextView!

    @IBOutlet private(set) weak var saveButton: UIButton!

    @IBOutlet private(set) weak var journeyImageReminderLabel: UILabel!

    let imagePicker = UIImagePickerController()

    let journalManager = JournalManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpSaveButton()

        setUpCrossButton()

        setUpJourneyImageView()

    }

    override var preferredStatusBarStyle: UIStatusBarStyle {

        return .lightContent

    }

    private func setUpSaveButton() {

        let button  = saveButton!

        button.layer.cornerRadius = button.bounds.height/1.6

        button.layer.shadowOpacity = 0.25

        button.layer.shadowOffset = CGSize(width: -1, height: -1)

        button.layer.shadowColor = UIColor.black.cgColor

        button.layer.shadowRadius = 5

        button.addTarget(self, action: #selector(handleSaveButton), for: .touchUpInside)
    }

    func handleSaveButton() {

        guard
        let title = journeyTitleTextField.text,
        let content = journeyContentTextView.text,
        let photo = journeyImageView.image,
        let photoData = UIImagePNGRepresentation(photo)

            else {
                return
        }

        journalManager.addJournal(title: title, content: content, photo: photoData)

        self.dismiss(animated: true, completion: nil)

    }

    private func setUpCrossButton() {

        let button = crossButton!

        button.addTarget(self, action: #selector(handleTouchCrossButton), for: .touchUpInside)

    }

    func handleTouchCrossButton() {

        self.dismiss(animated: true, completion: nil)

    }

    private func setUpJourneyImageView() {

        let imageView = journeyImageView!

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapJournryImageView(sender: )))

        tapRecognizer.delegate = self

        imageView.addGestureRecognizer(tapRecognizer)

        imageView.isUserInteractionEnabled = true
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        self.dismiss(animated: true) { () -> Void in

            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {

                self.journeyImageView.image = image

                self.journeyImageView.contentMode = .scaleAspectFill

                self.journeyImageReminderLabel.isHidden = true

            } else {

                print("Something went wrong")

            }

        }

    }

    func handleTapJournryImageView(sender: UITapGestureRecognizer) {

        imagePicker.delegate = self

        imagePicker.sourceType = .photoLibrary

        self.present(imagePicker, animated: true)

    }

}
