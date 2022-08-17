//
//  Spinner.swift
//  EmbibeDemo
//
//  Created by Admin on 8/17/22.
//

import UIKit

final class Spinner {
    fileprivate static var activityIndicator: UIActivityIndicatorView?
    fileprivate static var baseBackColor = UIColor(white: 0, alpha: 0.6)
    fileprivate static var baseColor = UIColor.white

    public static func start(from view: UIView,
                             style: UIActivityIndicatorView.Style = .large,
                             backgroundColor: UIColor = Spinner.baseBackColor,
                             baseColor: UIColor = Spinner.baseColor)
    {
        guard Spinner.activityIndicator == nil else { return }

        let spinner = UIActivityIndicatorView(style: style)
        spinner.backgroundColor = backgroundColor
        spinner.color = baseColor
        spinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spinner)

        // Auto-layout constraints
        addConstraints(to: view, with: spinner)

        Spinner.activityIndicator = spinner
        Spinner.activityIndicator?.startAnimating()
    }

    public static func stop() {
        Spinner.activityIndicator?.stopAnimating()
        Spinner.activityIndicator?.removeFromSuperview()
        Spinner.activityIndicator = nil
    }

    fileprivate static func addConstraints(to view: UIView, with spinner: UIActivityIndicatorView) {
        spinner.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        spinner.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        spinner.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        spinner.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
}
