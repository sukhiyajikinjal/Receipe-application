//
//  RecipeMenu.swift
//  Recipeapp
//
//  Created by DCS on 06/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class RecipeMenu: UIViewController {
     private let myTableView=UITableView()
     private var foodArray=["samosa","browni","pizza"]
    private let detail=["A samosa is a South Asian fried or baked pastry with a savory filling like spiced potatoes, onions, peas, chicken and other meats, or lentils.","A chocolate brownie or simply a brownie is a square or rectangular chocolate baked confection Brownies come in a variety of forms and may be either fudgy or cakey depending on their density","Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myTableView)
        setupTableView()
    
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTableView.frame = CGRect(x:0, y:view.safeAreaInsets.top, width: view.frame.size.width, height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
        
    }
    


}
extension RecipeMenu: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView()
    {
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(FoodItem.self, forCellReuseIdentifier: "FoodItem")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodItem", for: indexPath) as! FoodItem
       
        cell.setupFoodCellWith(title: foodArray[indexPath.row],title1: detail[indexPath.row])
        cell.target(forAction: #selector(buttonclicked), withSender: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(foodArray[indexPath.row])
             UserDefaults.standard.setValue(foodArray[indexPath.row], forKey: "foodname")
            let vc = RecipeIngredientsVC()
            navigationController?.pushViewController(vc, animated: true)
           
        }
    
  @objc private func buttonclicked( _ sender:UIButton) {
        print(foodArray[sender.tag])
        let vc = RecipeIngredientsVC()
        vc.food_item = foodArray[sender.tag]
        vc.food_no = Int32(sender.tag)
        navigationController?.pushViewController(vc, animated: true)
    }
    /*@objc private func  buttonclicked(){
    let vc = RecipeIngredientsVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    //navigationController?.pushViewController(vc, animated: true)
            //self.present(vc, animated: true, completion: nil)
    }*/
}

