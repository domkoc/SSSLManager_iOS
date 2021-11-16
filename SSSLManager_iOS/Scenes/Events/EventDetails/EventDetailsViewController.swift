//
//  EventDetailsViewController.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 16..
//

import Foundation
import MapKit
import UIKit

protocol EventDetailsView: BaseView {
    var presenter: EventDetailsPresenterInput? { get set }
    func loadData(_ presentationModel: EventDetailsPresentationModel)
}

class EventDetailsViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationMapView: MKMapView!
    @IBOutlet weak var applyButton: UIButton!
    var presenter: EventDetailsPresenterInput?
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeViews()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.loadEventData()
    }
    private func customizeViews() {
        customizeApplyButton()
    }
    private func customizeApplyButton() {
        applyButton.setTitle("Apply", for: .normal)
        applyButton.setTitle("Not applyable", for: .disabled)
    }
    @IBAction func usernameButtonTapped(_ sender: UIButton) {
        presenter?.navigateToOrganizerProfile()
    }
    @IBAction func applyButtonTapped(_ sender: UIButton) {
    }
}

extension EventDetailsViewController: EventDetailsView {
    func loadData(_ presentationModel: EventDetailsPresentationModel) {
        titleLabel.text = presentationModel.event.title
        if let nickname = presentationModel.organizer?.nickname {
            usernameButton.setTitle(nickname, for: .normal)
        } else {
            usernameButton.setTitle(presentationModel.organizer?.fullname, for: .normal)
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateLabel.text = "\(dateFormatter.string(from: presentationModel.event.startDate)) - \(dateFormatter.string(from: presentationModel.event.endDate))"
        let annotation = MKPointAnnotation()
        let location = presentationModel.event.location.coordinate
        annotation.coordinate = location
        locationMapView.addAnnotation(annotation)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        locationMapView.setRegion(region, animated: true)
        applyButton.isEnabled = presentationModel.event.isApplyable
    }
}
