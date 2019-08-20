//
//  SelectionIndicatorView.swift
//  Mopcon
//
//  Created by WU CHIH WEI on 2019/7/19.
//  Copyright © 2019 EthanLin. All rights reserved.
//

import UIKit

protocol SelectionViewDataSource: AnyObject {
    
    func numberOfButtons(in selectionView: SelectionView) -> Int
    
    func titleOfButton(_ selectionView: SelectionView, at index: Int) -> String
    
    func colorOfTitle(_ selectionView: SelectionView, at index: Int) -> UIColor?

    func colorOfIndicator(_ selectionView: SelectionView) -> UIColor?
    
    func fontOfTitle(_ selectionView: SelectionView, at index: Int) -> UIFont
    
    func initialButtonIndex(_ selectionView: SelectionView) -> Int
}

@objc protocol SelectionViewDelegate: AnyObject {
    
    @objc optional func didSelectedButton(_ selectionView: SelectionView, at index: Int)
    
    @objc optional func shouldSelectedButton(_ selectionView: SelectionView, at index: Int) -> Bool
}

extension SelectionViewDataSource {
    
    func numberOfButtons(in selectionView: SelectionView) -> Int { return 2 }
    
    func colorOfTitle(_ selectionView: SelectionView, at index: Int) -> UIColor? { return UIColor.white }
    
    func colorOfIndicator(_ selectionView: SelectionView) -> UIColor? { return UIColor.blue }
    
    func fontOfTitle(_ selectionView: SelectionView, at index: Int) -> UIFont { return UIFont.systemFont(ofSize: 18) }
    
    func initialButtonIndex(_ selectionView: SelectionView) -> Int { return 0 }
}

class SelectionView: UIView {

    weak var dataSource: SelectionViewDataSource? {
        
        didSet {
        
            setupSelectionViews()
        
            setupIndicatorView()
        }
    }
    
    weak var delegate: SelectionViewDelegate?
    
    var selectedIndex: Int?
    
    //MARK: - Private view object
    private var stackView: UIStackView = {
        
        let stack = UIStackView()
        
        stack.axis = NSLayoutConstraint.Axis.horizontal
        
        stack.distribution = UIStackView.Distribution.fillEqually
        
        return stack
    }()
    
    private let indicatorView = UIView()
    
    private var indicatorCenterXContraint: NSLayoutConstraint?
    
    //MARK: - Set up subViews
    private func setupSelectionViews() {
        
        guard let dataSource = dataSource else { return }
        
        for index in 0...(dataSource.numberOfButtons(in: self) - 1) {
            
            let button = UIButton()
            
            button.tag = index
            
            button.setTitle(dataSource.titleOfButton(self, at: index), for: .normal)
            
            button.setTitleColor(dataSource.colorOfTitle(self, at: index), for: .normal)
            
            button.addTarget(
                self,
                action: #selector(userDidTouchButton(_:)),
                for: .touchUpInside
            )
            
            stackView.addArrangedSubview(button)
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupIndicatorView() {
        
        guard let dataSource = dataSource else { return }
        
        let initialBtn = stackView.arrangedSubviews[dataSource.initialButtonIndex(self)]
        
        selectedIndex = dataSource.initialButtonIndex(self)
        
        indicatorView.backgroundColor = dataSource.colorOfIndicator(self)
        
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(indicatorView)
        
        indicatorCenterXContraint = indicatorView.centerXAnchor.constraint(equalTo: initialBtn.centerXAnchor)
        
        NSLayoutConstraint.activate([
            indicatorView.bottomAnchor.constraint(equalTo: initialBtn.bottomAnchor),
            indicatorView.heightAnchor.constraint(equalToConstant: 2),
            indicatorView.widthAnchor.constraint(
                equalToConstant: UIScreen.main.bounds.width / CGFloat(dataSource.numberOfButtons(in: self)) / 2
            ),
            indicatorCenterXContraint!
        ])
    }

    //MARK: - Action
    @objc private func userDidTouchButton(_ sender: UIButton) {
        
        guard delegate?.shouldSelectedButton?(self, at: sender.tag) == true else { return }
        
        let animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut, animations: { [weak self] in
        
            self?.indicatorCenterXContraint?.isActive = false
            
            self?.indicatorCenterXContraint = self?.indicatorView.centerXAnchor.constraint(equalTo: sender.centerXAnchor)
            
            self?.indicatorCenterXContraint?.isActive = true
            
            self?.layoutIfNeeded()
        })
        
        animator.startAnimation()
        
        delegate?.didSelectedButton?(self, at: sender.tag)
        
        selectedIndex = sender.tag
    }
}
