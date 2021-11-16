//
//  AllEventsViewController.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 15..
//

import Foundation
import UIKit

protocol AllEventsView: BaseView {
    var presenter: AllEventsPresenterInput? { get set }
    func loadEventsData(_ presentationModel: AllEventsPresentationModel)
}

class AllEventsViewController: UIViewController {
    @IBOutlet weak var eventsTableView: UITableView!
    var presenter: AllEventsPresenterInput?
    private var presentationModel: AllEventsPresentationModel? {
        didSet {
            guard self.presentationModel != nil else { return }
            eventsTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.loadEventsData()
    }
    private func customizeViews() {
        customizeTableView()
    }
    private func customizeTableView() {
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        eventsTableView.registerCell(EventTableViewCell.self)
    }
    @IBAction func newEventButtonTapped(_ sender: UIButton) {
    }
}

extension AllEventsViewController: AllEventsView {
    func loadEventsData(_ presentationModel: AllEventsPresentationModel) {
        self.presentationModel = presentationModel
    }
}

extension AllEventsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presentationModel?.events.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EventTableViewCell = tableView.dequeueReusableCell()
        guard let event = presentationModel?.events[indexPath.row] else { return cell }
        cell.configure(with: EventTableViewCellConfig(title: event.title,
                                                      eventStart: event.startDate,
                                                      eventEnd: event.endDate,
                                                      isApplyable: event.isApplyable))
        return cell
    }
}

extension AllEventsViewController: UITableViewDelegate {
    
}