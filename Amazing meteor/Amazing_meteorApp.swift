//
//  Amazing_meteorApp.swift
//  Amazing meteor
//
//  Created by venus on 9/20/21.
//

import SwiftUI

@main
struct Amazing_meteorApp: App {
    
    //@ObservedObject var meteorViewModel = MeteorViewModel()
    init() {
        configureTheme()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                //MainView(meteors: $meteorViewModel.meteors)
                MainView()
            }
        }
    }
    
    private func configureTheme() {
        //set the color of the navigationbar
        UINavigationBar.appearance().tintColor = UIColor.BarBgClr
        UINavigationBar.appearance().barTintColor = UIColor.BarBgClr
        //set the navigationbar's title color and font
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont.navBarTitleFont!, .foregroundColor : UIColor.white]
        //set the color of the UITabBar
        UITabBar.appearance().backgroundColor = UIColor.BarBgClr
        UITabBar.appearance().barTintColor = UIColor.BarBgClr
        
        //set the color of the UISegmentedControl
        UISegmentedControl.appearance().selectedSegmentTintColor = .SegmentedSelClr
        UISegmentedControl.appearance().backgroundColor = .SegmentedBgClr
        UISegmentedControl.appearance().setTitleTextAttributes([.font: UIFont.segmentTextFont!, .foregroundColor: UIColor.TitleClr], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.font: UIFont.segmentTextFont!, .foregroundColor: UIColor.TitleClr], for: .normal)
        UITableView.appearance().backgroundColor = UIColor.ViewBkClr
    }
}
