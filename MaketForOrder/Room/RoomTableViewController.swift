//
//  RoomTableViewController.swift
//  MaketForOrder
//
//  Created by Ratibor on 27.12.2023.
//

import UIKit

class RoomTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    
    // MARK: Private properties
    private var rooms: [Room] = []
    
    var hotelMode: HotelDataModel?
    
    private let tabBar: UITabBar = {
        let tabBar = UITabBar()
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.backgroundColor = UIColor.white
        return tabBar
    }()
}

// MARK: - Private methods
private extension RoomTableViewController {
    func setupUI() {
        setupNavigationController()
        setupTableView()
        setupTabBar()
        loadHotelName()
    }
    
    func setupNavigationController() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
    func setupTableView() {
        tableView.backgroundColor = ColorConstants.colorControllerBackground
        tableView.register(RoomTableViewCell.self, forCellReuseIdentifier: "RoomTableViewCell")
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 45, right: 0)
    }
    
    func setupTabBar() {
        view.addSubview(tabBar)
        tabBar.snp.makeConstraints { make in
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(34)
        }
    }
    
    func loadHotelName() {
        DispatchQueue.global().async { [ weak self ] in
            HotelDataFetcher.fetchData { jsonData in
                DispatchQueue.main.async {
                    let hotelName = jsonData.name
                    self?.title = hotelName
                }
            } failure: { error in
                print("Error loading hotel data: \(error)")
            }
            
        }
    }
    
    func loadData() {
        RoomsDataFetcher.loadRooms { [weak self] result in
            switch result {
            case .success(let rooms):
                self?.rooms = rooms
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                print("Error loading rooms: \(error)")
            }
        }
    }
}

// MARK: - TableView DataSource
extension RoomTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTableViewCell", for: indexPath) as! RoomTableViewCell
        cell.setRoom(rooms[indexPath.row])
        return cell
        
    }
}

// MARK: - TableView Delegate
extension RoomTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 539.0
    }
}
