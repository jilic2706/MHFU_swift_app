//
//  SkillProvider.swift
//  final_project-JI2175
//
//  Created by Illy Byos II on 12.12.2021..
//

import Foundation

class SkillProvider {
    static let shared = SkillProvider()
    
    private(set) var skills: [Skill] = []
    
    init() {
        skills = [
            Skill(
                id: 6014,
                name: "Fencing",
                description: "Prevents weapons bouncing off of monsters.",
                entityType: .skill,
                thresholds: [
                    [
                        SkillEffect(effectName: "ESP", reqSkillPoints: 10)
                    ],
                    [
                    
                    ]
                ]),
            Skill(
                id: 6001,
                name: "Attack",
                description: "Raises or lowers your physical attack power.",
                entityType: .skill,
                thresholds: [
                    [
                        SkillEffect(effectName: "Attack Up (Large)", reqSkillPoints: 20),
                        SkillEffect(effectName: "Attack Up (Medium)", reqSkillPoints: 15),
                        SkillEffect(effectName: "Attack Up (Small)", reqSkillPoints: 10),
                    ],
                    [
                        SkillEffect(effectName: "Attack Down (Large)", reqSkillPoints: -20),
                        SkillEffect(effectName: "Attack Down (Medium)", reqSkillPoints: -15),
                        SkillEffect(effectName: "Attack Down (Small)", reqSkillPoints: -10),
                    ]
                ]),
            Skill(
                id: 6002,
                name: "Defense",
                description: "Raises or lowers your physical defense.",
                entityType: .skill,
                thresholds: [
                    [
                        SkillEffect(effectName: "Defense +40", reqSkillPoints: 20),
                        SkillEffect(effectName: "Defense +30", reqSkillPoints: 15),
                        SkillEffect(effectName: "Defense +20", reqSkillPoints: 10),
                    ],
                    [
                        SkillEffect(effectName: "Defense -40", reqSkillPoints: -20),
                        SkillEffect(effectName: "Defense -30", reqSkillPoints: -15),
                        SkillEffect(effectName: "Defense -20", reqSkillPoints: -10),
                    ]
                ])
        ]
    }
}
