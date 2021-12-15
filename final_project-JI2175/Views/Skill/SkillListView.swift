//
//  SkillListView.swift
//  final_project-JI2175
//
//  Created by Illy Byos on 11.12.2021..
//

import SwiftUI

struct SkillListView: View {
    @Binding var menuOpened: Bool
    
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
    }
}

struct SkillListView_Previews: PreviewProvider {
    static var previews: some View {
        SkillListView(menuOpened: .constant(false), viewModel: SkillsViewModel())
    }
}
