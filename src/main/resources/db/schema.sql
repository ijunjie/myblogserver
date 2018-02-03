DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id`          INT(11) NOT NULL AUTO_INCREMENT,
  `title`       VARCHAR(255)     DEFAULT NULL,
  `mdContent`   TEXT COMMENT 'md文件源码',
  `htmlContent` TEXT COMMENT 'html源码',
  `summary`     TEXT,
  `cid`         INT(11)          DEFAULT NULL,
  `uid`         INT(11)          DEFAULT NULL,
  `publishDate` DATETIME         DEFAULT NULL,
  `editTime`    DATETIME         DEFAULT NULL,
  `state`       INT(11)          DEFAULT NULL
  COMMENT '0表示草稿箱，1表示已发表，2表示已删除',
  `pageView`    INT(11)          DEFAULT '0',
  PRIMARY KEY (`id`, `cid`, `uid`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 122
  DEFAULT CHARSET = utf8;


DROP TABLE IF EXISTS `article_tags`;
CREATE TABLE `article_tags` (
  `id`  INT(11) NOT NULL AUTO_INCREMENT,
  `aid` INT(11)          DEFAULT NULL,
  `tid` INT(11)          DEFAULT NULL,
  PRIMARY KEY (`id`, `tid`, `aid`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 52
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id`       INT(11) NOT NULL AUTO_INCREMENT,
  `cateName` VARCHAR(64)      DEFAULT NULL,
  `date`     DATE             DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 65
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id`          INT(11) NOT NULL AUTO_INCREMENT,
  `aid`         INT(11)          DEFAULT NULL,
  `content`     TEXT,
  `publishDate` DATETIME         DEFAULT NULL,
  `parentId`    INT(11)          DEFAULT NULL
  COMMENT '-1表示正常回复，其他值表示是评论的回复',
  `uid`         INT(11)          DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`),
  KEY `uid` (`uid`),
  KEY `parentId` (`parentId`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


DROP TABLE IF EXISTS `pv`;
CREATE TABLE `pv` (
  `id`        INT(11) NOT NULL AUTO_INCREMENT,
  `countDate` DATE             DEFAULT NULL,
  `pv`        INT(11)          DEFAULT NULL,
  `uid`       INT(11)          DEFAULT NULL,
  PRIMARY KEY (`id`, `uid`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 28
  DEFAULT CHARSET = utf8;


DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id`   INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32)      DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `roles_user`;
CREATE TABLE `roles_user` (
  `id`  INT(11) NOT NULL AUTO_INCREMENT,
  `rid` INT(11)          DEFAULT '2',
  `uid` INT(11)          DEFAULT NULL,
  PRIMARY KEY (`id`, `rid`, `uid`)

)
  ENGINE = InnoDB
  AUTO_INCREMENT = 131
  DEFAULT CHARSET = utf8;


DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id`      INT(11) NOT NULL AUTO_INCREMENT,
  `tagName` VARCHAR(32)      DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tagName` (`tagName`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 67
  DEFAULT CHARSET = utf8;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id`       INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(64)      DEFAULT NULL,
  `nickname` VARCHAR(64)      DEFAULT NULL,
  `password` VARCHAR(255)     DEFAULT NULL,
  `enabled`  TINYINT(1)       DEFAULT '1',
  `email`    VARCHAR(64)      DEFAULT NULL,
  `userface` VARCHAR(255)     DEFAULT NULL,
  `regTime`  DATETIME         DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 21
  DEFAULT CHARSET = utf8;

DROP VIEW IF EXISTS `pvview`;
CREATE ALGORITHM = UNDEFINED
  DEFINER =`root`@`localhost` VIEW `pvview` AS
  SELECT
    SUM(pv) AS pv,
    uid
  FROM pv
  GROUP BY uid;

DROP VIEW IF EXISTS `totalpvview`;
CREATE ALGORITHM = UNDEFINED
  DEFINER =`root`@`localhost` VIEW `totalpvview` AS
  SELECT
    SUM(pageView) AS totalPv,
    uid
  FROM article a
  GROUP BY uid;
SET FOREIGN_KEY_CHECKS = 1;


ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`id`);
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`);
ALTER TABLE `article_tags`
  ADD CONSTRAINT `article_tags_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `article` (`id`)
  ON DELETE CASCADE;
ALTER TABLE `article_tags`
  ADD CONSTRAINT `article_tags_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `tags` (`id`);

ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `article` (`id`);
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`);
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`parentId`) REFERENCES `comments` (`id`);

ALTER TABLE `pv`
  ADD CONSTRAINT `pv_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
  ON DELETE CASCADE;

ALTER TABLE `roles_user`
  ADD CONSTRAINT `roles_user_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `roles` (`id`);
ALTER TABLE `roles_user`
  ADD CONSTRAINT `roles_user_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
  ON DELETE CASCADE;