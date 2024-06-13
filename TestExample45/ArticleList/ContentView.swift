//
//  ContentView.swift
//  TestExample45
//
//  Created by Uday Venkat on 13/06/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var viewModel: ListViewModel = ListViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach($viewModel.listData, id: \.self) { $item in   
                    ListRowView(viewModel: viewModel, listItem: item)
                }
            }
            .onAppear(){
                viewModel.fetchListData()
            }
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
