//
//  PictureTableViewCell.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 23..
//

import UIKit

protocol UserPictureTableViewCellDelegate: UIViewController {
    func imageSelected(_ image: UIImage)
}

struct UserPictureTableViewCellConfig {
    let image: String
}

class UserPictureTableViewCell: UITableViewCell {
    @IBOutlet weak var imageVIew: UIImageView!
    weak var delegate: UserPictureTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with config: UserPictureTableViewCellConfig) {
        if let imageData = Data(base64Encoded: config.image),
           let image = UIImage(data: imageData) {
            imageVIew.image = image
        }
    }
    @IBAction func imageViewTapped(_ sender: UITapGestureRecognizer) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            delegate?.present(imagePickerController, animated: true, completion: nil)
        }
    }
}

extension UserPictureTableViewCell: NibLoadableView { }

extension UserPictureTableViewCell: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        delegate?.dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else { return }
        delegate?.imageSelected(image)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        delegate?.dismiss(animated: true, completion: nil)
    }
}
