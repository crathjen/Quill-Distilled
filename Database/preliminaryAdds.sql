Insert into registered_user
(user_name, password, email)
values(
'admin',
'blob',
'colerathjen@hotmail.com');

Insert into registered_user
(user_name, first_name, last_name, password, email)
values(
'bill',
'Bill',
'Nye the Science Guy',
'nye',
'bnye@test.com');

insert into author(
first_name, last_name, creating_user)
values(
'Soren', 'Kierkegaard', 'admin');

insert into quotation(
author_id, quote_text, posting_user)
values(
(select id from author where last_name='Kierkegaard'),
'Lord Jesus Christ, our foolish minds are weak; they are more than willing to be drawn-and there is so much that wants to draw us to itself. There is pleasure with its seductive power, the multiplicity with its bewildering distractions, the moment with its infatuating importance and the conceited laboriousness of busyness and the careless time-wasting of light-mindedness and the gloomy brooding of heavy-mindedness-all this will draw us away from ourselves to itself in order to deceive us. But you, who are truth, only you, our Savior and Redeemer, can truly draw to person to yourself, which you have promised to do-that you will draw all to yourself. Then may God grant that by repenting we may come to ourselves, so that you, according to your Word, can draw us to yourself-from on high, but through lowliness and abasement.',
'admin');

insert into quotation(
author_id, quote_text, posting_user)
values(
(select id from author where last_name='Kierkegaard'),
'For as only one thing is necessary, and as the theme of the talk is the willing of only one thing: hence the consciousness before God of one’s eternal responsibility to be an individual is that one thing necessary.',
'admin');


