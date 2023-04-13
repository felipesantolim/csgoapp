//
//  FeedView.swift
//  App
//
//  Created by Felipe Santolim on 12/04/23.
//

import Foundation
import UIKit
import Lottie

protocol FeedViewDelegate {
    func didSelect(_ value: MatchModelElement)
    func fechMore()
}

class FeedView: UIView {
    
    public var delegate: FeedViewDelegate?
    
    public lazy var tableview: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.register(UINib(nibName: "FeedCell", bundle: Bundle.main), forCellReuseIdentifier: "FeedCell")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    public var animationView: LottieAnimationView?
    
    var model: [MatchModelElement]? {
        didSet {
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }
    
    private func updateUI() {
        guard let model = self.model else { return }
        tableview.reloadData()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableview)
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            tableview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FeedView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedCell else {
            return UITableViewCell()
        }
        cell.config(model, indexPath.item)
        return cell
    }
}

extension FeedView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = model?[indexPath.item] else { return }
        delegate?.didSelect(item)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.height * 2 {
            delegate?.fechMore()
        }
    }
}
