package models

import (
	"database/sql"

	"github.com/Treinamento-WorldSkill-08-MG-2024/ArchForum/server/lib"
)

type Like struct {
	ID        int  `json:"id" query:"ID"`
	UserID    int  `json:"user-id" query:"userID"`
	PostID    *int `json:"post-id" query:"postID"`
	CommentID *int `json:"comment-id" query:"commentID"`
}

func (like Like) Insert(db *sql.DB) (int64, error) {
	query := "INSERT INTO `like` VALUES (NULL, ?, ?, ?)"

	postID := lib.SafeDerefComparable(like.PostID)
	commentID := lib.SafeDerefComparable(like.CommentID)
	return insertFactory(db, query, like.UserID, postID, commentID)
}

func (like Like) Delete(db *sql.DB) (int64, error) {
	return deleteFactory(db, "DELETE FROM `like` WHERE ID=?", like.ID)
}
