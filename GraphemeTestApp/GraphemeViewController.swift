//
//  GraphemeViewController.swift
//  GraphemeTestApp
//
//  Created by Matthew Loewen on 2021-06-08.
//

import UIKit

class GraphemeViewController: UIViewController {
    var graphemes: [String]!
    var stackView: UIStackView?
    
    init(graphemes: [String]) {
        self.graphemes = graphemes
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        displayGraphemes()
        
    }
    
    func updateGraphemes(with graphemes: [String]) {
        self.graphemes = graphemes
        
        stackView?.removeFromSuperview()
        stackView = nil
        
        displayGraphemes()
    }

    func displayGraphemes() {
        stackView?.removeFromSuperview()
        
        
        // create temp image array
        var imageArray: [UIImageView] = []
        
        for item in graphemes {
            // create the image view
            let imageView = UIImageView()
            // enable auto layout
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            // get the image
            guard let image = UIImage(named: item) else { return }
            // assign the image to the imageView
            imageView.image = image
            
            // set an aspect ratio constraint
//            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: image.size.width / image.size.height).isActive = true
            
            imageView.contentMode = .scaleAspectFit
            
            imageArray.append(imageView)
        }
        
        let stackView = UIStackView(arrangedSubviews: imageArray)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        self.stackView = stackView
    }

}
