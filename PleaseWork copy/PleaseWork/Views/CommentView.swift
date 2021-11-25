//
//  CommentView.swift
//  PleaseWork
//
//  Created by David Pidugu on 11/12/21.
//

import SwiftUI

struct CommentView: View {
    @StateObject var commentService = CommentService()
    
    var post: AddModel?
    var postId: String?
    
    var body: some View {
        VStack(spacing: 10) {
            ScrollView{
                if !commentService.comments.isEmpty{
                    ForEach(commentService.comments) {
                        (comment) in
                        CommentCard(comment: comment).padding(.top)
                    }
                }
            }
            CommentInput(post: post, postId: postId)
        }
        .navigationTitle("Comments")
        .onAppear{
            self.commentService.postId = self.post == nil ? self.postId : self.post?.postId
            
            self.commentService.loadComments()
        }
        .onDisappear{
            if self.commentService.listener != nil {
                self.commentService.listener.remove()
            }
        }
    }
}


