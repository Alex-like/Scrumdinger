//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by Alex Shchelochkov on 13.06.2022.
//

import SwiftUI

struct SpeakerArc: Shape {
    let speakerIndex: Int
    let totalSpeakers: Int
    
    private var degreesPerSpeakers: Double {
        360.0 / Double(totalSpeakers)
    }
    private var startAngel: Angle {
        Angle(degrees: degreesPerSpeakers * Double(speakerIndex) + 1.0)
    }
    private var endAngel: Angle {
        Angle(degrees: startAngel.degrees + degreesPerSpeakers - 1.0)
    }
    
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 20.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngel, endAngle: endAngel, clockwise: false)
        }
    }
}
