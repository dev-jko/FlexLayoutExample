//
//  Example1View.swift
//  FlexLayoutExample
//
//  Created by Jaedoo Ko on 2020/12/27.
//

import UIKit

class Example1View: UIView {
    
    private let rootContainer = UIView()
    
    private let imageView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Intro", "FlexLayout", "PinLayout"])
        control.selectedSegmentIndex = 0
        return control
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = """
        Flexbox layouting is simple, powerfull and fast.
        
        FlexLayout syntax is concise and chainable.
        """
        label.numberOfLines = 0
        return label
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "FlexLayout/yoga is incredibly fast, its even faster than manual layout."
        label.numberOfLines = 0
        return label
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rootContainer.frame = CGRect(
            x: 0, y: 0,
            width: frame.width,
            height: rootContainer.frame.height
        )
        rootContainer.flex.layout(mode: .adjustHeight)
    }
}

private extension Example1View {
    func setUp() {
        rootContainer.backgroundColor = .cyan
        addSubview(rootContainer)
        
        rootContainer.flex.direction(.column).padding(12).define { flex in
            flex.addItem().direction(.row).define { (flex) in
                flex.addItem(imageView).width(100).height(100)

                flex.addItem().direction(.column).paddingLeft(12).grow(1).shrink(1).define { (flex) in
                    flex.addItem(segmentedControl).marginBottom(12).grow(1)
                    flex.addItem(label)
                }
            }

            flex.addItem().height(1).marginTop(12).backgroundColor(.lightGray)
            flex.addItem(bottomLabel).marginTop(12)
        }
    }
}
