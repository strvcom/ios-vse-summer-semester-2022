//
//  Post.swift
//  BookFace
//
//  Created by Jan Kaltoun on 01.03.2022.
//

import UIKit

struct Post: Identifiable {
    let id = UUID()
    let image: UIImage
    let author: String
    let text: String
    
    init(imageName: String, author: String, text: String) {
        self.image = UIImage(named: imageName)!
        self.author = author
        self.text = text
    }
}

let posts = [
    Post(
        imageName: "book1",
        author: "Petr Frank",
        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
    Post(
        imageName: "book2",
        author: "Ondřej Gardavský",
        text: "Nam condimentum, nulla sit amet malesuada efficitur, leo erat efficitur lacus, eget molestie lacus mi sed dui. Aenean vel ligula sed ipsum mollis ornare sed quis libero. Nam tincidunt leo non porttitor eleifend. Donec volutpat mi et varius dapibus. Mauris lobortis sem in tellus laoreet accumsan."
    ),
    Post(
        imageName: "book3",
        author: "Tomáš Koťara",
        text: "Cras cursus magna et finibus iaculis."
    ),
    Post(
        imageName: "book4",
        author: "Miroslav Prokop",
        text: "Integer lacinia ex eu felis ultricies, vitae consequat lectus blandit."
    ),
    Post(
        imageName: "book5",
        author: "Ivan Svoboda",
        text: "In elementum id sapien vitae sagittis. Nullam at tellus eget ex mollis porta. In justo neque, cursus id felis in, elementum feugiat odio."
    )
]
