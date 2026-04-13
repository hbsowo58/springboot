CREATE TABLE posts (
                       id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '게시글 고유 ID',
                       title VARCHAR(255) NOT NULL COMMENT '게시글 제목',
                       content TEXT NOT NULL COMMENT '게시글 내용',
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '생성 시각',
                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정 시각'
);


INSERT INTO posts (title, content) VALUES
                                       ('첫 번째 게시글', '안녕하세요! 첫 번째 게시글입니다.'),
                                       ('두 번째 게시글', '두 번째 게시글의 내용입니다.');

