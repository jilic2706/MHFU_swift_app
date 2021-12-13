//
//  SkillListView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 11.12.2021..
//

import SwiftUI

struct SkillListView: View {
    @ObservedObject var viewModel: SkillsViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(viewModel.data) { skill in
                    SkillRowView(skill: skill)
                    Divider()
                        .background(Color("ModeDependantGray"))
                }
            }
        }
            .navigationBarTitle("Skills", displayMode: .inline)
            .toolbar {
                ToolbarItem(
                    placement: ToolbarItemPlacement.navigationBarLeading,
                    content: {
                        MenuComponent()
                    }
                )
            }
    }
}

struct SkillListView_Previews: PreviewProvider {
    static var previews: some View {
        SkillListView(viewModel: SkillsViewModel())
    }
}
