//
//  SecondController.swift
//  SwiftMarathon5
//
//  Created by Anton Charny on 13/03/2023.
//

import UIKit

class SecondController: UIViewController {
    
    enum PopoverHeight {
        case large
        case small
        
        var size: CGSize {
            switch self {
            case .large: return CGSize(width: 300, height: 280)
            case .small: return CGSize(width: 300, height: 150)
            }
        }
        
        var title: String {
            switch self {
            case .large: return "280pt"
            case .small: return "150pt"
            }
        }
    }
    
    private lazy var segmentView = UISegmentedControl(items: [PopoverHeight.large.title, PopoverHeight.small.title])
    private lazy var closeButton = UIButton(primaryAction: UIAction(handler: { action in
        self.dismiss(animated: true)
    }))
    
    private var height: PopoverHeight = .large {
        didSet {
            switch height {
            case .large:
                self.preferredContentSize = CGSize(width: 300, height: 280)
            case .small:
                self.preferredContentSize = CGSize(width: 300, height: 150)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.preferredContentSize = self.height.size
        self.view.backgroundColor = .systemGray6
        self.segmentView.selectedSegmentIndex = 0
        
        self.segmentView.addTarget(self, action: #selector(segmentValueChanged), for: .valueChanged)

        self.addViews()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.constraints()
    }
    
    @objc private func segmentValueChanged() {
        self.height = self.segmentView.selectedSegmentIndex == 0 ? .large : .small
    }
    
    private func addViews() {
        self.segmentView.translatesAutoresizingMaskIntoConstraints = false
        self.closeButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.segmentView)
        self.view.addSubview(self.closeButton)
        
        self.closeButton.setImage(UIImage(systemName: "cross"), for: .normal)
    }
    
    private func configureSegmentio() {
        //        self.segmentView.
    }
    
    private func constraints() {
        self.view.addConstraints([
            .init(item: self.segmentView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 32),
            .init(item: self.segmentView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0),
            .init(item: self.segmentView, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: self.view, attribute: .leading, multiplier: 1, constant: 16),
            .init(item: self.closeButton, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -16),
            .init(item: self.closeButton, attribute: .centerY, relatedBy: .equal, toItem: self.segmentView, attribute: .centerY, multiplier: 1, constant: 0),
            .init(item: self.closeButton, attribute: .height, relatedBy: .equal, toItem: self.segmentView, attribute: .height, multiplier: 1, constant: 0),
            .init(item: self.closeButton, attribute: .width, relatedBy: .equal, toItem: self.closeButton, attribute: .height, multiplier: 1, constant: 0),
        ])
    }
}
