//
//  ViewController.swift
//  ScrollHorizontally
//
//  Created by Jiexiang on 08/03/2017.
//  Copyright (c) 2017 Jiexiang. All rights reserved.
//

import UIKit
import ScrollHorizontally

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollHorizontallyView: ScrollHorizontallyView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollHorizontallyView.dataSource = self
        scrollHorizontallyView.delegate = self
        
    }
}

extension ViewController: ScrollHorizontallyViewDataSource, ScrollHorizontallyViewDelegate {
    func itemWidth() -> CGFloat {
        return view.bounds.width / 5
    }

    func items() -> [ScrollInfo] {
        return [
            ScrollInfo(title: "C", imageName: "icon", opeartion: {
                print("点击了1")
            }),
            ScrollInfo(title: "C", imageName: "icon", opeartion: {
                print("点击了2")
            }),
            ScrollInfo(title: "C", imageName: "icon", opeartion: {
                print("点击了3")
            }),
            ScrollInfo(title: "C", imageName: "icon", opeartion: {
                print("点击了4")
            }),
            ScrollInfo(title: "C", imageName: "icon", opeartion: {
                print("点击了5")
            }),
            ScrollInfo(title: "C", imageName: "icon", opeartion: {
                print("点击了6")
            })
            
//            ScrollInfo(title: "C++", imageName: "icon"),
//            ScrollInfo(title: "Java", imageName: "icon"),
//            ScrollInfo(title: "Objective-C", imageName: "icon"),
//            ScrollInfo(title: "Swift", imageName: "icon"),
//            ScrollInfo(title: "PHP", imageName: "icon"),
//            ScrollInfo(title: "Go", imageName: "icon")
        ]
    }
    
    func scrollHorizontallyView(didSelectItemAt scrollInfo: ScrollInfo) {
        scrollInfo.opeartion?()
    }
}
