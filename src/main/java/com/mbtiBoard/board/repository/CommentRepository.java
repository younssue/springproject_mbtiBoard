package com.mbtiBoard.board.repository;

import com.mbtiBoard.board.dto.CommentDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class CommentRepository {
    private final SqlSessionTemplate sql;

    //댓글 작성
    public int commentSave(CommentDTO commentDTO){
        return sql.insert("Comment.commentSave", commentDTO);
    }

    //bno해당 댓글 모두 불러오기
    public List<CommentDTO> commentSelectAll(Integer bno){
        return  sql.selectList("Comment.commentSelectAll",bno);
    }

    public CommentDTO select(Integer cno){
        return sql.selectOne("Comment.commentSelect", cno);
    }

    //댓글 갯수
    public  int count(Integer bno){
        return sql.selectOne("Comment.count",bno);
    }

    //댓글 수정
    public int commentModify(CommentDTO commentDTO){
        return sql.update("Comment.commentModify", commentDTO);
    }

    //댓글 삭제
    public int deleteAll(Integer bno){
        return sql.delete("Comment.deleteAll", bno);
    }

    public int delete(Integer cno,String memberId){
        Map map = new HashMap();
        map.put("cno",cno);
        map.put("memberId", memberId);
        return sql.delete("Comment.delete",map);
    }


}
