drop table 
CREATE TABLE "QUOTES"."AUTHOR"
(
   ID int PRIMARY KEY NOT NULL,
   FIRST_NAME varchar(30),
   LAST_NAME varchar(30),
   DESCRIPTOR long varchar,
   CREATING_USER varchar(30),
   CREATION_DATE timestamp DEFAULT current_timestamp
)
;
CREATE TABLE "QUOTES"."AUTHOR_TAG"
(
   AUTHOR_ID int NOT NULL,
   TAG_ID int NOT NULL,
   CREATING_USER varchar(30),
   CONSTRAINT SQL150908082921550 PRIMARY KEY (AUTHOR_ID,TAG_ID)
)
;
CREATE TABLE "QUOTES"."QUOTATION"
(
   ID int PRIMARY KEY NOT NULL,
   AUTHOR_ID int,
   QUOTE_TEXT long varchar,
   Q_SOURCE int,
   POSTING_USER varchar(30),
   REPORTED boolean DEFAULT false,
   POSTING_DATE timestamp,
   ENTRY_DATE timestamp DEFAULT current_timestamp
)
;
CREATE TABLE "QUOTES"."QUOTE_SOURCE"
(
   ID int PRIMARY KEY NOT NULL,
   AUTHOR_ID int,
   SOURCE_TITLE varchar(140),
   ISBN varchar(20),
   PUBLICATION_YEAR smallint,
   PUBLISHER varchar(50),
   LANGUAGE varchar(30),
   CREATING_USER varchar(30),
   CREATION_DATE timestamp DEFAULT current_timestamp
)
;
CREATE TABLE "QUOTES"."QUOTE_TAG"
(
   QUOTE_ID int NOT NULL,
   TAG_ID int NOT NULL,
   CREATING_USER varchar(30),
   CONSTRAINT SQL150908082921790 PRIMARY KEY (QUOTE_ID,TAG_ID)
)
;
CREATE TABLE "QUOTES"."REGISTERED_USER"
(
   USER_NAME varchar(30) PRIMARY KEY NOT NULL,
   PASSWORD varchar(25) NOT NULL,
   FIRST_NAME varchar(30),
   LAST_NAME varchar(30),
   EMAIL varchar(30) NOT NULL,
   TRUST_FACTOR int DEFAULT 0,
   CREATION_DATE timestamp DEFAULT current_timestamp
)
;
CREATE TABLE "QUOTES"."ROLE"
(
   ROLE varchar(30) PRIMARY KEY NOT NULL
)
;
CREATE TABLE "QUOTES"."SUBJECT_TAG"
(
   ID int PRIMARY KEY NOT NULL,
   TAG_TEXT varchar(85),
   CREATING_USER varchar(30),
   CREATION_DATE timestamp DEFAULT current_timestamp
)
;
CREATE TABLE "QUOTES"."USER_AUTHOR_RATING"
(
   REG_USER varchar(30) NOT NULL,
   AUTHOR_ID int NOT NULL,
   RATING smallint,
   CONSTRAINT SQL150908082921610 PRIMARY KEY (REG_USER,AUTHOR_ID)
)
;
CREATE TABLE "QUOTES"."USER_INTEREST"
(
   REG_USER varchar(30) NOT NULL,
   TAG_ID int NOT NULL,
   CONSTRAINT SQL150908082921510 PRIMARY KEY (REG_USER,TAG_ID)
)
;
CREATE TABLE "QUOTES"."USER_QUOTE_RATING"
(
   REG_USER varchar(30) NOT NULL,
   QUOTE_ID int NOT NULL,
   RATING smallint,
   CONSTRAINT SQL150908082921740 PRIMARY KEY (REG_USER,QUOTE_ID)
)
;
CREATE TABLE "QUOTES"."USER_ROLE"
(
   REG_USER varchar(30) NOT NULL,
   ROLE varchar(30) NOT NULL,
   CONSTRAINT SQL150908082921480 PRIMARY KEY (REG_USER,ROLE)
)
;
ALTER TABLE "QUOTES"."AUTHOR"
ADD CONSTRAINT SQL150908082921421
FOREIGN KEY (CREATING_USER)
REFERENCES "QUOTES"."REGISTERED_USER"(USER_NAME)
;
CREATE INDEX SQL150908082921421 ON "QUOTES"."AUTHOR"(CREATING_USER)
;
CREATE UNIQUE INDEX SQL150908082921420 ON "QUOTES"."AUTHOR"(ID)
;
ALTER TABLE "QUOTES"."AUTHOR_TAG"
ADD CONSTRAINT SQL150908082921553
FOREIGN KEY (AUTHOR_ID)
REFERENCES "QUOTES"."AUTHOR"(ID)
;
ALTER TABLE "QUOTES"."AUTHOR_TAG"
ADD CONSTRAINT SQL150908082921552
FOREIGN KEY (TAG_ID)
REFERENCES "QUOTES"."SUBJECT_TAG"(ID)
;
ALTER TABLE "QUOTES"."AUTHOR_TAG"
ADD CONSTRAINT SQL150908082921551
FOREIGN KEY (CREATING_USER)
REFERENCES "QUOTES"."REGISTERED_USER"(USER_NAME)
;
CREATE INDEX SQL150908082921553 ON "QUOTES"."AUTHOR_TAG"(AUTHOR_ID)
;
CREATE INDEX SQL150908082921552 ON "QUOTES"."AUTHOR_TAG"(TAG_ID)
;
CREATE INDEX SQL150908082921551 ON "QUOTES"."AUTHOR_TAG"(CREATING_USER)
;
CREATE UNIQUE INDEX SQL150908082921550 ON "QUOTES"."AUTHOR_TAG"
(
  AUTHOR_ID,
  TAG_ID
)
;
ALTER TABLE "QUOTES"."QUOTATION"
ADD CONSTRAINT SQL150908082921703
FOREIGN KEY (Q_SOURCE)
REFERENCES "QUOTES"."QUOTE_SOURCE"(ID)
;
ALTER TABLE "QUOTES"."QUOTATION"
ADD CONSTRAINT SQL150908082921701
FOREIGN KEY (POSTING_USER)
REFERENCES "QUOTES"."REGISTERED_USER"(USER_NAME)
;
ALTER TABLE "QUOTES"."QUOTATION"
ADD CONSTRAINT SQL150908082921702
FOREIGN KEY (AUTHOR_ID)
REFERENCES "QUOTES"."AUTHOR"(ID)
;
CREATE INDEX SQL150908082921702 ON "QUOTES"."QUOTATION"(AUTHOR_ID)
;
CREATE INDEX SQL150908082921701 ON "QUOTES"."QUOTATION"(POSTING_USER)
;
CREATE UNIQUE INDEX SQL150908082921700 ON "QUOTES"."QUOTATION"(ID)
;
CREATE INDEX SQL150908082921703 ON "QUOTES"."QUOTATION"(Q_SOURCE)
;
ALTER TABLE "QUOTES"."QUOTE_SOURCE"
ADD CONSTRAINT SQL150908082921662
FOREIGN KEY (AUTHOR_ID)
REFERENCES "QUOTES"."AUTHOR"(ID)
;
ALTER TABLE "QUOTES"."QUOTE_SOURCE"
ADD CONSTRAINT SQL150908082921661
FOREIGN KEY (CREATING_USER)
REFERENCES "QUOTES"."REGISTERED_USER"(USER_NAME)
;
CREATE INDEX SQL150908082921662 ON "QUOTES"."QUOTE_SOURCE"(AUTHOR_ID)
;
CREATE INDEX SQL150908082921661 ON "QUOTES"."QUOTE_SOURCE"(CREATING_USER)
;
CREATE UNIQUE INDEX SQL150908082921660 ON "QUOTES"."QUOTE_SOURCE"(ID)
;
ALTER TABLE "QUOTES"."QUOTE_TAG"
ADD CONSTRAINT SQL150908082921791
FOREIGN KEY (CREATING_USER)
REFERENCES "QUOTES"."REGISTERED_USER"(USER_NAME)
;
ALTER TABLE "QUOTES"."QUOTE_TAG"
ADD CONSTRAINT SQL150908082921792
FOREIGN KEY (TAG_ID)
REFERENCES "QUOTES"."SUBJECT_TAG"(ID)
;
ALTER TABLE "QUOTES"."QUOTE_TAG"
ADD CONSTRAINT SQL150908082921793
FOREIGN KEY (QUOTE_ID)
REFERENCES "QUOTES"."QUOTATION"(ID)
;
CREATE INDEX SQL150908082921793 ON "QUOTES"."QUOTE_TAG"(QUOTE_ID)
;
CREATE INDEX SQL150908082921792 ON "QUOTES"."QUOTE_TAG"(TAG_ID)
;
CREATE INDEX SQL150908082921791 ON "QUOTES"."QUOTE_TAG"(CREATING_USER)
;
CREATE UNIQUE INDEX SQL150908082921790 ON "QUOTES"."QUOTE_TAG"
(
  QUOTE_ID,
  TAG_ID
)
;
CREATE UNIQUE INDEX SQL150908082921410 ON "QUOTES"."REGISTERED_USER"(USER_NAME)
;
CREATE UNIQUE INDEX SQL150908082921460 ON "QUOTES"."ROLE"(ROLE)
;
ALTER TABLE "QUOTES"."SUBJECT_TAG"
ADD CONSTRAINT SQL150908082921441
FOREIGN KEY (CREATING_USER)
REFERENCES "QUOTES"."REGISTERED_USER"(USER_NAME)
;
CREATE UNIQUE INDEX SQL150908082921440 ON "QUOTES"."SUBJECT_TAG"(ID)
;
CREATE INDEX SQL150908082921441 ON "QUOTES"."SUBJECT_TAG"(CREATING_USER)
;
ALTER TABLE "QUOTES"."USER_AUTHOR_RATING"
ADD CONSTRAINT SQL150908082921611
FOREIGN KEY (REG_USER)
REFERENCES "QUOTES"."REGISTERED_USER"(USER_NAME)
;
ALTER TABLE "QUOTES"."USER_AUTHOR_RATING"
ADD CONSTRAINT SQL150908082921612
FOREIGN KEY (AUTHOR_ID)
REFERENCES "QUOTES"."AUTHOR"(ID)
;
CREATE INDEX SQL150908082921612 ON "QUOTES"."USER_AUTHOR_RATING"(AUTHOR_ID)
;
CREATE INDEX SQL150908082921611 ON "QUOTES"."USER_AUTHOR_RATING"(REG_USER)
;
CREATE UNIQUE INDEX SQL150908082921610 ON "QUOTES"."USER_AUTHOR_RATING"
(
  REG_USER,
  AUTHOR_ID
)
;
ALTER TABLE "QUOTES"."USER_INTEREST"
ADD CONSTRAINT SQL150908082921511
FOREIGN KEY (REG_USER)
REFERENCES "QUOTES"."REGISTERED_USER"(USER_NAME)
;
ALTER TABLE "QUOTES"."USER_INTEREST"
ADD CONSTRAINT SQL150908082921512
FOREIGN KEY (TAG_ID)
REFERENCES "QUOTES"."SUBJECT_TAG"(ID)
;
CREATE INDEX SQL150908082921511 ON "QUOTES"."USER_INTEREST"(REG_USER)
;
CREATE UNIQUE INDEX SQL150908082921510 ON "QUOTES"."USER_INTEREST"
(
  REG_USER,
  TAG_ID
)
;
CREATE INDEX SQL150908082921512 ON "QUOTES"."USER_INTEREST"(TAG_ID)
;
ALTER TABLE "QUOTES"."USER_QUOTE_RATING"
ADD CONSTRAINT SQL150908082921750
FOREIGN KEY (QUOTE_ID)
REFERENCES "QUOTES"."QUOTATION"(ID)
;
ALTER TABLE "QUOTES"."USER_QUOTE_RATING"
ADD CONSTRAINT SQL150908082921741
FOREIGN KEY (REG_USER)
REFERENCES "QUOTES"."REGISTERED_USER"(USER_NAME)
;
CREATE INDEX SQL150908082921750 ON "QUOTES"."USER_QUOTE_RATING"(QUOTE_ID)
;
CREATE INDEX SQL150908082921741 ON "QUOTES"."USER_QUOTE_RATING"(REG_USER)
;
CREATE UNIQUE INDEX SQL150908082921740 ON "QUOTES"."USER_QUOTE_RATING"
(
  REG_USER,
  QUOTE_ID
)
;
ALTER TABLE "QUOTES"."USER_ROLE"
ADD CONSTRAINT SQL150908082921481
FOREIGN KEY (REG_USER)
REFERENCES "QUOTES"."REGISTERED_USER"(USER_NAME)
;
ALTER TABLE "QUOTES"."USER_ROLE"
ADD CONSTRAINT SQL150908082921482
FOREIGN KEY (ROLE)
REFERENCES "QUOTES"."ROLE"(ROLE)
;
CREATE INDEX SQL150908082921482 ON "QUOTES"."USER_ROLE"(ROLE)
;
CREATE INDEX SQL150908082921481 ON "QUOTES"."USER_ROLE"(REG_USER)
;
CREATE UNIQUE INDEX SQL150908082921480 ON "QUOTES"."USER_ROLE"
(
  REG_USER,
  ROLE
)
;


INSERT INTO "QUOTES"."AUTHOR" (ID,FIRST_NAME,LAST_NAME,DESCRIPTOR,CREATING_USER,CREATION_DATE) VALUES (1,'Soren','Kierkegaard',null,'admin',{ts '2015-09-10 11:25:56.377000'});
INSERT INTO "QUOTES"."AUTHOR" (ID,FIRST_NAME,LAST_NAME,DESCRIPTOR,CREATING_USER,CREATION_DATE) VALUES (2,'Chimamanda Ngozi','Adichie',null,null,{ts '2015-09-10 11:25:56.377000'});
INSERT INTO "QUOTES"."AUTHOR" (ID,FIRST_NAME,LAST_NAME,DESCRIPTOR,CREATING_USER,CREATION_DATE) VALUES (8,'Douglas','Adams',null,null,{ts '2015-09-10 16:26:04.811000'});
INSERT INTO "QUOTES"."AUTHOR" (ID,FIRST_NAME,LAST_NAME,DESCRIPTOR,CREATING_USER,CREATION_DATE) VALUES (9,'Neil','Gaiman',null,null,{ts '2015-09-10 17:42:45.252000'});
INSERT INTO "QUOTES"."AUTHOR" (ID,FIRST_NAME,LAST_NAME,DESCRIPTOR,CREATING_USER,CREATION_DATE) VALUES (10,'Mark','Twain',null,null,{ts '2015-09-11 16:08:38.531000'});




INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (1,1,'Lord Jesus Christ, our foolish minds are weak; they are more than willing to be drawn-and there is so much that wants to draw us to itself. There is pleasure with its seductive power, the multiplicity with its bewildering distractions, the moment with its infatuating importance and the conceited laboriousness of busyness and the careless time-wasting of light-mindedness and the gloomy brooding of heavy-mindedness-all this will draw us away from ourselves to itself in order to deceive us. But you, who are truth, only you, our Savior and Redeemer, can truly draw to person to yourself, which you have promised to do-that you will draw all to yourself. Then may God grant that by repenting we may come to ourselves, so that you, according to your Word, can draw us to yourself-from on high, but through lowliness and abasement.',null,'admin',0,null,{ts '2015-09-10 11:25:56.356000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (2,1,'For as only one thing is necessary, and as the theme of the talk is the willing of only one thing: hence the consciousness before God of one’s eternal responsibility to be an individual is that one thing necessary.',null,'admin',0,null,{ts '2015-09-10 11:25:56.356000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (3,1,'The truth is a trap: you can not get it without it getting you; you cannot get the truth by capturing it, only by its capturing you.',null,'admin',0,null,{ts '2015-09-10 11:25:56.356000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (5,2,'Oppression Olympics is what smart liberal Americans say to make you feel stupid and to make you shut up. But there IS an oppression olympics going on. American racial minorities - blacks, Hispanics, Asians and Jews - all get shit from white folks, different kinds of shit but shit still. Each secretly believes that it gets the worst shit. So, no, there is no United League of the Oppressed. However, all the others think they''re better than blacks because, well, they''re not black.',null,null,0,null,{ts '2015-09-10 11:25:56.356000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (8,2,'We spend too much time teaching girls to worry about what boys think of them. But the reverse is not the case. We don’t teach boys to care about being likable. We spend too much time telling girls that they cannot be angry or aggressive or tough, which is bad enough, but then we turn around and either praise or excuse men for the same reasons. All over the world, there are so many magazine articles and books telling women what to do, how to be and not to be, in order to attract or please men. There are far fewer guides for men about pleasing women.',null,null,0,null,{ts '2015-09-10 11:25:56.356000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (73,2,'Alexa and the other guests, and perhaps even Georgina, all understood the fleeing from war, from the kind of poverty that crushed human souls, but they would not understand the need to escape from the oppressive lethargy of choicelessness. They would not understand why people like him who were raised well fed and watered but mired in dissatisfaction, conditioned from birth to look towards somewhere else, eternally convinced that real lives happened in that somewhere else, were now resolved to do dangerous things, illegal things, so as to leave, none of them starving, or raped, or from burned villages, but merely hungry for for choice and certainty.',1,null,0,null,{ts '2015-09-10 15:59:31.229000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (74,2,'She rested her head against his and felt, for the first time, what she would often feel with him: a self-affection. He made her like herself. With him, she was at ease; her skin felt as though it was her right size.. It seemed so natural, to talk to him about odd things. She had never done that before. The trust, so sudden and yet so complete, and the intimacy, frightened her.. But now she could think only of all the things she yet wanted to tell him, wanted to do with him.',1,null,0,null,{ts '2015-09-10 15:59:31.312000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (75,2,'The problem with gender is that it prescribes how we should be rather than recognizing how we are. Imagine how much happier we would be, how much freer to be our true individual selves, if we didn’t have the weight of gender expectations.',37,null,0,null,{ts '2015-09-10 15:59:31.383000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (76,2,'If you’re telling a non-black person about something racist that happened to you, make sure you are not bitter. Don’t complain. Be forgiving. If possible, make it funny. Most of all, do not be angry. Black people are not supposed to be angry about racism. Otherwise you get no sympathy. This applies only for white liberals, by the way. Don’t even bother telling a white conservative about anything racist that happened to you. Because the conservative will tell you that YOU are the real racist and your mouth will hang open in confusion.',1,null,0,null,{ts '2015-09-10 15:59:31.415000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (77,2,'There were people thrice her size on the Trenton platform and she looked admiringly at one of them, a woman in a very short skirt. She thought nothing of slender legs shown off in miniskirts--it was safe and easy, after all, to display legs of which the world approved--but the fat woman''s act was about the quiet conviction that one shared only with oneself, a sense of rightness that others failed to see.',1,null,0,null,{ts '2015-09-10 15:59:31.440000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (78,2,'Oppression Olympics is what smart liberal Americans say to make you feel stupid and to make you shut up. But there IS an oppression olympics going on. American racial minorities - blacks, Hispanics, Asians and Jews - all get shit from white folks, different kinds of shit but shit still. Each secretly believes that it gets the worst shit. So, no, there is no United League of the Oppressed. However, all the others think they''re better than blacks because, well, they''re not black.',1,null,0,null,{ts '2015-09-10 15:59:31.474000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (79,2,'We spend too much time teaching girls to worry about what boys think of them. But the reverse is not the case. We don’t teach boys to care about being likable. We spend too much time telling girls that they cannot be angry or aggressive or tough, which is bad enough, but then we turn around and either praise or excuse men for the same reasons. All over the world, there are so many magazine articles and books telling women what to do, how to be and not to be, in order to attract or please men. There are far fewer guides for men about pleasing women.',37,null,0,null,{ts '2015-09-10 15:59:31.515000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (80,2,'...there was cement in her soul. It had been there for a while, an early morning disease of fatigue, shapeless desires, brief imaginary glints of other lives she could be living, that over the months melded into a piercing homesickness.',1,null,0,null,{ts '2015-09-10 15:59:31.558000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (81,2,'And it''s wrong of you to think that love leaves room for nothing else. It''s possible to love something and still condescend to it.',38,null,0,null,{ts '2015-09-10 15:59:31.634000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (82,2,'She could not complain about not having shoes when the person she was talking to had no legs.',39,null,0,null,{ts '2015-09-10 15:59:31.694000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (83,2,'He was already looking at their relationship through the lens of the past tense. It puzzled her, the ability of romantic love to mutate, how quickly a loved one could become a stranger. Where did the love go? Perhaps real love was familial, somehow, linked to blood, since love for children did not die as romantic love did.',1,null,0,null,{ts '2015-09-10 15:59:31.720000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (84,2,'That her relationship with him was like being content in a house but always sitting by the window and looking out',1,null,0,null,{ts '2015-09-10 15:59:31.762000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (85,2,'This is our world, although the people who drew this map decided to put their own land on top of ours. There is no top or bottom, you see.',38,null,0,null,{ts '2015-09-10 15:59:31.801000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (86,2,'The educated ones leave, the ones with the potential to right the wrongs. They leave the weak behind. The tyrants continue to reign because the weak cannot resist. Do you not see that it is a cycle? Who will break that cycle?',40,null,0,null,{ts '2015-09-10 15:59:31.895000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (87,2,'Richard exhaled. It was like somebody sprinkling pepper on his wound: Thousands of Biafrans were dead, and this man wanted to know if there was anything new about one dead white man. Richard would write about this, the rule of Western journalism: One hundred dead black people equal to one dead white person.',38,null,0,null,{ts '2015-09-10 15:59:31.974000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (88,2,'You Americans, always peering under people''s beds to look for communism.',38,null,0,null,{ts '2015-09-10 15:59:32.300000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (89,2,'Being defiant can be a good thing sometimes," Aunty Ifeoma said. "Defiance is like marijuana - it is not a bad thing when it is used right.',40,null,0,null,{ts '2015-09-10 15:59:32.160000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (90,2,'A woman at a certain age who is unmarried, our society teaches her to see it as a deep personal failure. And a man, after a certain age isn’t married, we just think he hasn’t come around to making his pick.',37,null,0,null,{ts '2015-09-10 15:59:32.400000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (91,2,'Death would be a complete knowingness, but what frightened him was this: not knowing beforehand what it was he would know. ',38,null,0,null,{ts '2015-09-10 15:59:32.700000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (92,2,'Understanding America for the Non-American Black: Thoughts on the Special White Friend One great gift for the Zipped-Up Negro is The White Friend Who Gets It. Sadly, this is not as common as one would wish, but some are lucky to have that white friend who you don’t need to explain shit to. By all means, put this friend to work. Such friends not only get it, but also have great bullshit-detectors and so they totally understand that they can say stuff that you can’t. So there is, in much of America, a stealthy little notion lying in the hearts of many: that white people earned their place at jobs and schools while black people got in because they were black. But in fact, since the beginning of America, white people have been getting jobs because they were white. Many whites with the same qualifications but Negro skin would not have the jobs they have. But don’t ever say this publicly. Let your white friend say it. If you make the mistake of saying this, you will be accused of a curiosity called “playing the race card.” Nobody quite knows what this means. When my father was in school in my NAB (Non American Black) country, many American Blacks could not vote or go to good schools. The reason? Their skin color. Skin color alone was the problem. Today, many Americans say that skin color cannot be part of the solution. Otherwise it is referred to as a curiosity called “reverse racism.” Have your white friend point out how the American Black deal is kind of like you’ve been unjustly imprisoned for many years, then all of a sudden you’re set free, but you get no bus fare. And, by the way, you and the guy who imprisoned you are now automatically equal. If the “slavery was so long ago” thing comes up, have your white friend say that lots of white folks are still inheriting money that their families made a hundred years ago. So if that legacy lives, why not the legacy of slavery? And have your white friend say how funny it is, that American pollsters ask white and black people if racism is over. White people in general say it is over and black people in general say it is not. Funny indeed. More suggestions for what you should have your white friend say? Please post away. And here’s to all the white friends who get it.',1,null,0,null,{ts '2015-09-10 15:59:32.104000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (93,2,'In America, racism exists but racists are all gone. Racists belong to the past. Racists are the thin-lipped mean white people in the movies about the civil rights era. Here’s the thing: the manifestation of racism has changed but the language has not. So if you haven’t lynched somebody then you can’t be called a racist. If you’re not a bloodsucking monster, then you can’t be called a racist. Somebody has to be able to say that racists are not monsters.',1,null,0,null,{ts '2015-09-10 15:59:32.155000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (94,2,'I''m chasing you. I''m going to chase you until you give this a chance.',1,null,0,null,{ts '2015-09-10 15:59:32.204000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (95,2,'He was making her feel small and absurdly petulant and, worse yet, she suspected he was right. She always suspected he was right. For a brief irrational moment, she wished she could walk away from him. Then she wished, more rationally, that she could love him without needing him. Need gave him power without his trying; need was the choicelessness she often felt around him.',38,null,0,null,{ts '2015-09-10 15:59:32.229000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (96,2,'Greatness depends on where you are coming from.',38,null,0,null,{ts '2015-09-10 15:59:32.300000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (97,2,'They themselves mocked Africa, trading stories of absurdity, of stupidity, and they felt safe to mock, because it was a mockery born of longing, and of the heartbroken desire to see a place made whole again.',1,null,0,null,{ts '2015-09-10 15:59:32.317000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (98,2,'There''s something very lazy about the way you have loved him blindly for so long without ever criticizing him. You''ve never even accepted that the man is ugly,'' Kainene said. There was a small smile on her face and then she was laughing, and Olanna could not help but laugh too, because it was not what she had wanted to hear and because hearing it had made her feel better.',38,null,0,null,{ts '2015-09-10 15:59:32.346000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (99,2,'Maybe it’s time to just scrap the word “racist.” Find something new. Like Racial Disorder Syndrome. And we could have different categories for sufferers of this syndrome: mild, medium, and acute.',1,null,0,null,{ts '2015-09-10 15:59:32.402000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (100,2,'To have money, it seemed, was to be consumed by money.',1,null,0,null,{ts '2015-09-10 15:59:32.433000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (101,2,'...he did not want me to seek the whys, because there are some things that happen for which we can formulate no whys, for which whys simply do not exist and, perhaps, are not necessary.',40,null,0,null,{ts '2015-09-10 15:59:32.467000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (102,2,'Each time he suggested they get married, she said no. They were too happy, precariously so, and she wanted to guard that bond; she feared that marriage would flatten it into a prosaic partnership.',38,null,0,null,{ts '2015-09-10 15:59:32.521000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (103,8,'I may not have gone where I intended to go, but I think I have ended up where I needed to be.',41,null,0,null,{ts '2015-09-10 16:26:04.874000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (104,8,'I love deadlines. I love the whooshing noise they make as they go by.',42,null,0,null,{ts '2015-09-10 16:26:04.959000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (105,8,'The story so far: In the beginning the Universe was created. This has made a lot of people very angry and been widely regarded as a bad move.',43,null,0,null,{ts '2015-09-10 16:26:05.130000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (106,8,'I refuse to answer that question on the grounds that I don''t know the answer',null,null,0,null,{ts '2015-09-10 16:26:05.560000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (107,8,'For instance, on the planet Earth, man had always assumed that he was more intelligent than dolphins because he had achieved so much—the wheel, New York, wars and so on—whilst all the dolphins had ever done was muck about in the water having a good time. But conversely, the dolphins had always believed that they were far more intelligent than man—for precisely the same reasons.',45,null,0,null,{ts '2015-09-10 16:26:05.930000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (108,8,'There is a theory which states that if ever anyone discovers exactly what the Universe is for and why it is here, it will instantly disappear and be replaced by something even more bizarre and inexplicable. There is another theory which states that this has already happened.',43,null,0,null,{ts '2015-09-10 16:26:05.116000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (109,8,'The fact that we live at the bottom of a deep gravity well, on the surface of a gas covered planet going around a nuclear fireball 90 million miles away and think this to be normal is obviously some indication of how skewed our perspective tends to be.',46,null,0,null,{ts '2015-09-10 16:26:05.146000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (110,8,'The Guide says there is an art to flying", said Ford, "or rather a knack. The knack lies in learning how to throw yourself at the ground and miss.',47,null,0,null,{ts '2015-09-10 16:26:05.190000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (111,8,'Don''t Panic.',45,null,0,null,{ts '2015-09-10 16:26:05.244000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (112,8,'A learning experience is one of those things that says, ''You know that thing you just did? Don''t do that.',42,null,0,null,{ts '2015-09-10 16:26:05.281000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (113,8,'A common mistake that people make when trying to design something completely foolproof is to underestimate the ingenuity of complete fools.',48,null,0,null,{ts '2015-09-10 16:26:05.313000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (114,8,'Would it save you a lot of time if I just gave up and went mad now?',45,null,0,null,{ts '2015-09-10 16:26:05.361000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (115,8,'Time is an illusion. Lunchtime doubly so.',45,null,0,null,{ts '2015-09-10 16:26:05.425000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (116,8,'The ships hung in the sky in much the same way that bricks don''t.',45,null,0,null,{ts '2015-09-10 16:26:05.459000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (117,8,'Isn''t it enough to see that a garden is beautiful without having to believe that there are fairies at the bottom of it too?',45,null,0,null,{ts '2015-09-10 16:26:05.489000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (118,8,'Nothing travels faster than the speed of light, with the possible exception of bad news, which obeys its own special laws.',48,null,0,null,{ts '2015-09-10 16:26:05.530000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (119,8,'The major problem—one of the major problems, for there are several—one of the many major problems with governing people is that of whom you get to do it; or rather of who manages to get people to let them do it to them. To summarize: it is a well-known fact that those people who must want to rule people are, ipso facto, those least suited to do it. To summarize the summary: anyone who is capable of getting themselves made President should on no account be allowed to do the job.',43,null,0,null,{ts '2015-09-10 16:26:05.560000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (120,8,'He felt that his whole life was some kind of dream and he sometimes wondered whose it was and whether they were enjoying it.',45,null,0,null,{ts '2015-09-10 16:26:05.590000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (121,8,'Space is big. You just won''t believe how vastly, hugely, mind-bogglingly big it is. I mean, you may think it''s a long way down the road to the chemist''s, but that''s just peanuts to space.',45,null,0,null,{ts '2015-09-10 16:26:05.612000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (122,8,'If there''s anything more important than my ego around, I want it caught and shot now.',45,null,0,null,{ts '2015-09-10 16:26:05.631000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (123,8,'I''d far rather be happy than right any day.',45,null,0,null,{ts '2015-09-10 16:26:05.656000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (124,8,'You live and learn. At any rate, you live.',48,null,0,null,{ts '2015-09-10 16:26:05.681000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (125,8,'Let''s think the unthinkable, let''s do the undoable. Let us prepare to grapple with the ineffable itself, and see if we may not eff it after all.',49,null,0,null,{ts '2015-09-10 16:26:05.720000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (126,8,'It is known that there are an infinite number of worlds, simply because there is an infinite amount of space for them to be in. However, not every one of them is inhabited. Therefore, there must be a finite number of inhabited worlds. Any finite number divided by infinity is as near to nothing as makes no odds, so the average population of all the planets in the Universe can be said to be zero. From this it follows that the population of the whole Universe is also zero, and that any people you may meet from time to time are merely the products of a deranged imagination.',43,null,0,null,{ts '2015-09-10 16:26:05.746000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (127,8,'This must be Thursday,'' said Arthur to himself, sinking low over his beer. ''I never could get the hang of Thursdays.',45,null,0,null,{ts '2015-09-10 16:26:05.772000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (128,8,'You know," said Arthur, "it''s at times like this, when I''m trapped in a Vogon airlock with a man from Betelgeuse, and about to die of asphyxiation in deep space that I really wish I''d listened to what my mother told me when I was young." "Why, what did she tell you?" "I don''t know, I didn''t listen.',45,null,0,null,{ts '2015-09-10 16:26:05.793000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (129,8,'I''d take the awe of understanding over the awe of ignorance any day.',42,null,0,null,{ts '2015-09-10 16:26:05.816000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (130,8,'Ford... you''re turning into a penguin. Stop it.',45,null,0,null,{ts '2015-09-10 16:26:05.835000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (131,8,'So this is it," said Arthur, "We are going to die." "Yes," said Ford, "except... no! Wait a minute!" He suddenly lunged across the chamber at something behind Arthur''s line of vision. "What''s this switch?" he cried. "What? Where?" cried Arthur, twisting round. "No, I was only fooling," said Ford, "we are going to die after all.',45,null,0,null,{ts '2015-09-10 16:26:05.864000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (132,8,'Reality is frequently inaccurate.',43,null,0,null,{ts '2015-09-10 16:26:05.890000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (133,8,'I may not have gone where I intended to go, but I think I have ended up where I needed to be.',41,null,0,null,{ts '2015-09-10 16:28:00.244000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (134,8,'I love deadlines. I love the whooshing noise they make as they go by.',42,null,0,null,{ts '2015-09-10 16:28:00.384000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (135,8,'The story so far: In the beginning the Universe was created. This has made a lot of people very angry and been widely regarded as a bad move.',43,null,0,null,{ts '2015-09-10 16:28:00.473000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (136,8,'I refuse to answer that question on the grounds that I don''t know the answer',null,null,0,null,{ts '2015-09-10 16:28:00.556000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (137,8,'For instance, on the planet Earth, man had always assumed that he was more intelligent than dolphins because he had achieved so much—the wheel, New York, wars and so on—whilst all the dolphins had ever done was muck about in the water having a good time. But conversely, the dolphins had always believed that they were far more intelligent than man—for precisely the same reasons.',45,null,0,null,{ts '2015-09-10 16:28:00.591000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (138,8,'There is a theory which states that if ever anyone discovers exactly what the Universe is for and why it is here, it will instantly disappear and be replaced by something even more bizarre and inexplicable. There is another theory which states that this has already happened.',43,null,0,null,{ts '2015-09-10 16:28:00.631000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (139,8,'The fact that we live at the bottom of a deep gravity well, on the surface of a gas covered planet going around a nuclear fireball 90 million miles away and think this to be normal is obviously some indication of how skewed our perspective tends to be.',46,null,0,null,{ts '2015-09-10 16:28:00.678000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (140,8,'The Guide says there is an art to flying", said Ford, "or rather a knack. The knack lies in learning how to throw yourself at the ground and miss.',47,null,0,null,{ts '2015-09-10 16:28:00.736000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (141,8,'Don''t Panic.',45,null,0,null,{ts '2015-09-10 16:28:00.810000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (142,8,'A learning experience is one of those things that says, ''You know that thing you just did? Don''t do that.',42,null,0,null,{ts '2015-09-10 16:28:00.841000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (143,8,'A common mistake that people make when trying to design something completely foolproof is to underestimate the ingenuity of complete fools.',48,null,0,null,{ts '2015-09-10 16:28:00.926000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (144,8,'Would it save you a lot of time if I just gave up and went mad now?',45,null,0,null,{ts '2015-09-10 16:28:01.560000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (145,8,'Time is an illusion. Lunchtime doubly so.',45,null,0,null,{ts '2015-09-10 16:28:01.990000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (146,8,'The ships hung in the sky in much the same way that bricks don''t.',45,null,0,null,{ts '2015-09-10 16:28:01.139000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (147,8,'Isn''t it enough to see that a garden is beautiful without having to believe that there are fairies at the bottom of it too?',45,null,0,null,{ts '2015-09-10 16:28:01.186000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (148,8,'Nothing travels faster than the speed of light, with the possible exception of bad news, which obeys its own special laws.',48,null,0,null,{ts '2015-09-10 16:28:01.223000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (149,8,'The major problem—one of the major problems, for there are several—one of the many major problems with governing people is that of whom you get to do it; or rather of who manages to get people to let them do it to them. To summarize: it is a well-known fact that those people who must want to rule people are, ipso facto, those least suited to do it. To summarize the summary: anyone who is capable of getting themselves made President should on no account be allowed to do the job.',43,null,0,null,{ts '2015-09-10 16:28:01.294000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (150,8,'He felt that his whole life was some kind of dream and he sometimes wondered whose it was and whether they were enjoying it.',45,null,0,null,{ts '2015-09-10 16:28:01.332000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (151,8,'Space is big. You just won''t believe how vastly, hugely, mind-bogglingly big it is. I mean, you may think it''s a long way down the road to the chemist''s, but that''s just peanuts to space.',45,null,0,null,{ts '2015-09-10 16:28:01.363000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (152,8,'If there''s anything more important than my ego around, I want it caught and shot now.',45,null,0,null,{ts '2015-09-10 16:28:01.413000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (153,8,'I''d far rather be happy than right any day.',45,null,0,null,{ts '2015-09-10 16:28:01.458000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (154,8,'You live and learn. At any rate, you live.',48,null,0,null,{ts '2015-09-10 16:28:01.484000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (155,8,'Let''s think the unthinkable, let''s do the undoable. Let us prepare to grapple with the ineffable itself, and see if we may not eff it after all.',49,null,0,null,{ts '2015-09-10 16:28:01.516000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (156,8,'It is known that there are an infinite number of worlds, simply because there is an infinite amount of space for them to be in. However, not every one of them is inhabited. Therefore, there must be a finite number of inhabited worlds. Any finite number divided by infinity is as near to nothing as makes no odds, so the average population of all the planets in the Universe can be said to be zero. From this it follows that the population of the whole Universe is also zero, and that any people you may meet from time to time are merely the products of a deranged imagination.',43,null,0,null,{ts '2015-09-10 16:28:01.542000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (157,8,'This must be Thursday,'' said Arthur to himself, sinking low over his beer. ''I never could get the hang of Thursdays.',45,null,0,null,{ts '2015-09-10 16:28:01.581000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (158,8,'You know," said Arthur, "it''s at times like this, when I''m trapped in a Vogon airlock with a man from Betelgeuse, and about to die of asphyxiation in deep space that I really wish I''d listened to what my mother told me when I was young." "Why, what did she tell you?" "I don''t know, I didn''t listen.',45,null,0,null,{ts '2015-09-10 16:28:01.614000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (159,8,'I''d take the awe of understanding over the awe of ignorance any day.',42,null,0,null,{ts '2015-09-10 16:28:01.662000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (160,8,'Ford... you''re turning into a penguin. Stop it.',45,null,0,null,{ts '2015-09-10 16:28:01.692000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (161,8,'So this is it," said Arthur, "We are going to die." "Yes," said Ford, "except... no! Wait a minute!" He suddenly lunged across the chamber at something behind Arthur''s line of vision. "What''s this switch?" he cried. "What? Where?" cried Arthur, twisting round. "No, I was only fooling," said Ford, "we are going to die after all.',45,null,0,null,{ts '2015-09-10 16:28:01.758000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (162,8,'Reality is frequently inaccurate.',43,null,0,null,{ts '2015-09-10 16:28:01.812000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (163,8,'Anyone who is capable of getting themselves made President should on no account be allowed to do the job.',45,null,0,null,{ts '2015-09-10 16:29:49.269000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (164,8,'First we thought the PC was a calculator. Then we found out how to turn numbers into letters with ASCII — and we thought it was a typewriter. Then we discovered graphics, and we thought it was a television. With the World Wide Web, we''ve realized it''s a brochure.',null,null,0,null,{ts '2015-09-10 16:29:49.403000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (165,8,'My doctor says that I have a malformed public-duty gland and a natural deficiency in moral fibre and that I am therefore excused from saving universes.',47,null,0,null,{ts '2015-09-10 16:29:49.538000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (166,8,'Did I do anything wrong today," he said, "or has the world always been like this and I''ve been too wrapped up in myself to notice?',45,null,0,null,{ts '2015-09-10 16:29:49.573000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (167,8,'A cup of tea would restore my normality." [Hitchhiker''s Guide to the Galaxy, Screenplay]',null,null,0,null,{ts '2015-09-10 16:29:49.619000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (168,8,'Just believe everything I tell you, and it will all be very, very simple.'' Ah, well, I''m not sure I believe that.',47,null,0,null,{ts '2015-09-10 16:29:49.661000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (169,8,'But the plans were on display…” “On display? I eventually had to go down to the cellar to find them.” “That’s the display department.” “With a flashlight.” “Ah, well, the lights had probably gone.” “So had the stairs.” “But look, you found the notice, didn’t you?” “Yes,” said Arthur, “yes I did. It was on display in the bottom of a locked filing cabinet stuck in a disused lavatory with a sign on the door saying ‘Beware of the Leopard.',45,null,0,null,{ts '2015-09-10 16:29:49.750000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (170,8,'Ford!" he said, "there''s an infinite number of monkeys outside who want to talk to us about this script for Hamlet they''ve worked out.',45,null,0,null,{ts '2015-09-10 16:29:49.856000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (171,8,'Arthur: If I asked you where the hell we were, would I regret it? Ford: We''re safe. Arthur: Oh good. Ford: We''re in a small galley cabin in one of the spaceships of the Vogon Constructor Fleet. Arthur: Ah, this is obviously some strange use of the word safe that I wasn''t previously aware of.',45,null,0,null,{ts '2015-09-10 16:29:49.953000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (172,8,'All through my life I''ve had this strange unaccountable feeling that something was going on in the world, something big, even sinister, and no one would tell me what it was." "No," said the old man, "that''s just perfectly normal paranoia. Everyone in the Universe has that.',45,null,0,null,{ts '2015-09-10 16:29:50.530000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (173,8,'Human beings, who are almost unique in having the ability to learn from the experience of others, are also remarkable for their apparent disinclination to do so.',53,null,0,null,{ts '2015-09-10 16:29:50.115000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (174,8,'Capital Letters Were Always The Best Way Of Dealing With Things You Didn''t Have A Good Answer To.',null,null,0,null,{ts '2015-09-10 16:29:50.201000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (175,8,'Life is wasted on the living.',43,null,0,null,{ts '2015-09-10 16:29:50.240000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (176,8,'What''s so unpleasant about being drunk?" "Ask a glass of water!',45,null,0,null,{ts '2015-09-10 16:29:50.288000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (177,8,'I think you ought to know I''m feeling very depressed.',45,null,0,null,{ts '2015-09-10 16:29:50.359000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (178,8,'To summarize the summary of the summary: people are a problem.',43,null,0,null,{ts '2015-09-10 16:29:50.408000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (179,8,'Life,” said Marvin dolefully, “loathe it or ignore it, you can’t like it.',45,null,0,null,{ts '2015-09-10 16:29:50.465000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (180,8,'This is rather as if you imagine a puddle waking up one morning and thinking, ''This is an interesting world I find myself in — an interesting hole I find myself in — fits me rather neatly, doesn''t it? In fact it fits me staggeringly well, must have been made to have me in it!'' This is such a powerful idea that as the sun rises in the sky and the air heats up and as, gradually, the puddle gets smaller and smaller, frantically hanging on to the notion that everything''s going to be alright, because this world was meant to have him in it, was built to have him in it; so the moment he disappears catches him rather by surprise. I think this may be something we need to be on the watch out for.',42,null,0,null,{ts '2015-09-10 16:29:50.537000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (181,8,'If it looks like a duck, and quacks like a duck, we have at least to consider the possibility that we have a small aquatic bird of the family anatidae on our hands.',null,null,0,null,{ts '2015-09-10 16:29:50.595000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (182,8,'The impossible often has a kind of integrity to it which the merely improbable lacks.',41,null,0,null,{ts '2015-09-10 16:29:50.642000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (183,8,'In those days spirits were brave, the stakes were high, men were real men, women were real women and small furry creatures from Alpha Centauri were real small furry creatures from Alpha Centauri.',45,null,0,null,{ts '2015-09-10 16:29:50.680000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (184,8,'It can be very dangerous to see things from somebody else''s point of view without the proper training.',56,null,0,null,{ts '2015-09-10 16:29:50.714000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (185,8,'My universe is my eyes and my ears. Anything else is hearsay.',43,null,0,null,{ts '2015-09-10 16:29:50.740000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (186,8,'Curiously enough, the only thing that went through the mind of the bowl of petunias as it fell was Oh no, not again. Many people have speculated that if we knew exactly why the bowl of petunias had thought that we would know a lot more about the nature of the Universe than we do now.',45,null,0,null,{ts '2015-09-10 16:29:50.756000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (187,8,'The Hitch-Hiker''s Guide to the Galaxy also mentions alcohol. It says that the best drink in existence is the Pan Galactic Gargle Blaster, the effect of which is like having your brains smashed out with a slice of lemon wrapped round a large gold brick.',45,null,0,null,{ts '2015-09-10 16:29:50.794000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (188,8,'Arthur blinked at the screens and felt he was missing something important. Suddenly he realized what it was. "Is there any tea on this spaceship?" he asked.',45,null,0,null,{ts '2015-09-10 16:29:50.913000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (189,8,'I think fish is nice, but then I think that rain is wet, so who am I to judge?',null,null,0,null,{ts '2015-09-10 16:29:50.959000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (190,8,'Arthur Dent: What happens if I press this button? Ford Prefect: I wouldn''t- Arthur Dent: Oh. Ford Prefect: What happened? Arthur Dent: A sign lit up, saying ''Please do not press this button again.',58,null,0,null,{ts '2015-09-10 16:29:51.360000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (191,8,'Another thing that got forgotten was the fact that against all probability a sperm whale had suddenly been called into existence several miles above the surface of an alien planet. And since this is not a naturally tenable position for a whale, this poor innocent creature had very little time to come to terms with its identity as a whale before it then had to come to terms with not being a whale any more. This is a complete record of its thoughts from the moment it began its life till the moment it ended it. Ah … ! What’s happening? it thought. Er, excuse me, who am I? Hello? Why am I here? What’s my purpose in life? What do I mean by who am I? Calm down, get a grip now … oh! this is an interesting sensation, what is it? It’s a sort of … yawning, tingling sensation in my … my … well I suppose I’d better start finding names for things if I want to make any headway in what for the sake of what I shall call an argument I shall call the world, so let’s call it my stomach. Good. Ooooh, it’s getting quite strong. And hey, what’s about this whistling roaring sound going past what I’m suddenly going to call my head? Perhaps I can call that … wind! Is that a good name? It’ll do … perhaps I can find a better name for it later when I’ve found out what it’s for. It must be something very important because there certainly seems to be a hell of a lot of it. Hey! What’s this thing? This … let’s call it a tail – yeah, tail. Hey! I can can really thrash it about pretty good can’t I? Wow! Wow! That feels great! Doesn’t seem to achieve very much but I’ll probably find out what it’s for later on. Now – have I built up any coherent picture of things yet? No. Never mind, hey, this is really exciting, so much to find out about, so much to look forward to, I’m quite dizzy with anticipation … Or is it the wind? There really is a lot of that now isn’t it? And wow! Hey! What’s this thing suddenly coming towards me very fast? Very very fast. So big and flat and round, it needs a big wide sounding name like … ow … ound … round … ground! That’s it! That’s a good name – ground! I wonder if it will be friends with me? And the rest, after a sudden wet thud, was silence. Curiously enough, the only thing that went through the mind of the bowl of petunias as it fell was Oh no, not again. Many people have speculated that if we knew exactly why the bowl of petunias had thought that we would know a lot more about the nature of the universe than we do now.',45,null,0,null,{ts '2015-09-10 16:29:51.910000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (192,8,'and then I decided I was a lemon for a couple of weeks.',47,null,0,null,{ts '2015-09-10 16:29:51.165000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (471,9,'Fairy tales are more than true: not because they tell us that dragons exist, but because they tell us that dragons can be beaten.',171,null,0,null,{ts '2015-09-10 19:06:46.409000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (472,9,'Have you ever been in love? Horrible isn''t it? It makes you so vulnerable. It opens your chest and it opens up your heart and it means that someone can get inside you and mess you up.',172,null,0,null,{ts '2015-09-10 19:06:46.486000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (473,9,'I''ve been making a list of the things they don''t teach you at school. They don''t teach you how to love somebody. They don''t teach you how to be famous. They don''t teach you how to be rich or how to be poor. They don''t teach you how to walk away from someone you don''t love any longer. They don''t teach you how to know what''s going on in someone else''s mind. They don''t teach you what to say to someone who''s dying. They don''t teach you anything worth knowing.',172,null,0,null,{ts '2015-09-10 19:06:46.638000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (474,9,'Sometimes you wake up. Sometimes the fall kills you. And sometimes, when you fall, you fly.',173,null,0,null,{ts '2015-09-10 19:06:46.699000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (475,9,'May your coming year be filled with magic and dreams and good madness. I hope you read some fine books and kiss someone who thinks you''re wonderful, and don''t forget to make some art -- write or draw or build or sing or live as only you can. And I hope, somewhere in the next year, you surprise yourself.',null,null,0,null,{ts '2015-09-10 19:06:46.710000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (476,9,'I can believe things that are true and things that aren''t true and I can believe things where nobody knows if they''re true or not. I can believe in Santa Claus and the Easter Bunny and the Beatles and Marilyn Monroe and Elvis and Mister Ed. Listen - I believe that people are perfectable, that knowledge is infinite, that the world is run by secret banking cartels and is visited by aliens on a regular basis, nice ones that look like wrinkled lemurs and bad ones who mutilate cattle and want our water and our women. I believe that the future sucks and I believe that the future rocks and I believe that one day White Buffalo Woman is going to come back and kick everyone''s ass. I believe that all men are just overgrown boys with deep problems communicating and that the decline in good sex in America is coincident with the decline in drive-in movie theaters from state to state. I believe that all politicians are unprincipled crooks and I still believe that they are better than the alternative. I believe that California is going to sink into the sea when the big one comes, while Florida is going to dissolve into madness and alligators and toxic waste. I believe that antibacterial soap is destroying our resistance to dirt and disease so that one day we''ll all be wiped out by the common cold like martians in War of the Worlds. I believe that the greatest poets of the last century were Edith Sitwell and Don Marquis, that jade is dried dragon sperm, and that thousands of years ago in a former life I was a one-armed Siberian shaman. I believe that mankind''s destiny lies in the stars. I believe that candy really did taste better when I was a kid, that it''s aerodynamically impossible for a bumble bee to fly, that light is a wave and a particle, that there''s a cat in a box somewhere who''s alive and dead at the same time (although if they don''t ever open the box to feed it it''ll eventually just be two different kinds of dead), and that there are stars in the universe billions of years older than the universe itself. I believe in a personal god who cares about me and worries and oversees everything I do. I believe in an impersonal god who set the universe in motion and went off to hang with her girlfriends and doesn''t even know that I''m alive. I believe in an empty and godless universe of causal chaos, background noise, and sheer blind luck. I believe that anyone who says sex is overrated just hasn''t done it properly. I believe that anyone who claims to know what''s going on will lie about the little things too. I believe in absolute honesty and sensible social lies. I believe in a woman''s right to choose, a baby''s right to live, that while all human life is sacred there''s nothing wrong with the death penalty if you can trust the legal system implicitly, and that no one but a moron would ever trust the legal system. I believe that life is a game, that life is a cruel joke, and that life is what happens when you''re alive and that you might as well lie back and enjoy it.',174,null,0,null,{ts '2015-09-10 19:06:46.760000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (477,9,'I hope that in this year to come, you make mistakes. Because if you are making mistakes...you''re Doing Something.',null,null,0,null,{ts '2015-09-10 19:06:46.787000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (478,9,'Life is a disease: sexually transmitted, and invariably fatal.',null,null,0,null,{ts '2015-09-10 19:06:46.800000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (479,9,'Have you ever been in love? Horrible isn''t it? It makes you so vulnerable. It opens your chest and it opens up your heart and it means that someone can get inside you and mess you up. You build up all these defenses, you build up a whole suit of armor, so that nothing can hurt you, then one stupid person, no different from any other stupid person, wanders into your stupid life...You give them a piece of you. They didn''t ask for it. They did something dumb one day, like kiss you or smile at you, and then your life isn''t your own anymore. Love takes hostages. It gets inside you. It eats you out and leaves you crying in the darkness, so simple a phrase like ''maybe we should be just friends'' turns into a glass splinter working its way into your heart. It hurts. Not just in the imagination. Not just in the mind. It''s a soul-hurt, a real gets-inside-you-and-rips-you-apart pain. I hate love.',172,null,0,null,{ts '2015-09-10 19:06:46.817000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (480,9,'Everybody has a secret world inside of them. I mean everybody. All of the people in the whole world, I mean everybody — no matter how dull and boring they are on the outside. Inside them they''ve all got unimaginable, magnificent, wonderful, stupid, amazing worlds... Not just one world. Hundreds of them. Thousands, maybe.',175,null,0,null,{ts '2015-09-10 19:06:46.841000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (481,9,'People think dreams aren''t real just because they aren''t made of matter, of particles. Dreams are real. But they are made of viewpoints, of images, of memories and puns and lost hopes.',null,null,0,null,{ts '2015-09-10 19:06:46.908000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (482,9,'What I say is, a town isn''t a town without a bookstore. It may call itself a town, but unless it''s got a bookstore it knows it''s not fooling a soul.',174,null,0,null,{ts '2015-09-10 19:06:46.976000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (483,9,'When I was a child, adults would tell me not to make things up, warning me of what would happen if I did. As far as I can tell so far, it seems to involve lots of foreign travel and not having to get up too early in the morning.',176,null,0,null,{ts '2015-09-10 19:06:47.100000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (484,9,'There are so many fragile things, after all. People break so easily, and so do dreams and hearts.',177,null,0,null,{ts '2015-09-10 19:06:47.260000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (485,9,'She says nothing at all, but simply stares upward into the dark sky and watches, with sad eyes, the slow dance of the infinite stars.',178,null,0,null,{ts '2015-09-10 19:06:47.540000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (486,9,'Tomorrow may be hell, but today was a good writing day, and on the good writing days nothing else matters.',null,null,0,null,{ts '2015-09-10 19:06:47.990000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (487,9,'Most books on witchcraft will tell you that witches work naked. This is because most books on witchcraft were written by men.',null,null,0,null,{ts '2015-09-10 19:06:47.206000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (488,9,'Being a writer is a very peculiar sort of a job: it''s always you versus a blank sheet of paper (or a blank screen) and quite often the blank piece of paper wins.',null,null,0,null,{ts '2015-09-10 19:06:47.260000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (489,9,'Things need not have happened to be true. Tales and dreams are the shadow-truths that will endure when mere facts are dust and ashes, and forgot.',179,null,0,null,{ts '2015-09-10 19:06:47.305000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (490,9,'She seems so cool, so focused, so quiet, yet her eyes remain fixed upon the horizon. You think you know all there is to know about her immediately upon meeting her, but everything you think you know is wrong. Passion flows through her like a river of blood. She only looked away for a moment, and the mask slipped, and you fell. All your tomorrows start here.',177,null,0,null,{ts '2015-09-10 19:06:47.339000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (491,9,'I hope you will have a wonderful year, that you''ll dream dangerously and outrageously, that you''ll make something that didn''t exist before you made it, that you will be loved and that you will be liked, and that you will have people to love and to like in return. And, most importantly (because I think there should be more kindness and more wisdom in the world right now), that you will, when you need to be, be wise, and that you will always be kind.',null,null,0,null,{ts '2015-09-10 19:06:47.375000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (492,9,'[D]on''t ever apologize to an author for buying something in paperback, or taking it out from a library (that''s what they''re there for. Use your library). Don''t apologize to this author for buying books second hand, or getting them from bookcrossing or borrowing a friend''s copy. What''s important to me is that people read the books and enjoy them, and that, at some point in there, the book was bought by someone. And that people who like things, tell other people. The most important thing is that people read... ',null,null,0,null,{ts '2015-09-10 19:06:47.444000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (493,9,'This is how you do it: you sit down at the keyboard and you put one word after another until its done. It''s that easy, and that hard.',null,null,0,null,{ts '2015-09-10 19:06:47.507000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (494,9,'You get what anybody gets - you get a lifetime.',180,null,0,null,{ts '2015-09-10 19:06:47.540000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (495,9,'I lived in books more than I lived anywhere else.',181,null,0,null,{ts '2015-09-10 19:06:47.574000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (496,9,'When we hold each other, in the darkness, it doesn''t make the darkness go away. The bad things are still out there. The nightmares still walking. When we hold each other we feel not safe, but better. "It''s all right" we whisper, "I''m here, I love you." and we lie: "I''ll never leave you." For just a moment or two the darkness doesn''t seem so bad.',182,null,0,null,{ts '2015-09-10 19:06:47.609000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (497,9,'In a perfect world, you could fuck people without giving them a piece of your heart. And every glittering kiss and every touch of flesh is another shard of heart you’ll never see again.',177,null,0,null,{ts '2015-09-10 19:06:47.642000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (498,9,'Stories you read when you''re the right age never quite leave you. You may forget who wrote them or what the story was called. Sometimes you''ll forget precisely what happened, but if a story touches you it will stay with you, haunting the places in your mind that you rarely ever visit.',183,null,0,null,{ts '2015-09-10 19:06:47.709000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (499,9,'I hope that in this year to come, you make mistakes. Because if you are making mistakes, then you are making new things, trying new things, learning, living, pushing yourself, changing yourself, changing your world. You''re doing things you''ve never done before, and more importantly, you''re Doing Something. So that''s my wish for you, and all of us, and my wish for myself. Make New Mistakes. Make glorious, amazing mistakes. Make mistakes nobody''s ever made before. Don''t freeze, don''t stop, don''t worry that it isn''t good enough, or it isn''t perfect, whatever it is: art, or love, or work or family or life. Whatever it is you''re scared of doing, Do it. Make your mistakes, next year and forever.',null,null,0,null,{ts '2015-09-10 19:06:47.768000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (500,9,'I don''t want whatever I want. Nobody does. Not really. What kind of fun would it be if I just got everything I ever wanted just like that, and it didn''t mean anything? What then?',171,null,0,null,{ts '2015-09-10 19:06:47.893000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (501,9,'Grown-ups don''t look like grown-ups on the inside either. Outside, they''re big and thoughtless and they always know what they''re doing. Inside, they look just like they always have. Like they did when they were your age. Truth is, there aren''t any grown-ups. Not one, in the whole wide world.',181,null,0,null,{ts '2015-09-10 19:13:14.574000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (502,9,'There are a hundred things she has tried to chase away the things she won''t remember and that she can''t even let herself think about because that''s when the birds scream and the worms crawl and somewhere in her mind it''s always raining a slow and endless drizzle. You will hear that she has left the country, that there was a gift she wanted you to have, but it is lost before it reaches you. Late one night the telephone will sign, and a voice that might be hers will say something that you cannot interpret before the connection crackles and is broken. Several years later, from a taxi, you will see someone in a doorway who looks like her, but she will be gone by the time you persuade the driver to stop. You will never see her again. Whenever it rains you will think of her. ',null,null,0,null,{ts '2015-09-10 19:13:14.614000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (503,9,'You''re always you, and that don''t change, and you''re always changing, and there''s nothing you can do about it.',184,null,0,null,{ts '2015-09-10 19:13:14.676000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (504,9,'I think I fell in love with her, a little bit. Isn''t that dumb? But it was like I knew her. Like she was my oldest, dearest friend. The kind of person you can tell anything to, no matter how bad, and they''ll still love you, because they know you. I wanted to go with her. I wanted her to notice me. And then she stopped walking. Under the moon, she stopped. And looked at us. She looked at me. Maybe she was trying to tell me something; I don''t know. She probably didn''t even know I was there. But I''ll always love her. All my life.',185,null,0,null,{ts '2015-09-10 19:13:14.742000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (505,9,'What''s your name,'' Coraline asked the cat. ''Look, I''m Coraline. Okay?'' ''Cats don''t have names,'' it said. ''No?'' said Coraline. ''No,'' said the cat. ''Now you people have names. That''s because you don''t know who you are. We know who we are, so we don''t need names.',171,null,0,null,{ts '2015-09-10 19:13:14.804000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (506,9,'Because,'' she said, ''when you''re scared but you still do it anyway, that''s brave.',171,null,0,null,{ts '2015-09-10 19:13:14.883000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (507,9,'Face your life, its pain, its pleasure, leave no path untaken.',184,null,0,null,{ts '2015-09-10 19:13:14.992000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (508,9,'It''s like the people who believe they''ll be happy if they go and live somewhere else, but who learn it doesn''t work that way. Wherever you go, you take yourself with you. If you see what I mean.',184,null,0,null,{ts '2015-09-10 19:13:15.870000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (509,9,'It may help to understand human affairs to be clear that most of the great triumphs and tragedies of history are caused, not by people being fundamentally good or fundamentally bad, but by people being fundamentally people.',186,null,0,null,{ts '2015-09-10 19:13:15.186000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (510,9,'Picking five favorite books is like picking the five body parts you''d most like not to lose.',null,null,0,null,{ts '2015-09-10 19:13:15.295000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (511,9,'Stories may well be lies, but they are good lies that say true things, and which can sometimes pay the rent.',null,null,0,null,{ts '2015-09-10 19:13:15.331000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (512,9,'Books make great gifts because they have whole worlds inside of them. And it''s much cheaper to buy somebody a book than it is to buy them the whole world!',null,null,0,null,{ts '2015-09-10 19:13:15.386000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (513,9,'Each person who ever was or is or will be has a song. It isn''t a song that anybody else wrote. It has its own melody, it has its own words. Very few people get to sing their song. Most of us fear that we cannot do it justice with our voices, or that our words are too foolish or too honest, or too odd. So people live their song instead.',187,null,0,null,{ts '2015-09-10 19:13:15.426000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (514,9,'I am selfish, private and easily bored. Will this be a problem?',188,null,0,null,{ts '2015-09-10 19:13:15.473000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (515,9,'Let us begin this letter, this prelude to an encounter, formally, as a declaration, in the old-fashioned way: I love you. You do not know me (although you have seen me, smiled at me). I know you (although not so well as I would like. I want to be there when your eyes flutter open in the morning, and you see me, and you smile. Surely this would be paradise enough?). So I do declare myself to you now, with pen set to paper. I declare it again: I love you.',null,null,0,null,{ts '2015-09-10 19:13:15.504000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (516,9,'I would like to see anyone, prophet, king or God, convince a thousand cats to do the same thing at the same time.',null,null,0,null,{ts '2015-09-10 19:13:15.561000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (517,9,'Hey," said Shadow. "Huginn or Muninn, or whoever you are." The bird turned, head tipped, suspiciously, on one side, and it stared at him with bright eyes. "Say ''Nevermore,''" said Shadow. "Fuck you," said the raven.',174,null,0,null,{ts '2015-09-10 19:13:15.676000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (518,9,'I do not miss childhood, but I miss the way I took pleasure in small things, even as greater things crumbled. I could not control the world I was in, could not walk away from things or people or moments that hurt, but I took joy in the things that made me happy.',181,null,0,null,{ts '2015-09-10 19:13:15.747000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (519,9,'Sometimes we can choose the paths we follow. Sometimes our choices are made for us. And sometimes we have no choice at all.',189,null,0,null,{ts '2015-09-10 19:13:15.791000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (520,9,'Books were safer than other people anyway.',181,null,0,null,{ts '2015-09-10 19:13:15.810000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (521,9,'That which is dreamed can never be lost, can never be undreamed.',190,null,0,null,{ts '2015-09-10 19:13:15.870000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (522,9,'Then, one stupid person, no different from any other stupid person, wanders into your stupid life...you give them a piece of you. They don''t ask for it. They do something dumb one day like kiss you or smile at you, and then your life isn''t your own anymore.',172,null,0,null,{ts '2015-09-10 19:13:15.905000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (523,9,'You''ve a good heart. Sometimes that''s enough to see you safe wherever you go. But mostly, it''s not.',191,null,0,null,{ts '2015-09-10 19:13:15.984000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (524,9,'A book is a dream that you hold in your hands." (As quoted on BookRiot, June 18, 2013)',null,null,0,null,{ts '2015-09-10 19:13:16.940000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (525,9,'We...we could be friends.'' We COULD be rare specimens of an exotic breed of dancing African elephants, but we''re not. At least, I''M not.',171,null,0,null,{ts '2015-09-10 19:13:16.128000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (526,9,'Nobody looks like what they really are on the inside. You don’t. I don’t. People are much more complicated than that. It’s true of everybody.',181,null,0,null,{ts '2015-09-10 19:13:16.184000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (527,9,'Sleep my little baby-oh Sleep until you waken When you wake you''ll see the world If I''m not mistaken... Kiss a lover Dance a measure, Find your name And buried treasure... Face your life Its pain, Its pleasure, Leave no path untaken.',184,null,0,null,{ts '2015-09-10 19:13:16.324000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (528,9,'An Angel who did not so much Fall as Saunter Vaguely Downwards.',186,null,0,null,{ts '2015-09-10 19:13:16.402000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (529,9,'He had noticed that events were cowards: they didn''t occur singly, but instead they would run in packs and leap out at him all at once.',191,null,0,null,{ts '2015-09-10 19:13:16.431000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (530,9,'All your questions can be answered, if that is what you want. But once you learn your answers, you can never unlearn them.',174,null,0,null,{ts '2015-09-10 19:13:16.468000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (531,10,'If you tell the truth, you don''t have to remember anything.',null,null,0,null,{ts '2015-09-11 16:08:38.590000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (532,10,'Whenever you find yourself on the side of the majority, it is time to pause and reflect.',null,null,0,null,{ts '2015-09-11 16:08:38.755000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (533,10,'Good friends, good books, and a sleepy conscience: this is the ideal life.',null,null,0,null,{ts '2015-09-11 16:08:38.991000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (534,10,'The man who does not read has no advantage over the man who cannot read.',null,null,0,null,{ts '2015-09-11 16:08:39.940000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (535,10,'Never put off till tomorrow what may be done day after tomorrow just as well.',null,null,0,null,{ts '2015-09-11 16:08:39.235000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (536,10,'I have never let my schooling interfere with my education.',null,null,0,null,{ts '2015-09-11 16:08:39.318000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (537,10,'Classic'' - a book which people praise and don''t read.',null,null,0,null,{ts '2015-09-11 16:08:39.387000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (538,10,'The fear of death follows from the fear of life. A man who lives fully is prepared to die at any time.',null,null,0,null,{ts '2015-09-11 16:08:39.455000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (539,10,'Never tell the truth to people who are not worthy of it.',null,null,0,null,{ts '2015-09-11 16:08:39.508000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (540,10,'Keep away from people who try to belittle your ambitions. Small people always do that, but the really great make you feel that you, too, can become great.',null,null,0,null,{ts '2015-09-11 16:08:39.569000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (541,10,'In a good bookroom you feel in some mysterious way that you are absorbing the wisdom contained in all the books through your skin, without even opening them.',null,null,0,null,{ts '2015-09-11 16:08:39.663000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (542,10,'Reader, suppose you were an idiot. And suppose you were a member of Congress. But I repeat myself.',null,null,0,null,{ts '2015-09-11 16:08:39.738000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (543,10,'Substitute ''damn'' every time you''re inclined to write ''very;'' your editor will delete it and the writing will be just as it should be.',null,null,0,null,{ts '2015-09-11 16:08:39.818000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (544,10,'Don’t go around saying the world owes you a living. The world owes you nothing. It was here first.',null,null,0,null,{ts '2015-09-11 16:08:39.875000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (545,10,'God created war so that Americans would learn geography.',null,null,0,null,{ts '2015-09-11 16:08:39.983000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (546,10,'I did not attend his funeral, but I sent a nice letter saying I approved of it.',null,null,0,null,{ts '2015-09-11 16:08:40.690000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (547,10,'But who prays for Satan? Who, in eighteen centuries, has had the common humanity to pray for the one sinner that needed it most?',null,null,0,null,{ts '2015-09-11 16:08:40.193000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (548,10,'I was gratified to be able to answer promptly, and I did. I said I didn’t know.',null,null,0,null,{ts '2015-09-11 16:08:40.249000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (549,10,'Life is short, Break the Rules. Forgive quickly, Kiss SLOWLY. Love truly. Laugh uncontrollably And never regret ANYTHING That makes you smile.',null,null,0,null,{ts '2015-09-11 16:08:40.285000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (550,10,'Never allow someone to be your priority while allowing yourself to be their option.',null,null,0,null,{ts '2015-09-11 16:08:40.338000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (551,10,'The difference between the right word and the almost right word is the difference between lightning and a lightning bug.',192,null,0,null,{ts '2015-09-11 16:08:40.394000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (552,10,'Loyalty to country ALWAYS. Loyalty to government, when it deserves it.',null,null,0,null,{ts '2015-09-11 16:08:40.441000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (553,10,'Wrinkles should merely indicate where the smiles have been.',null,null,0,null,{ts '2015-09-11 16:08:40.523000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (554,10,'Truth is stranger than fiction, but it is because Fiction is obliged to stick to possibilities; Truth isn''t.',193,null,0,null,{ts '2015-09-11 16:08:40.608000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (555,10,'Books are for people who wish they were somewhere else.',null,null,0,null,{ts '2015-09-11 16:08:40.641000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (556,10,'What would men be without women? Scarce, sir...mighty scarce.',null,null,0,null,{ts '2015-09-11 16:08:40.685000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (557,10,'I do not fear death. I had been dead for billions and billions of years before I was born, and had not suffered the slightest inconvenience from it.',null,null,0,null,{ts '2015-09-11 16:08:40.776000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (558,10,'Sanity and happiness are an impossible combination.',null,null,0,null,{ts '2015-09-11 16:08:40.830000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (559,10,'Clothes make the man. Naked people have little or no influence on society.',null,null,0,null,{ts '2015-09-11 16:08:40.882000'});
INSERT INTO "QUOTES"."QUOTATION" (ID,AUTHOR_ID,QUOTE_TEXT,Q_SOURCE,POSTING_USER,REPORTED,POSTING_DATE,ENTRY_DATE) VALUES (560,10,'Don''t part with your illusions. When they are gone you may still exist, but you have ceased to live.',null,null,0,null,{ts '2015-09-11 16:08:40.922000'});


INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (1,2,'Americanah',null,0,null,null,null,{ts '2015-09-10 14:46:26.956000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (37,2,'We Should All Be Feminists',null,0,null,null,null,{ts '2015-09-10 15:24:33.228000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (38,2,'Half of a Yellow Sun',null,0,null,null,null,{ts '2015-09-10 15:24:33.368000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (39,2,'The Thing Around Your Neck',null,0,null,null,null,{ts '2015-09-10 15:24:33.395000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (40,2,'Purple Hibiscus',null,0,null,null,null,{ts '2015-09-10 15:24:33.527000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (41,8,'The Long Dark Tea-Time of the Soul',null,0,null,null,null,{ts '2015-09-10 16:26:04.846000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (42,8,'The Salmon of Doubt',null,0,null,null,null,{ts '2015-09-10 16:26:04.955000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (43,8,'The Restaurant at the End of the Universe',null,0,null,null,null,{ts '2015-09-10 16:26:05.800000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (45,8,'The Hitchhiker''s Guide to the Galaxy',null,0,null,null,null,{ts '2015-09-10 16:26:05.880000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (46,8,'The Salmon of Doubt: Hitchhiking the Galaxy One Last Time',null,0,null,null,null,{ts '2015-09-10 16:26:05.142000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (47,8,'Life, the Universe and Everything',null,0,null,null,null,{ts '2015-09-10 16:26:05.185000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (48,8,'Mostly Harmless',null,0,null,null,null,{ts '2015-09-10 16:26:05.308000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (49,8,'Dirk Gently''s Holistic Detective Agency',null,0,null,null,null,{ts '2015-09-10 16:26:05.716000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (53,8,'Last Chance to See',null,0,null,null,null,{ts '2015-09-10 16:29:50.104000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (56,8,'The Ultimate Hitchhiker''s Guide : Five Complete Novels and One Story',null,0,null,null,null,{ts '2015-09-10 16:29:50.702000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (58,8,'The Original Hitchhiker Radio Scripts',null,0,null,null,null,{ts '2015-09-10 16:29:50.995000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (171,9,'Coraline',null,0,null,null,null,{ts '2015-09-10 18:44:57.983000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (172,9,'The Sandman, Vol. 9: The Kindly Ones',null,0,null,null,null,{ts '2015-09-10 18:44:58.730000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (173,9,'The Sandman, Vol. 6: Fables and Reflections',null,0,null,null,null,{ts '2015-09-10 18:44:58.275000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (174,9,'American Gods',null,0,null,null,null,{ts '2015-09-10 19:06:46.753000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (175,9,'The Sandman, Vol. 5: A Game of You',null,0,null,null,null,{ts '2015-09-10 19:06:46.830000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (176,9,'Smoke and Mirrors',null,0,null,null,null,{ts '2015-09-10 19:06:47.800000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (177,9,'Fragile Things: Short Fictions and Wonders',null,0,null,null,null,{ts '2015-09-10 19:06:47.250000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (178,9,'Stardust',null,0,null,null,null,{ts '2015-09-10 19:06:47.470000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (179,9,'The Sandman, Vol. 3: Dream Country',null,0,null,null,null,{ts '2015-09-10 19:06:47.294000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (180,9,'The Sandman, Vol. 1: Preludes and Nocturnes',null,0,null,null,null,{ts '2015-09-10 19:06:47.536000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (181,9,'The Ocean at the End of the Lane',null,0,null,null,null,{ts '2015-09-10 19:06:47.568000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (182,9,'Neil Gaiman''s Midnight Days',null,0,null,null,null,{ts '2015-09-10 19:06:47.602000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (183,9,'M Is for Magic',null,0,null,null,null,{ts '2015-09-10 19:06:47.707000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (184,9,'The Graveyard Book',null,0,null,null,null,{ts '2015-09-10 19:13:14.671000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (185,9,'The Sandman, Vol. 8: Worlds'' End',null,0,null,null,null,{ts '2015-09-10 19:13:14.738000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (186,9,'Good Omens: The Nice and Accurate Prophecies of Agnes Nutter, Witch',null,0,null,null,null,{ts '2015-09-10 19:13:15.183000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (187,9,'Anansi Boys',null,0,null,null,null,{ts '2015-09-10 19:13:15.422000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (188,9,'A Study in Emerald',null,0,null,null,null,{ts '2015-09-10 19:13:15.453000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (189,9,'The Sandman, Vol. 4: Season of Mists',null,0,null,null,null,{ts '2015-09-10 19:13:15.786000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (190,9,'The Sandman, Vol. 10: The Wake',null,0,null,null,null,{ts '2015-09-10 19:13:15.865000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (191,9,'Neverwhere',null,0,null,null,null,{ts '2015-09-10 19:13:15.954000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (192,10,'The Wit and Wisdom of Mark Twain',null,0,null,null,null,{ts '2015-09-11 16:08:40.391000'});
INSERT INTO "QUOTES"."QUOTE_SOURCE" (ID,AUTHOR_ID,SOURCE_TITLE,ISBN,PUBLICATION_YEAR,PUBLISHER,LANGUAGE,CREATING_USER,CREATION_DATE) VALUES (193,10,'Following the Equator: A Journey Around the World',null,0,null,null,null,{ts '2015-09-11 16:08:40.575000'});


INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (73,12,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (73,11,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (73,10,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (73,9,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (81,15,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (81,14,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (81,13,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (84,16,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (86,21,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (86,20,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (86,19,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (86,18,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (86,17,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (87,23,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (87,22,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (94,15,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (96,25,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (96,24,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (99,22,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (102,26,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (103,28,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (103,27,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (104,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (104,32,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (104,31,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (104,30,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (104,29,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (105,34,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (105,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (106,36,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (106,35,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (106,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (107,29,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (108,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (109,38,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (109,37,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (109,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (110,41,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (110,40,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (110,39,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (110,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (111,44,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (111,43,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (111,42,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (111,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (112,28,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (113,47,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (113,46,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (113,45,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (114,52,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (114,51,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (114,50,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (114,49,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (114,48,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (114,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (115,53,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (115,52,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (115,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (116,29,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (117,56,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (117,55,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (117,54,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (118,57,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (118,52,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (118,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (119,60,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (119,59,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (119,58,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (119,40,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (120,61,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (121,37,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (121,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (122,63,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (122,62,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (123,65,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (123,64,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (124,66,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (125,53,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (126,29,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (127,67,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (127,28,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (128,68,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (129,69,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (129,54,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (131,70,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (131,37,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (131,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (132,71,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (133,28,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (133,27,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (134,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (134,32,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (134,31,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (134,30,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (134,29,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (135,34,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (135,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (136,36,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (136,35,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (136,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (137,29,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (138,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (139,38,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (139,37,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (139,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (140,41,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (140,40,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (140,39,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (140,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (141,44,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (141,43,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (141,42,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (141,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (142,28,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (143,47,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (143,46,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (143,45,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (144,52,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (144,51,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (144,50,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (144,49,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (144,48,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (144,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (145,53,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (145,52,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (145,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (146,29,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (147,56,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (147,55,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (147,54,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (148,57,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (148,52,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (148,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (149,60,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (149,59,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (149,58,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (149,40,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (150,61,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (151,37,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (151,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (152,63,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (152,62,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (153,65,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (153,64,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (154,66,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (155,53,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (156,29,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (157,67,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (157,28,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (158,68,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (159,69,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (159,54,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (161,70,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (161,37,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (161,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (162,71,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (163,74,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (163,73,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (163,72,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (163,58,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (164,76,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (164,75,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (164,37,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (165,52,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (165,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (167,77,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (168,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (169,82,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (169,81,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (169,80,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (169,79,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (169,78,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (169,68,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (169,29,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (170,83,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (170,68,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (171,88,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (171,87,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (171,86,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (171,85,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (171,84,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (171,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (172,89,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (173,90,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (175,91,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (176,93,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (176,92,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (176,29,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (177,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (178,94,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (178,58,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (178,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (179,52,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (179,29,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (180,96,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (180,95,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (180,54,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (182,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (184,97,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (186,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (187,99,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (187,98,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (187,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (188,77,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (188,68,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (188,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (189,100,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (189,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (190,101,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (191,103,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (191,102,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (192,107,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (192,106,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (192,105,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (192,104,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (471,111,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (471,110,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (471,109,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (471,108,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (471,91,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (472,15,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (473,119,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (473,118,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (473,117,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (473,116,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (473,115,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (473,114,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (473,113,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (473,112,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (473,71,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (473,15,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (474,120,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (476,121,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (479,15,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (481,122,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (481,61,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (482,124,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (482,123,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (482,109,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (486,32,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (487,128,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (487,127,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (487,126,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (487,125,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (487,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (488,32,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (489,122,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (490,129,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (490,91,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (491,130,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (492,133,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (492,132,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (492,131,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (492,109,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (493,32,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (494,28,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (495,109,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (497,134,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (497,15,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (498,138,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (498,137,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (498,136,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (498,135,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (498,28,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (499,141,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (499,140,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (499,139,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (500,144,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (500,143,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (500,142,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (502,146,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (502,145,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (503,147,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (504,149,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (504,148,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (504,15,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (505,152,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (505,151,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (505,150,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (506,91,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (507,155,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (507,154,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (507,153,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (507,28,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (508,157,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (508,156,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (509,158,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (509,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (510,159,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (510,109,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (511,32,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (512,160,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (512,109,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (513,161,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (515,162,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (515,15,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (516,168,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (516,167,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (516,166,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (516,165,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (516,164,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (516,163,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (516,152,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (517,173,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (517,172,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (517,171,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (517,170,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (517,169,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (517,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (518,174,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (518,64,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (520,178,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (520,177,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (520,176,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (520,175,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (520,109,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (521,179,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (522,181,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (522,180,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (522,28,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (522,15,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (523,184,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (523,183,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (523,182,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (523,28,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (524,109,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (524,61,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (525,185,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (525,152,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (525,149,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (526,189,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (526,188,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (526,187,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (526,186,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (527,196,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (527,195,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (527,194,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (527,193,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (527,192,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (527,191,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (527,190,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (527,155,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (527,154,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (527,153,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (527,28,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (527,15,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (529,197,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (531,200,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (531,199,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (531,198,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (531,73,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (532,205,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (532,204,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (532,203,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (532,202,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (532,201,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (532,190,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (533,207,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (533,206,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (533,149,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (533,109,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (533,28,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (534,209,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (534,208,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (534,35,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (535,210,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (535,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (536,35,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (536,19,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (537,211,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (537,132,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (537,109,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (538,148,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (538,28,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (539,73,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (540,25,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (541,212,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (541,205,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (541,131,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (541,109,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (542,58,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (542,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (543,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (543,32,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (544,213,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (544,183,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (545,216,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (545,215,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (545,214,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (546,219,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (546,218,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (546,217,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (546,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (547,220,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (548,221,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (548,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (549,222,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (550,223,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (551,32,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (552,224,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (552,58,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (553,225,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (554,109,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (554,73,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (555,226,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (556,127,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (556,126,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (556,33,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (557,148,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (557,91,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (558,227,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (558,64,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (559,228,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (560,229,null);
INSERT INTO "QUOTES"."QUOTE_TAG" (QUOTE_ID,TAG_ID,CREATING_USER) VALUES (560,28,null);


INSERT INTO "QUOTES"."REGISTERED_USER" (USER_NAME,PASSWORD,FIRST_NAME,LAST_NAME,EMAIL,TRUST_FACTOR,CREATION_DATE) VALUES ('admin','blob',null,null,'colerathjen@hotmail.com',0,{ts '2015-09-10 11:25:56.550000'});
INSERT INTO "QUOTES"."REGISTERED_USER" (USER_NAME,PASSWORD,FIRST_NAME,LAST_NAME,EMAIL,TRUST_FACTOR,CREATION_DATE) VALUES ('bill','nye','Bill','Nye the Science Guy','bnye@test.com',0,{ts '2015-09-10 11:25:56.550000'});




INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (9,'race',null,{ts '2015-09-10 15:07:10.624000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (10,'african-authors',null,{ts '2015-09-10 15:07:10.634000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (11,'immigration',null,{ts '2015-09-10 15:07:10.636000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (12,'nigeria',null,{ts '2015-09-10 15:07:10.639000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (13,'kainene',null,{ts '2015-09-10 15:07:10.939000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (14,'justice',null,{ts '2015-09-10 15:07:10.947000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (15,'love',null,{ts '2015-09-10 15:07:10.958000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (16,'lovers-sadness',null,{ts '2015-09-10 15:07:11.730000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (17,'voice',null,{ts '2015-09-10 15:07:11.210000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (18,'oppression',null,{ts '2015-09-10 15:07:11.223000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (19,'education',null,{ts '2015-09-10 15:07:11.230000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (20,'revolution',null,{ts '2015-09-10 15:07:11.239000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (21,'fight',null,{ts '2015-09-10 15:07:11.248000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (22,'racism',null,{ts '2015-09-10 15:07:11.307000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (23,'western-journalism',null,{ts '2015-09-10 15:07:11.316000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (24,'relativism',null,{ts '2015-09-10 15:07:11.704000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (25,'greatness',null,{ts '2015-09-10 15:07:11.710000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (26,'marriage',null,{ts '2015-09-10 15:07:11.907000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (27,'navigation',null,{ts '2015-09-10 16:26:04.885000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (28,'life',null,{ts '2015-09-10 16:26:04.889000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (29,'humour',null,{ts '2015-09-10 16:26:04.963000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (30,'work',null,{ts '2015-09-10 16:26:04.966000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (31,'deadlines',null,{ts '2015-09-10 16:26:04.970000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (32,'writing',null,{ts '2015-09-10 16:26:04.973000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (33,'humor',null,{ts '2015-09-10 16:26:04.976000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (34,'scifi',null,{ts '2015-09-10 16:26:05.170000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (35,'attributed-no-source',null,{ts '2015-09-10 16:26:05.600000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (36,'wit',null,{ts '2015-09-10 16:26:05.640000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (37,'science',null,{ts '2015-09-10 16:26:05.150000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (38,'perspective',null,{ts '2015-09-10 16:26:05.153000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (39,'flight',null,{ts '2015-09-10 16:26:05.194000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (40,'hg2g',null,{ts '2015-09-10 16:26:05.198000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (41,'flying',null,{ts '2015-09-10 16:26:05.202000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (42,'panic',null,{ts '2015-09-10 16:26:05.250000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (43,'h2g2',null,{ts '2015-09-10 16:26:05.254000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (44,'hitchhiker-s-guide',null,{ts '2015-09-10 16:26:05.256000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (45,'ingenuity',null,{ts '2015-09-10 16:26:05.316000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (46,'design',null,{ts '2015-09-10 16:26:05.320000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (47,'foolproof',null,{ts '2015-09-10 16:26:05.323000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (48,'social-commentary',null,{ts '2015-09-10 16:26:05.364000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (49,'towel',null,{ts '2015-09-10 16:26:05.366000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (50,'british',null,{ts '2015-09-10 16:26:05.369000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (51,'thumb',null,{ts '2015-09-10 16:26:05.372000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (52,'science-fiction',null,{ts '2015-09-10 16:26:05.375000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (53,'philosophy',null,{ts '2015-09-10 16:26:05.429000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (54,'atheism',null,{ts '2015-09-10 16:26:05.493000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (55,'religion',null,{ts '2015-09-10 16:26:05.496000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (56,'skeptic',null,{ts '2015-09-10 16:26:05.499000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (57,'novelist',null,{ts '2015-09-10 16:26:05.533000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (58,'politics',null,{ts '2015-09-10 16:26:05.564000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (59,'elections',null,{ts '2015-09-10 16:26:05.566000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (60,'rulers',null,{ts '2015-09-10 16:26:05.568000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (61,'dreams',null,{ts '2015-09-10 16:26:05.594000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (62,'zaphod-beeblebrox',null,{ts '2015-09-10 16:26:05.635000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (63,'egotism',null,{ts '2015-09-10 16:26:05.638000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (64,'happiness',null,{ts '2015-09-10 16:26:05.659000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (65,'rightness',null,{ts '2015-09-10 16:26:05.662000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (66,'learning',null,{ts '2015-09-10 16:26:05.688000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (67,'sci-fi',null,{ts '2015-09-10 16:26:05.775000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (68,'arthur-dent',null,{ts '2015-09-10 16:26:05.795000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (69,'intelligence',null,{ts '2015-09-10 16:26:05.819000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (70,'gallows-humor',null,{ts '2015-09-10 16:26:05.869000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (71,'reality',null,{ts '2015-09-10 16:26:05.894000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (72,'presidency',null,{ts '2015-09-10 16:29:49.278000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (73,'truth',null,{ts '2015-09-10 16:29:49.289000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (74,'wishful-thinking',null,{ts '2015-09-10 16:29:49.299000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (75,'technology',null,{ts '2015-09-10 16:29:49.416000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (76,'computer',null,{ts '2015-09-10 16:29:49.420000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (77,'tea',null,{ts '2015-09-10 16:29:49.624000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (78,'department',null,{ts '2015-09-10 16:29:49.754000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (79,'house',null,{ts '2015-09-10 16:29:49.760000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (80,'bureaucracy',null,{ts '2015-09-10 16:29:49.771000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (81,'bypass',null,{ts '2015-09-10 16:29:49.798000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (82,'demolition',null,{ts '2015-09-10 16:29:49.801000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (83,'ford-prefect',null,{ts '2015-09-10 16:29:49.874000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (84,'semantics',null,{ts '2015-09-10 16:29:49.968000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (85,'wordplay',null,{ts '2015-09-10 16:29:49.972000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (86,'word',null,{ts '2015-09-10 16:29:49.981000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (87,'safe',null,{ts '2015-09-10 16:29:49.985000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (88,'safety-in-numbers',null,{ts '2015-09-10 16:29:49.993000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (89,'pp-191',null,{ts '2015-09-10 16:29:50.640000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (90,'douglas-adams',null,{ts '2015-09-10 16:29:50.121000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (91,'inspirational',null,{ts '2015-09-10 16:29:50.248000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (92,'drunk',null,{ts '2015-09-10 16:29:50.301000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (93,'jokes',null,{ts '2015-09-10 16:29:50.304000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (94,'political',null,{ts '2015-09-10 16:29:50.418000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (95,'intelligent-design',null,{ts '2015-09-10 16:29:50.539000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (96,'puddle',null,{ts '2015-09-10 16:29:50.549000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (97,'empathy-psychology',null,{ts '2015-09-10 16:29:50.717000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (98,'drinking',null,{ts '2015-09-10 16:29:50.819000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (99,'bar-guide',null,{ts '2015-09-10 16:29:50.821000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (100,'judgement',null,{ts '2015-09-10 16:29:50.965000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (101,'temptation',null,{ts '2015-09-10 16:29:51.470000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (102,'sperm-whale',null,{ts '2015-09-10 16:29:51.101000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (103,'petunias',null,{ts '2015-09-10 16:29:51.111000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (104,'lemons',null,{ts '2015-09-10 16:29:51.167000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (105,'ford',null,{ts '2015-09-10 16:29:51.171000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (106,'insanity',null,{ts '2015-09-10 16:29:51.180000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (107,'crazy',null,{ts '2015-09-10 16:29:51.184000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (108,'dragons',null,{ts '2015-09-10 17:42:45.290000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (109,'books',null,{ts '2015-09-10 17:42:45.295000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (110,'paraphrasing-g-k-chesterton',null,{ts '2015-09-10 17:42:45.301000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (111,'fairy-tales',null,{ts '2015-09-10 17:42:45.303000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (112,'fame',null,{ts '2015-09-10 17:42:45.511000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (113,'knowing',null,{ts '2015-09-10 17:42:45.517000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (114,'teach',null,{ts '2015-09-10 17:42:45.519000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (115,'wealth',null,{ts '2015-09-10 17:42:45.522000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (116,'poverty',null,{ts '2015-09-10 17:42:45.526000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (117,'facts',null,{ts '2015-09-10 17:42:45.536000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (118,'school',null,{ts '2015-09-10 17:42:45.539000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (119,'dying',null,{ts '2015-09-10 17:42:45.542000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (120,'inspiration',null,{ts '2015-09-10 17:42:45.599000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (121,'belief',null,{ts '2015-09-10 17:46:52.698000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (122,'sandman',null,{ts '2015-09-10 17:46:52.899000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (123,'towns',null,{ts '2015-09-10 17:46:52.955000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (124,'bookstore',null,{ts '2015-09-10 17:46:52.963000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (125,'witchcraft',null,{ts '2015-09-10 17:46:53.169000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (126,'women',null,{ts '2015-09-10 17:46:53.173000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (127,'men',null,{ts '2015-09-10 17:46:53.180000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (128,'witches',null,{ts '2015-09-10 17:46:53.183000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (129,'poetry',null,{ts '2015-09-10 17:46:53.297000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (130,'kindness',null,{ts '2015-09-10 17:46:53.334000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (131,'libraries',null,{ts '2015-09-10 17:46:53.384000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (132,'reading',null,{ts '2015-09-10 17:46:53.386000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (133,'library',null,{ts '2015-09-10 17:46:53.392000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (134,'sex',null,{ts '2015-09-10 17:46:53.627000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (135,'youth',null,{ts '2015-09-10 17:46:53.696000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (136,'stories',null,{ts '2015-09-10 17:46:53.698000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (137,'haunting',null,{ts '2015-09-10 17:46:53.701000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (138,'mind',null,{ts '2015-09-10 17:46:53.705000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (139,'new-year',null,{ts '2015-09-10 17:46:53.782000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (140,'blog',null,{ts '2015-09-10 17:46:53.787000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (141,'2012',null,{ts '2015-09-10 17:46:53.798000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (142,'want',null,{ts '2015-09-10 17:46:53.857000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (143,'desires',null,{ts '2015-09-10 17:46:53.867000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (144,'fun',null,{ts '2015-09-10 17:46:53.870000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (145,'missed-connections',null,{ts '2015-09-10 19:13:14.628000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (146,'rain',null,{ts '2015-09-10 19:13:14.632000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (147,'change',null,{ts '2015-09-10 19:13:14.682000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (148,'death',null,{ts '2015-09-10 19:13:14.748000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (149,'friends',null,{ts '2015-09-10 19:13:14.749000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (150,'self-knowledge',null,{ts '2015-09-10 19:13:14.807000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (151,'names',null,{ts '2015-09-10 19:13:14.809000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (152,'cats',null,{ts '2015-09-10 19:13:14.816000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (153,'pain',null,{ts '2015-09-10 19:13:15.300000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (154,'choice',null,{ts '2015-09-10 19:13:15.700000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (155,'pleasure',null,{ts '2015-09-10 19:13:15.180000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (156,'the-graveyard-book',null,{ts '2015-09-10 19:13:15.920000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (157,'neil-gaiman',null,{ts '2015-09-10 19:13:15.960000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (158,'fallibility',null,{ts '2015-09-10 19:13:15.188000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (159,'favorite-books',null,{ts '2015-09-10 19:13:15.298000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (160,'gifts',null,{ts '2015-09-10 19:13:15.392000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (161,'anansi-boys',null,{ts '2015-09-10 19:13:15.431000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (162,'four-letter-word',null,{ts '2015-09-10 19:13:15.506000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (163,'willfullness',null,{ts '2015-09-10 19:13:15.568000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (164,'pets',null,{ts '2015-09-10 19:13:15.573000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (165,'chaos',null,{ts '2015-09-10 19:13:15.574000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (166,'cooperation',null,{ts '2015-09-10 19:13:15.582000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (167,'persuasion',null,{ts '2015-09-10 19:13:15.585000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (168,'organization',null,{ts '2015-09-10 19:13:15.587000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (169,'poe',null,{ts '2015-09-10 19:13:15.683000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (170,'parody',null,{ts '2015-09-10 19:13:15.689000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (171,'edgar-allan-poe',null,{ts '2015-09-10 19:13:15.691000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (172,'nevermore',null,{ts '2015-09-10 19:13:15.693000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (173,'raven',null,{ts '2015-09-10 19:13:15.702000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (174,'childhood',null,{ts '2015-09-10 19:13:15.751000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (175,'book-lovers',null,{ts '2015-09-10 19:13:15.818000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (176,'love-for-books',null,{ts '2015-09-10 19:13:15.823000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (177,'book-quotes',null,{ts '2015-09-10 19:13:15.825000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (178,'bookworms',null,{ts '2015-09-10 19:13:15.830000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (179,'dream',null,{ts '2015-09-10 19:13:15.874000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (180,'independence',null,{ts '2015-09-10 19:13:15.907000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (181,'interdependence',null,{ts '2015-09-10 19:13:15.909000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (182,'goodness',null,{ts '2015-09-10 19:13:16.150000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (183,'living',null,{ts '2015-09-10 19:13:16.210000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (184,'heart',null,{ts '2015-09-10 19:13:16.340000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (185,'sarcasm',null,{ts '2015-09-10 19:13:16.137000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (186,'looks',null,{ts '2015-09-10 19:13:16.189000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (187,'inside',null,{ts '2015-09-10 19:13:16.190000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (188,'people',null,{ts '2015-09-10 19:13:16.193000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (189,'true-nature',null,{ts '2015-09-10 19:13:16.196000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (190,'individuality',null,{ts '2015-09-10 19:13:16.329000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (191,'treasure',null,{ts '2015-09-10 19:13:16.339000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (192,'dance',null,{ts '2015-09-10 19:13:16.344000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (193,'name',null,{ts '2015-09-10 19:13:16.349000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (194,'awakening',null,{ts '2015-09-10 19:13:16.351000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (195,'sleep',null,{ts '2015-09-10 19:13:16.353000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (196,'identity',null,{ts '2015-09-10 19:13:16.358000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (197,'crises',null,{ts '2015-09-10 19:13:16.439000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (198,'lying',null,{ts '2015-09-11 16:08:38.617000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (199,'memory',null,{ts '2015-09-11 16:08:38.626000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (200,'lies',null,{ts '2015-09-11 16:08:38.633000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (201,'pause',null,{ts '2015-09-11 16:08:38.769000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (202,'minority',null,{ts '2015-09-11 16:08:38.774000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (203,'reflect',null,{ts '2015-09-11 16:08:38.779000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (204,'majority',null,{ts '2015-09-11 16:08:38.786000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (205,'wisdom',null,{ts '2015-09-11 16:08:38.789000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (206,'contentment',null,{ts '2015-09-11 16:08:39.600000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (207,'friendship',null,{ts '2015-09-11 16:08:39.110000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (208,'aliteracy',null,{ts '2015-09-11 16:08:39.108000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (209,'literacy',null,{ts '2015-09-11 16:08:39.123000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (210,'procrastination',null,{ts '2015-09-11 16:08:39.253000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (211,'classic',null,{ts '2015-09-11 16:08:39.392000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (212,'bookroom',null,{ts '2015-09-11 16:08:39.671000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (213,'world',null,{ts '2015-09-11 16:08:39.908000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (214,'war',null,{ts '2015-09-11 16:08:39.993000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (215,'geography',null,{ts '2015-09-11 16:08:40.200000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (216,'americans',null,{ts '2015-09-11 16:08:40.800000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (217,'classic-insult',null,{ts '2015-09-11 16:08:40.920000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (218,'funeral',null,{ts '2015-09-11 16:08:40.112000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (219,'funny',null,{ts '2015-09-11 16:08:40.130000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (220,'humor-satan',null,{ts '2015-09-11 16:08:40.206000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (221,'knowledge',null,{ts '2015-09-11 16:08:40.253000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (222,'life-quote',null,{ts '2015-09-11 16:08:40.294000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (223,'heartbreak',null,{ts '2015-09-11 16:08:40.342000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (224,'patriotism',null,{ts '2015-09-11 16:08:40.446000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (225,'age',null,{ts '2015-09-11 16:08:40.532000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (226,'books-reading',null,{ts '2015-09-11 16:08:40.648000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (227,'sanity',null,{ts '2015-09-11 16:08:40.843000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (228,'clothing',null,{ts '2015-09-11 16:08:40.890000'});
INSERT INTO "QUOTES"."SUBJECT_TAG" (ID,TAG_TEXT,CREATING_USER,CREATION_DATE) VALUES (229,'illusions',null,{ts '2015-09-11 16:08:40.926000'});








