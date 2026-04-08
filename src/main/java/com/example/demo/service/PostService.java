package com.example.demo.service;

import com.example.demo.mapper.PostMapper;
import com.example.demo.model.Post;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;


@Service
public class PostService {
    @Autowired
    private PostMapper postMapper;

    @Autowired
    public PostService(PostMapper postMapper) {
        this.postMapper = postMapper;
    }

    public List<Post> getAllPosts() {
        return postMapper.findAll();
    }

    public Post getPostById(Long id) {
        return postMapper.findById(id);
    }

    public int createPost(Post post) {
        return postMapper.insert(post);
    }

    public int updatePost(Post post) {
        return postMapper.update(post);
    }

    public int deletePost(Long id) {
        return postMapper.delete(id);
    }
}