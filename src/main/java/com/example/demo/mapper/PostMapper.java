package com.example.demo.mapper;

import com.example.demo.model.Post;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface PostMapper {
    List<Post> findAll();
    Post findById(@Param("id") Long id);
    int insert(Post post);
    int update(Post post);
    int delete(@Param("id") Long id);
}