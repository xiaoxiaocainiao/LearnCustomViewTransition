//
//  ViewController.swift
//  CustomViewTransition
//
//  Created by 王雁 on 2016/10/18.
//  Copyright © 2016年 michael wang. All rights reserved.
//

import UIKit

class ExamplesList: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate {
    
    private let _titles = ["0: present","1: dismiss","2: navigation","3: present with interactive","4: dismiss with interactive","5:  navigation with interactive"]
    private let _tableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _tableView.frame = view.bounds
        _tableView.dataSource = self
        _tableView.delegate = self
        _tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        view.addSubview(_tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        cell.textLabel?.text = _titles[indexPath.row]
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            showExample0()
        case 1:
            showExample1()
        case 2:
            showExample2()
        case 3:
            showExample3()
        case 4:
            showExample4()
        case 5:
            showExample5()
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - private logic
    private func showExample0() {
        let viewController = CustomPresentAnimationViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func showExample1() {
        let viewController = CustomDismissAnimationViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func showExample2() {
        let viewController = CustomNavigationAnimationViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func showExample3() {
        let viewController = CustomPresentAnimationWithInteractiveViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func showExample4() {
        let viewController = CustomDismissAnimationWithInteractiveViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func showExample5() {
        let viewController = CustomNavigationAnimationWithInteractiveViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}

