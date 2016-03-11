-- phpMyAdmin SQL Dump
-- version 3.1.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 08, 2009 at 04:36 AM
-- Server version: 5.1.32
-- PHP Version: 5.2.9-1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `maascreen`
--

-- --------------------------------------------------------

--
-- Table structure for table `categeory`
--

CREATE TABLE IF NOT EXISTS `categeory` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `catname` varchar(100) NOT NULL,
  `parentid` int(10) NOT NULL,
  `active` int(2) NOT NULL DEFAULT '0',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=82 ;

--
-- Dumping data for table `categeory`
--

INSERT INTO `categeory` (`id`, `catname`, `parentid`, `active`, `update_date`) VALUES
(66, 'movies', 0, 0, '2009-05-19 13:06:57'),
(77, 'athadu', 66, 0, '2009-05-19 17:54:41'),
(78, 'good  pictures', 0, 0, '2009-05-19 17:53:10'),
(79, 'godavari', 66, 0, '2009-05-19 17:55:02'),
(80, '?????????? ', 0, 0, '2009-06-20 12:35:34'),
(81, 'children', 0, 0, '2009-07-03 19:07:00');

-- --------------------------------------------------------

--
-- Table structure for table `film_news`
--

CREATE TABLE IF NOT EXISTS `film_news` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `heading` varchar(100) NOT NULL,
  `summery` text NOT NULL,
  `description` text NOT NULL,
  `insert_date` date NOT NULL,
  `breaking_news` int(1) NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=74 ;

--
-- Dumping data for table `film_news`
--

INSERT INTO `film_news` (`id`, `heading`, `summery`, `description`, `insert_date`, `breaking_news`, `active`) VALUES
(50, 'malleswari', '<font><font style="color: #000000; font-family: verdana; font-size: 13px; text-decoration: none;">Priya Anand, who is all set to debut with critically-acclaimed director Shekar Kammula''s ongoing <em>Leader </em>opposite debutant Daggubati Rana, has been roped in to playthe lead role in actor Ram''s next project titled <em>Krishna Krishna Rama Rama</em>,</font></font>', '<font style="color: #000000; font-family: verdana; font-size: 13px; text-decoration: none;"><p>Priya Anand, who is all set to debut with critically-acclaimed director Shekar Kammula''s ongoing <em>Leader </em>opposite debutant Daggubati Rana, has been roped in to playthe lead role in actor Ram''s next project titled <em>Krishna Krishna Rama Rama</em>,\nproduced by Dil Raju and directed by Srivas (Lakshyam fame). Arjun\nplays a vital role in this movie, set to begin its regular shoot from\nJuly.</p>\n<p>Meanwhile, her <em>Leader</em>, touted to be an action-packed\nentertainer, is progressing briskly at various locations of Andhra\nPradesh. Priya Anand is also busy with director Ahmed''s Tamil flick <em>Vaamanan</em>, starring Jai and Lakshmi Rai in the lead. <em>Vaamanan </em>is the story of a person who wants to become a film hero.</p></font>', '2009-06-06', 0, 0),
(49, 'Magadheera on July 9?', '<font><font style="color: #000000; font-family: verdana; font-size: 13px; text-decoration: none;">Noted\nTollywood producer-distributer Allu Arvind of Geetha Arts is reportedly\ntaking efforts to release his much-hyped Ram Charan Teja starrer <em>Magadheera</em>, directed by S.S. Rajamouli, on July 9.</font></font>', '<font style="color: #000000; font-family: verdana; font-size: 13px; text-decoration: none;"><p>Noted\nTollywood producer-distributer Allu Arvind of Geetha Arts is reportedly\ntaking efforts to release his much-hyped Ram Charan Teja starrer <em>Magadheera</em>, directed by S.S. Rajamouli, on July 9.</p>\n<p>Touted to be the costliest film ever made in Telugu with a budget above 35 crores, <em>Magadheera </em>is&nbsp;touted as an action-based romantic thriller to suit audiences of all classes. Kajal Aggarwal is the heroine.</p>\n<p>Set in the backdrop of divine mysteries of death and rebirth, the\nfilm is now in the last leg of its production. Story is by Vijayendra\nPrasad, dialogues are by Ratnam, styling is by Rama Rajamouli, while\nmusic is by M.M. Keeravani. The theatrical rights of the film in Europe\nhave been reportedly brought by Ramu Penumanchu.</p></font>', '2009-06-06', 1, 0),
(52, 'Maa Naana Chiranjeevi photos and posters', '<font><font style="color: #000000; font-family: verdana; font-size: 13px; text-decoration: none;">Here comes the exclusive photos and posters of director P.A. Arun Prasad''s <em>Maa Naana Chiranjeevi</em>, starring Jagapathi Babu as the hero opposite newcomer Neelima; this film will also have master Atulith of <em>Thulasi</em>\nfame in a key role. Produced under the banner of Laughing Lord\nEntertainment, the film is slated to be a family entertainer. More\ndetails are awaited.</font></font>', '<font><font style="color: #000000; font-family: verdana; font-size: 13px; text-decoration: none;">Here comes the exclusive photos and posters of director P.A. Arun Prasad''s <em>Maa Naana Chiranjeevi</em>, starring Jagapathi Babu as the hero opposite newcomer Neelima; this film will also have master Atulith of <em>Thulasi</em>\nfame in a key role. Produced under the banner of Laughing Lord\nEntertainment, the film is slated to be a family entertainer. More\ndetails are awaited.</font></font><font><font style="color: #000000; font-family: verdana; font-size: 13px; text-decoration: none;">Here comes the exclusive photos and posters of director P.A. Arun Prasad''s <em>Maa Naana Chiranjeevi</em>, starring Jagapathi Babu as the hero opposite newcomer Neelima; this film will also have master Atulith of <em>Thulasi</em>\nfame in a key role. Produced under the banner of Laughing Lord\nEntertainment, the film is slated to be a family entertainer. More\ndetails are awaited.</font></font>', '2009-06-06', 1, 0),
(53, '    Latest & Hot Bollywood Film News : ', '<font size="2" face="Arial">She played the daughter of Amitabh Bachchan\nand Jaya Prada in Kohraam a decade ago. Now Jahan Bloch is all set to\ndebut as heroine in Krantiveer - The Revolution, being directed by dad\nMehul Kumar</font>', '<font size="2" face="Arial">Mumbai, June 8 (IANS) She played the\ndaughter of Amitabh Bachchan and Jaya Prada in "Kohraam" a decade ago.\nNow Jahan Bloch is all set to debut as heroine in "Krantiveer - The\nRevolution", being directed by dad Mehul Kumar.\n<br>\n<br>"In my earlier years when I got an opportunity to play Amitabh\nBachchan''s daughter, I was very comfortable in front of the camera.\nSame is the case today as well when I''m playing a full-fledged\ncharacter," Jahan, the latest to join the celebrity kids bandwagon,\ntold IANS. <br>\n<br>"Kohraam" (1999) was directed by Mehul Kumar. The original 1994\n"Krantiveer", also directed by Mehul Kumar, starred Nana Patekar,\nDimple Kapadia, Mamta Kulkarni and Atul Agnihotri. <br>\n<br>For 21-year-old Jahan, it was a childhood dream to become an actress. \n<br>\n<br>"Call it (in) the genes and being part of a filmy family, but ever\nsince I can remember I always wanted to be an actress. I must have been\nthree-years-old when I spoke to dad about becoming an actress," she\nsaid. <br>\n<br>The newcomer says she didn''t feel the need to join any acting classes. \n<br>\n<br>"Frankly, I didn''t see any need for that. I come from a family that\nhas made movies for decades; so why not learn straight from them? My\non-the-job training started at home itself as I used to visit my dad''s\nset on a regular basis. I just wanted to study the overall atmosphere\nof filmmaking," she said. <br>\n<br>"Krantiveer - The Revolution", a sequel to Mehul Kumar''s\n"Krantiveer", features Jahan as Nana Patekar''s fiery daughter. She\nplays a journalist who raises her voice against terrorism, violence and\ncorruption. <br>\n<br>Isn''t that too heavy a subject for a newcomer like her? \n<br>\n<br>"I feel 99 percent of the actresses debut with romantic films. I\nasked myself if I too wanted to follow a conventional approach and the\nanswer was ''no''," said Jahan. <br>\n<br>"I wanted to do something far more challenging because it makes you\nwork harder. Also, though the risks are bigger, the benefits are much\nhigher. I don''t want to be monotonous and instead demonstrate my\ncalibre by playing a role that other actresses out there would possibly\nget after working in five or six films," she added. <br>\n<br>"Krantiveer - the Revolution" features Samir Aftab opposite Jahan.\nThe film has music by Sachin and Jigar and Mehul Kumar is aiming for a\nSeptember-October release. <br>\n<br>To support Mehul Kumar''s new venture, Amitabh Bachchan, Nana\nPatekar and Dimple Kapadia were present at the film''s launch event\naround two months ago. </font>', '2009-06-08', 1, 0),
(62, 'Junior NTR comes on stretcher to vote ', '<font size="2" face="Arial">Severe injuries sustained in a road\naccident could not stop him from campaigning in Andhra Pradesh. And on\nThursday popular Telugu actor Junior NTR made sure that he cast his\nvote too - even if it meant coming out on a stretcher</font>', '<font size="2" face="Arial">Hyderabad, April 16 (IANS) Severe injuries\nsustained in a road accident could not stop him from campaigning in\nAndhra Pradesh. And on Thursday popular Telugu actor Junior NTR made\nsure that he cast his vote too - even if it meant coming out on a\nstretcher.\n<br>\n<br>Accompanied by his mother, the young Junion NTR, who was the star\ncampaigner of the Telugu Desam Party (TDP), reached the polling centre\nat St. Ann''s School in Mehdipatnam neighbourhood in an ambulance and\nwas straightaway taken inside the booth. <br>\n<br>He showed the indelible ink mark on his finger to television\ncameras but returned home without talking to mediapersons. Andhra\nPradesh is holding simultaneous polls to the assembly and the Lok\nSabha. <br>\n<br>Junior NTR, who has uncanny resemblance to his legendary\ngrandfather and TDP founder N. T. Rama Rao, proved a big hit with the\nmasses when he launched his campaign for the party in mid-March. <br>\n<br>With his speeches full of theatrical punches like the ones\ndelivered by NTR, he drew huge crowds in four districts before he met\nwith a road accident March 26. He remained in hospital for 15 days. <br>\n<br>Even after being discharged from hospital, he campaigned from his\nbed. In a televised address April 13, the star appealed to the\nelectorate to defeat the ruling Congress party and bring the TDP back\nto power. </font>', '2009-06-08', 1, 0),
(54, '  Latest & Hot Bollywood Film News :', 'Two days after acclaimed director Adoor Gopalakrishnan''s Oru Pennun\nRandu Annum swept the state film awards, veteran Malayalam filmmaker\nT.V. Chandran Friday said that the awards were given to a TV serial and\nnot a movie', '<font size="2" face="Arial">Thiuvananthapuram, June 5 (IANS) Two days\nafter acclaimed director Adoor Gopalakrishnan''s "Oru Pennun Randu\nAnnum" swept the state film awards, veteran Malayalam filmmaker T.V.\nChandran Friday said that the awards were given to a "TV serial and not\na movie".\n<br>\n<br>"This time the award for the best film has been given to a TV\nserial and not a film. Last year his film was not given an award\nbecause the then jury felt his film was a serial," Chandran told\nreporters here. <br>\n<br>Chandran''s "Bhoomi Malayalam" was adjudged the second best by the jury this time. \n<br>\n<br>"Adoor says that this year''s jury was good but not last year''s.\nWhen he gets an award, he says the jury is good and if he doesn''t he\nsays the jury is bad. Is this a statement which one expects from a\nperson like Adoor," asked Chandran. <br>\n<br>Adoor bagged the best director, best film and best screenplay award\nfor "Oru Pennun Randu Annum". While Praveena won the second best\nactress award for her performance in the film and the best sound\nrecordist trophy also went to "Oru Pennun Randu Annum". <br>\n<br>Reacting to the criticism, Culture Minister M.A. Baby said: "Any\ncreative criticism is welcome... whosoever has raised this is free to\ncarry such feelings." <br>\n<br>Commenting on the same Adoor said that those who think his film is\na television serial is "ignorant of what a TV serial is and what a film\nis". <br>\n<br>"You know that my film, which was sent for last year''s award, has been screened at 40 international venues," added Adoor. \n<br>\n<br>One of the jury member Priyanandan says Chandran has criticised the selection procedure because he has seen only his film. \n<br>\n<br>"We saw 27 films which came for the awards and then we made the selection," said Priyanandan. \n</font>', '2009-06-08', 1, 0),
(56, 'David Carradine dead In Bangkok', '<span>David Carradine is dead, according to multiple reports and confirmed by his agent.\n\nOne paper says Carradine was found hung:..</span>', '		<div class="itemHeader">\r\n			<div class="itemTitle">\r\n				<h1>David Carradine dead In Bangkok </h1>\r\n			</div>\r\n			<div class="userInteraction">\r\n				<div class="voting">\r\n					\r\n					\r\n					\r\n				</div>\r\n				<div class="sharing">\r\n					<a class="Sprites itemShareButton itemSharingMenuLink" href="http://current.com/items/90154654_david-carradine-dead-in-bangkok.htm#" onclick="return false;" title="share this">&nbsp;</a>\r\n				</div>\r\n			</div>\r\n			<div id="itemPick">\r\n				<span class="Sprites itemLinkIcon floatLeft"></span>\r\n				<span id="itemSourceLink">\r\n											<a href="http://www.huffingtonpost.com/2009/06/04/david-carradine-dead-foun_n_211292.html" rel="nofollow" title="http://www.huffingtonpost.com/2009/06/04/david-carradine-dead-foun_n_211292.html" target="_blank">http://www.huffingtonpost.com/2009/06/04/d...</a>\r\n				</span>\r\n			</div>				\r\n		</div>\r\n		\r\n						<div id="originalSubmission">\r\n								<div id="itemAsset">\r\n					<div class="itemAssetFill">\r\n																		<div style="overflow: hidden; max-width: 560px; max-height: 900px;"><a href="http://www.huffingtonpost.com/2009/06/04/david-carradine-dead-foun_n_211292.html" target="_blank"><img src="http://images.huffingtonpost.com/gen/84073/thumbs/s-DAVID-CARRADINE-DEAD-large.jpg" id="contentItemAssetImage_90154654" alt="Image..." style="width: 260px; height: 190px;" width="260" height="190"></a></div>					</div>\r\n												\r\n				</div>\r\n								<div class="itemCopy">\r\n					David Carradine is dead, according to multiple reports and confirmed by his agent.<br>\r\n<br>\r\nOne paper says Carradine was found hung:<br>\r\n<br>\r\n"Kung Fu" and "Kill Bill" star David Carradine was found hung himself\r\nin a closet in a hotel room in Bangkok on Wednesday, Thai police said.<br>\r\nPolice believed he committed suicide.<br>\r\n<br>\r\nCarradine, 72, was in Bangkok to shoot a movie and stayed at a Suite\r\nRoom 352 of the Park Nai Lert Hotel on Wireless Road since June 2.<br>\r\n<br>\r\nThe paper reports that a hotel maid found him Thursday morning, after he no-showed at dinner Wednesday night.				</div>\r\n			</div>', '2009-06-08', 1, 0),
(57, 'Mammootty says politics not his cup of tea ', 'Malayalam superstar Mammootty, who considers himself a liberal Leftist,\nhas said that he was neither interested in entering politics nor\npredicting the election results as he is a busy actor and not a\npolitician.', '<font size="2" face="Arial">Thiruvananthapuram, March 22 (IANS)\nMalayalam superstar Mammootty, who considers himself a "liberal\nLeftist", has said that he was neither interested in entering politics\nnor predicting the election results as he is a busy actor and not a\npolitician.\n<br>\n<br>"Astrology is not my business and since I am not into politics, I\nwill refrain myself from saying something that I don''t know. Ask me\nabout my profession and I will reply," Mammootty told IANS over phone\nfrom Kochi when asked about his views on the coming Lok Sabha polls. <br>\n<br>"Let it be over and I will tell you," he added on a lighter note. \n<br>\n<br>Questions are often raised about the superstar entering politics as\nhe is the chairman of Kairali TV, a channel promoted by the Communist\nParty of India-Marxist (CPI-M). <br>\n<br>Mammootty, who is busy shooting for family entertainer "Daddy Cool"\nin Kochi, said three of his films are ready for release and he is\nequally upbeat about all three. <br>\n<br>"''Pazhazzi Raja'', ''Patanthil Bhootham'' and ''Kutti Shranku'' are all\ndifferent in treatment and the audience can expect a good experience.\nSimilarly, my hands are full for the rest of the year too. So right now\nI am fully occupied and I do not have the time to think of anything\nelse," Mammootty said</font>', '2009-06-08', 0, 0),
(58, '"Ink" - An Indie Film worth a look...', '<span>There is very little known about this movie other that it will screen at the Egyptian Theater in Hollywood on June 10th! It is a</span>', '<font size="2" face="Arial, Helvetica, sans-serif">One of the first added sequences is a stroll down a hallway in the \n              Louvre as the hero and the cop who will be chasing him, played by \n              <b>Jean Reno,</b> approach the crime scene. The conversation is \n              a little absurd (they talk about the expense of security cameras) \n              and it makes sense that Howard jumped over it to get to the corpse, \n              but, especially on Blu-ray with its vivid, crisp image reproduction, \n              the enormous, genuine Louvre canvasses that the two actors pass \n              as they talk are stunning, and there is a strong temptation to back \n              up the scene a couple of times to replay the visual pleasure it \n              provides.<br></font><font size="2" face="Arial, Helvetica, sans-serif"><font size="3"><font size="2" face="Arial, Helvetica, sans-serif"><font color="#000000">The\nmovie skids toward tragedy, interrupted by great argument scenes,\nbrilliantly executed by Leo and Kate. (Did you see that slightly\nclenched, careful look in his eyes at the Golden Globes, when the\ndouble-winning Winslet said that she loved him?)&nbsp; Yet, though <strong>Revolutionary Road</strong>\nmay be a great book, at least for its time, it’s not a great movie.\nIt’s a little too self-regarding, too not-so-secretly pretentiou</font></font></font></font><br>', '2009-06-08', 0, 0),
(59, 'Malayalam film awards spark controversy ', '<font size="2" face="Arial">This time the award for the best film has\nbeen given to a TV serial and not a film. Last year his film was not\ngiven an award because the then jury felt his film was a serial,"\nChandran told reporters here. <br>\n</font>', '<font size="2" face="Arial">&nbsp;</font><font size="2" face="Arial">Thiuvananthapuram, June 5 (IANS) Two days\nafter acclaimed director Adoor Gopalakrishnan''s "Oru Pennun Randu\nAnnum" swept the state film awards, veteran Malayalam filmmaker T.V.\nChandran Friday said that the awards were given to a "TV serial and not\na movie".\n<br>\n<br>"This time the award for the best film has been given to a TV\nserial and not a film. Last year his film was not given an award\nbecause the then jury felt his film was a serial," Chandran told\nreporters here. <br>\n<br>Chandran''s "Bhoomi Malayalam" was adjudged the second best by the jury this time. \n<br>\n<br>"Adoor says that this year''s jury was good but not last year''s.\nWhen he gets an award, he says the jury is good and if he doesn''t he\nsays the jury is bad. Is this a statement which one expects from a\nperson like Adoor," asked Chandran. <br>\n<br>Adoor bagged the best director, best film and best screenplay award\nfor "Oru Pennun Randu Annum". While Praveena won the second best\nactress award for her performance in the film and the best sound\nrecordist trophy also went to "Oru Pennun Randu Annum". <br>\n<br>Reacting to the criticism, Culture Minister M.A. Baby said: "Any\ncreative criticism is welcome... whosoever has raised this is free to\ncarry such feelings." <br>\n<br>Commenting on the same Adoor said that those who think his film is\na television serial is "ignorant of what a TV serial is and what a film\nis". <br>\n<br>"You know that my film, which was sent for last year''s award, has been screened at 40 international venues," added Adoor. \n<br>\n<br>One of the jury member Priyanandan says Chandran has criticised the selection procedure because he has seen only his film. \n<br>\n<br>"We saw 27 films which came for the awards and then we made the selection," said Priyanandan. \n</font>', '2009-06-08', 0, 0),
(60, 'Mammootty says politics not his cup of tea ', 'Malayalam superstar Mammootty, who considers himself a liberal Leftist,\nhas said that he was neither interested in entering politics nor\npredicting the election results as he is a busy actor and not a\npolitician.', '<font size="2" face="Arial"><br>Thiruvananthapuram, March 22 (IANS)\nMalayalam superstar Mammootty, who considers himself a "liberal\nLeftist", has said that he was neither interested in entering politics\nnor predicting the election results as he is a busy actor and not a\npolitician.\n<br>\n<br>"Astrology is not my business and since I am not into politics, I\nwill refrain myself from saying something that I don''t know. Ask me\nabout my profession and I will reply," Mammootty told IANS over phone\nfrom Kochi when asked about his views on the coming Lok Sabha polls. <br>\n<br>"Let it be over and I will tell you," he added on a lighter note. \n<br>\n<br>Questions are often raised about the superstar entering politics as\nhe is the chairman of Kairali TV, a channel promoted by the Communist\nParty of India-Marxist (CPI-M). <br>\n<br>Mammootty, who is busy shooting for family entertainer "Daddy Cool"\nin Kochi, said three of his films are ready for release and he is\nequally upbeat about all three. <br>\n<br>"''Pazhazzi Raja'', ''Patanthil Bhootham'' and ''Kutti Shranku'' are all\ndifferent in treatment and the audience can expect a good experience.\nSimilarly, my hands are full for the rest of the year too. So right now\nI am fully occupied and I do not have the time to think of anything\nelse," Mammootty said</font>', '2009-06-08', 0, 0),
(61, ' Malayalam film awards spark controversy ', '<font size="2" face="Arial">Thiruvananthapuram, March 22 (IANS)\nMalayalam superstar Mammootty, who considers himself a "liberal\nLeftist", has said that he was neither interested in entering politics\nnor predicting the election results as he is a busy actor and not a\npolitician.\n</font>', '<font size="2" face="Arial">Thiruvananthapuram, March 22 (IANS)\nMalayalam superstar Mammootty, who considers himself a "liberal\nLeftist", has said that he was neither interested in entering politics\nnor predicting the election results as he is a busy actor and not a\npolitician.\n<br>\n<br>"Astrology is not my business and since I am not into politics, I\nwill refrain myself from saying something that I don''t know. Ask me\nabout my profession and I will reply," Mammootty told IANS over phone\nfrom Kochi when asked about his views on the coming Lok Sabha polls. <br>\n<br>"Let it be over and I will tell you," he added on a lighter note. \n<br>\n<br>Questions are often raised about the superstar entering politics as\nhe is the chairman of Kairali TV, a channel promoted by the Communist\nParty of India-Marxist (CPI-M). <br>\n<br>Mammootty, who is busy shooting for family entertainer "Daddy Cool"\nin Kochi, said three of his films are ready for release and he is\nequally upbeat about all three. <br>\n<br>"''Pazhazzi Raja'', ''Patanthil Bhootham'' and ''Kutti Shranku'' are all\ndifferent in treatment and the audience can expect a good experience.\nSimilarly, my hands are full for the rest of the year too. So right now\nI am fully occupied and I do not have the time to think of anything\nelse," Mammootty said</font>', '2009-06-08', 0, 0),
(63, 'Junior NTR injured in road accident ', '<font size="2" face="Arial">Junior NTR, popular Telugu film actor and\nstar campaigner of the Telugu Desam Party (TDP), has suffered multiple\ninjuries after a road accident in Andhra Pradesh, police said Friday. </font>', '<font size="2" face="Arial">Hyderabad, March 27 (IANS) Junior NTR,\npopular Telugu film actor and star campaigner of the Telugu Desam Party\n(TDP), has suffered multiple injuries after a road accident in Andhra\nPradesh, police said Friday.\n<br>\n<br>The accident took place late Thursday when the Tata Safari vehicle\nin which he was travelling turned turtle and hit a tree in Nalgonda\ndistrict, 170 km east of here. <br>\n<br>Junior NTR, grandson of legendary actor and TDP founder N.T. Rama\nRao, was returning to Hyderabad from Khammam district after campaigning\nwhen the accident occurred. He was driving the vehicle. <br>\n<br>He suffered injuries on head, temple, shoulder and elbow and has\nbeen shifted to the Krishna Institute of Medical Sciences (KIMS) in\nSecunderabad here. Doctors said he was out of danger but needed\ncomplete rest for four to six weeks. <br>\n<br>Two people accompanying him were also injured. They have been\nidentified as actor Rajiv Kanakala, who was sitting beside Junior NTR,\nand junior artist Srinivas Reddy, who was on the rear seat. <br>\n<br>The actor''s supporters and TDP leaders in other vehicles in his\nconvoy first shifted them to a hospital in Suryapet town for first aid.\nThey were later brought to KIMS in the state capital. <br>\n<br>According to the police, the accident occurred at a sharp turn at Mothe village near Suryapet town. \n<br>\n<br>"Apparently, he could not see the turn and suddenly applied the\nbrakes leading to the accident," Nalgonda District Superintendent of\nPolice B. Srinivas told reporters. <br>\n<br>Junior NTR, who hit the campaign trail two weeks ago, was returning\nto Hyderabad to celebrate Ugadi (Telugu New Year day) with his family\nand also to hold talks with TDP president N. Chandrababu Naidu for a\nparty ticket to one of his followers. <br>\n<br>According to informed sources, Junior NTR was unhappy with Naidu\nfor denying an assembly ticket to his follower and the TDP chief had\ncalled him for talks. <br>\n<br>Junior NTR''s relatives other senior TDP leaders have rushed to the hospital. His father is actor N. Harikrishna. \n<br>\n<br>Actor N. Balakrishna, who is also campaigning for the TDP and\nrushed to the hospital, said: "The blessings of his fans have saved his\nlife". <br>\n<br>NTR''s elder son-in-law Daggubati Venkateshwara Rao, who is a\nlegislator of the ruling Congress party, also rushed to the hospital. <br>\n<br>The accident dealt a blow to TDP''s campaign as Junior NTR was\nattracting huge crowds since he launched his campaign in Srikakulam\ndistrict in north coastal Andhra. His resemblance to his legendary\ngrandfather and the theatrical punch in his speeches proved a big hit\nwith people. <br>\n<br>He covered six districtS during the last 14 days, reminding people\nof the popularity of his grandfather, who had created a record by\ncoming to power within nine months of launching the TDP in 1982. <br>\n<br>Junior NTR was originally scheduled to cover the entire state in 40 days</font>', '2009-06-08', 0, 0),
(65, 'hi helloooo', 'sdgdfgsdfg', 'sdfgdfgsdfg', '2009-06-10', 0, 0),
(68, 'malleswari', 'vgdfdsfsdf', 'dfgdfgdfgdfgdfg', '2009-06-10', 0, 0),
(69, '?????????? ', '?????????? <br>', '?????????? <br>', '0000-00-00', 0, 0),
(72, 'Naga Chaitanya’s Josh ', '<font size="2" face="Arial, Helvetica, sans-serif">The unit of Naga\nChaitanya’s Josh returned to city after an exhausting schedule at\ngolden temple city Amritsir. The last leg of the shooting is currently\ngoing on at Mehdipatnam now. Dil Raju produces this <a id="KonaLink0" target="undefined" class="kLink" style="text-decoration: underline ! important; position: static;" href="http://www.idlebrain.com/news/2000march20/news290.html#"><font style="color: blue ! important; font-family: Arial,Helvetica,sans-serif; font-weight: 400; font-size: 13px; position: static;" color="blue"><span class="kLink" style="color: blue ! important; font-family: Arial,Helvetica,sans-serif; font-weight: 400; font-size: 13px; position: static;">movie</span></font></a>\nby introducing Vasu Varma as the director. Karthika (daughter of\nyesteryear’s heartthrob Radha) is doing female lead. Dil Raju is aiming\nfor 12 August release for Josh.</font>', '<font size="2" face="Arial, Helvetica, sans-serif">The unit of Naga\nChaitanya’s Josh returned to city after an exhausting schedule at\ngolden temple city Amritsir. The last leg of the shooting is currently\ngoing on at Mehdipatnam now. Dil Raju produces this <a id="KonaLink0" target="undefined" class="kLink" style="text-decoration: underline ! important; position: static;" href="http://www.idlebrain.com/news/2000march20/news290.html#"><font style="color: blue ! important; font-family: Arial,Helvetica,sans-serif; font-weight: 400; font-size: 13px; position: static;" color="blue"><span class="kLink" style="color: blue ! important; font-family: Arial,Helvetica,sans-serif; font-weight: 400; font-size: 13px; position: static;">movie</span></font></a>\nby introducing Vasu Varma as the director. Karthika (daughter of\nyesteryear’s heartthrob Radha) is doing female lead. Dil Raju is aiming\nfor 12 August release for Josh.</font>', '2009-07-04', 0, 0),
(73, 'NTR’s ', '<font size="2" face="Arial, Helvetica, sans-serif">October 14th is the\ndate set for the release of NTR’s latest film Adurs in the direction of\nVV Vinayak. This film is supposed to release in summer, but got\npostponed due to the injury to NTR. NTR is completely fit and raving to\nresume the shoot again on 1st July. The movie will be wrapped up in\nthis schedule.Vallabhaneni Vamsi Mohan is producing this movie on\nVaishnavi Arts banner</font>', '<font size="2" face="Arial, Helvetica, sans-serif">October 14th is the\ndate set for the release of NTR’s latest film Adurs in the direction of\nVV Vinayak. This film is supposed to release in summer, but got\npostponed due to the injury to NTR. NTR is completely fit and raving to\nresume the shoot again on 1st July. The movie will be wrapped up in\nthis schedule.Vallabhaneni Vamsi Mohan is producing this movie on\nVaishnavi Arts banner</font>', '2009-07-04', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `gallery_categeory`
--

CREATE TABLE IF NOT EXISTS `gallery_categeory` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `catname` varchar(200) NOT NULL,
  `parentid` int(20) NOT NULL,
  `active` int(10) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `gallery_categeory`
--

INSERT INTO `gallery_categeory` (`id`, `catname`, `parentid`, `active`, `update_date`) VALUES
(5, 'fds', 0, 0, '2009-05-27 13:25:46');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_images`
--

CREATE TABLE IF NOT EXISTS `gallery_images` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `parentid` int(20) NOT NULL,
  `active` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gallery_images`
--


-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parentid` int(10) NOT NULL,
  `title` varchar(200) NOT NULL,
  `active` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `images`
--


-- --------------------------------------------------------

--
-- Table structure for table `int_goss`
--

CREATE TABLE IF NOT EXISTS `int_goss` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `person_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `on_date` date DEFAULT NULL,
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('Interview','Gossips') COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=191 ;

--
-- Dumping data for table `int_goss`
--

INSERT INTO `int_goss` (`id`, `person_name`, `description`, `on_date`, `insert_date`, `type`, `active`) VALUES
(187, 'మల్లీశ్వరి ', 'మల్లీశ్వరి <br>', '0000-00-00', '2009-06-20 12:37:13', 'Interview', 0),
(188, 'Magadheera', '<font size="2" face="Arial, Helvetica, sans-serif">For the first time\nin the history of Telugu music, an audio album is releasing along with\nMP3 songs. Umesh Gupta of Aditya Music is going to release\naudiocassette, audio CD and MP3 CD of Ram Charan Teja’s simultaneously\non 28 June. The albums and CDs will be available in market from 29 June\nonwards. They are releasing MP3 <a id="KonaLink2" target="undefined" class="kLink" style="text-decoration: underline ! important; position: static;" href="http://www.idlebrain.com/news/2000march20/news290.html#"><font style="color: blue ! important; font-family: Arial,Helvetica,sans-serif; font-weight: 400; font-size: 13px; position: static;" color="blue"><span class="kLink" style="color: blue ! important; font-family: Arial,Helvetica,sans-serif; font-weight: 400; font-size: 13px; position: static;">songs</span></font></a> to prevent audio piracy. MM Keeravani composes musc and Rajamouli directed this movie. </font>', '2009-07-03', '2009-07-03 19:00:03', 'Interview', 0),
(190, 'NTR', '<font size="2" face="Arial, Helvetica, sans-serif">October 14th is the\ndate set for the release of NTR’s latest film Adurs in the direction of\nVV Vinayak. This film is supposed to release in summer, but got\npostponed due to the injury to NTR. NTR is completely fit and raving to\nresume the shoot again on 1st July. The movie will be wrapped up in\nthis schedule.Vallabhaneni Vamsi Mohan is producing this movie on\nVaishnavi Arts banner.</font>', '2009-07-03', '2009-07-03 19:04:30', 'Gossips', 0),
(181, 'Hansika', '<strong>It''s been six months since <em>Aap ka Suroor</em> but you''ve signed just one movie. How come?<br></strong>I''d be doing 10 films simultaneously if the offers had been exciting. After <em>Aap ka Suroor</em> I wasn''t interested in any more <em>rona</em><em>dhona</em> roles. So I waited till Kumar Mangat''s <em>Honey Hai To Money Hai</em> happened. It''s a riot! <br><br><strong>Do you have a father fixation in your choice of heroes?<br></strong>I''m one of Govindaji''s biggest fans.. our film <em>Honey Hai..</em> is not a regular <em>prem kahani.</em> I''m playing a TV artiste who aspires to become a film star.<em> Govindaji</em> is a Mr Fix-it who helps me realise my dream. He sorts out the problems of others too.. Upen Patel and Aftab Shivdasani. <br><br><strong>Upen and Aftab aren''t exactly teenagers either.</strong><br>My age would be an issue only if I was an inexperienced <em>bachi</em>\nmessing up my shots. But I''ve been working since the last six years.\nEven with Govindaji, I sailed through our first shot in one take.\n(Beaming) Govindaji was impressed. <br><br><strong>You''ll still look like a mismatched <em>jodi</em>.<br></strong>No\nwe won''t. The film''s a comedy and everyone''s going to be laughing so\nhard that they won''t give our age a passing thought. Even Jeetuji\n(Jeetendra) romanced Neetuji (Singh) after working with her as a child\nstar! Besides I''m a better than average actress.<br><br><strong>Aren''t you interested in pairing up with someone closer to your age. Shahid Kapur may be?<br></strong>I''ve\nbeen getting plenty of offers with the younger actors too but I''m more\ninterested in my role than my co-star. I''m 16 going on 17. I can carry\non for another 10-15 years. Time is on my side. By the time I''m 20 I''ll\nlook very sexy. Already, I''ve lost about nine kilos. <br><br><strong>In retrospect do you think <em>Aap ka Suroor</em> was a good launch, given that the focus was almost entirely on Himesh?<br></strong><em>Aap ka Suroor</em>\nwas Himeshji''s launch. So it''s understandable that he would look out\nfor himself. I got enough footage and earned myself a superhit. By the\nway when we were shooting in Germany I wasn''t mobbed, but then neither\nwas Himeshji. Shah Rukh Khan is the only superstar there. \n  <p>And after the release of <em>Aap ka Suroor</em>, a Pakistani soldier patrolling the other side of the Indo-Pak border admitted shyly that he was my fan. <br><br><strong>Have you moved to South films because of none-too-exciting offers in Bombay?<br></strong>I haven''t moved down South. I''ve had only one Telugu release <em>Desh</em><em>Mudru</em> that just completed a 200-day run. I played a 16-year-old <em>sanyasin</em> in it. I''ve just wrapped up a Kannada film <em>Bindaas</em> with Puneet Raaj Kumar and have started work on another Telugu film, <em>Kantri</em>, with NTR junior.</p>\n  I''ve\nbeen pretty lucky with my South films but I won''t take on more than one\nat a time because I want to keep enough dates reserved for the Bombay\nmovies. <br><br><strong>Has your father reconciled himself to your acting career?<br></strong>(With\na frown) He left us when I was 10 years old. That''s when my mother made\nme start acting as a child artiste. Imagine, I got to do <em>Koi Mil Gaya</em>. Now dad is in touch.. <br><br><strong>Your mother has been handling all your business transactions. Aren''t you putting yourself in an Ameesha Patel-like situation?<br></strong>Everything\nI earn goes into a trust that will come to me when I am 18. There''s no\nreason to mistrust someone who''s spending Rs 3000 a month on my\neducation and refuses to touch even a rupee of my money', '2009-06-11', '2009-06-11 15:48:59', 'Interview', 0);

-- --------------------------------------------------------

--
-- Table structure for table `int_goss_media`
--

CREATE TABLE IF NOT EXISTS `int_goss_media` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `int_goss_id` int(10) DEFAULT NULL,
  `media_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_type` enum('Image','Video') COLLATE utf8_unicode_ci DEFAULT NULL,
  `active_video` int(1) NOT NULL DEFAULT '0',
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=111 ;

--
-- Dumping data for table `int_goss_media`
--

INSERT INTO `int_goss_media` (`id`, `int_goss_id`, `media_name`, `media_type`, `active_video`, `insert_date`, `active`) VALUES
(110, 190, 'Gossips', 'Image', 0, '2009-07-03 19:04:30', 0),
(109, 189, 'Interview', 'Video', 1, '2009-07-03 19:02:46', 0),
(108, 188, 'Interview', 'Image', 0, '2009-07-03 19:00:03', 0),
(107, 187, 'Interview', 'Image', 0, '2009-06-20 12:37:13', 0),
(106, 186, 'Interview', 'Video', 0, '2009-06-13 12:59:53', 0),
(105, 185, 'Interview', 'Image', 0, '2009-06-13 12:56:30', 0),
(101, 181, 'Interview', 'Video', 1, '2009-06-11 15:48:59', 0),
(103, 183, 'Interview', 'Video', 0, '2009-06-11 15:58:35', 0),
(104, 184, 'Interview', 'Video', 0, '2009-06-11 18:33:02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE IF NOT EXISTS `keywords` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `keywords` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `keywords`
--

INSERT INTO `keywords` (`id`, `keywords`) VALUES
(2, 'మా స్క్రీన్.కాం,సినిమా.కాం,మా సినిమా వార్తలు,తెలుగు వెబ్సైటు,మొట్ట ,ొదటి తెలుగు వెబ్సైటు,మా తెలుగు,మా తెలుగు సినిమా లు,మా ,తెలుగు హీరోలు,మా తెలుగు హీరోయినేలు,తెలుగు హీరోలు,తెలుగు ,ీరోయిన్ లు,తెలుగు సినిమా పుకార్లు,సినిమా వేల,తెలుగు.కాం,తెలుగు ,వెబ్సైటు.కాం,తెలుగువారు.కాం,ఆల్ తెలుగు.కాం,సినిమా.కాం,ఆల టైం ,రికార్డు సినిమాలు,ఆల్ టైం రికార్డ్స్,మా సినిమాలు,మీ కోసం,');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE IF NOT EXISTS `movies` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `wallpapers_id` int(10) DEFAULT NULL,
  `gallery_id` int(10) DEFAULT NULL,
  `interview_id` int(10) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `movie_name`, `release_date`, `wallpapers_id`, `gallery_id`, `interview_id`, `insert_date`, `active`) VALUES
(8, 'don', '2009-02-02', 0, 0, NULL, '2009-06-09 17:37:55', 0),
(9, 'arundhati', '2009-02-02', 0, 0, NULL, '2009-06-09 17:52:13', 0),
(10, 'mithrudu', '2009-02-02', 0, 0, NULL, '2009-06-09 18:30:43', 0),
(11, 'Prayanam', '0000-00-00', 0, 0, 177, '2009-06-11 12:03:20', 0),
(12, 'Pista ', '2009-06-18', 0, 0, 0, '2009-06-11 12:24:44', 0),
(13, 'veedokkaade', '2009-04-06', 0, 0, 0, '2009-06-12 20:55:45', 0),
(14, 'rajavari chepalacheruvu', '2009-02-02', 0, 0, 0, '2009-06-12 20:56:08', 0),
(15, 'adhirindhi', '0000-00-00', 0, 0, 0, '2009-06-12 20:56:41', 0),
(16, 'మల్లీశ్వరి ', '2009-02-02', 0, 0, 0, '2009-06-20 12:34:16', 0),
(17, 'malleswari', '2009-07-20', 0, 0, 187, '2009-07-03 18:50:52', 0);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE IF NOT EXISTS `newsletter` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`, `active`) VALUES
(1, 'rampelli.pradeep@gmail.com', 0),
(2, 'subbu@gmai.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `movie_id` int(10) DEFAULT NULL,
  `punchline` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `genre` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cast` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `art` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `music` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinematography` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stunts` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editing` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `story` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenplay` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direction` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `producer` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `rating` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` tinyint(1) DEFAULT '1',
  `active` tinyint(1) DEFAULT '0',
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `movie_id`, `punchline`, `genre`, `type`, `banner`, `cast`, `art`, `music`, `cinematography`, `stunts`, `editing`, `story`, `screenplay`, `direction`, `producer`, `summary`, `description`, `rating`, `image`, `active`, `insert_date`) VALUES
(1, 16, 'మల్లీశ్వరి ', 'మల్లీశ్వరి ', 'మల్లీశ్వరి ', 'మల్లీశ్వరి ', 'మల్లీశ్వరి ', 'మల్లీశ్వరి ', 'మల్లీశ్వరి ', 'మల్లీశ్వరి ', 'మల్లీశ్వరి ', 'మల్లీశ్వరి ', '', 'మల్లీశ్వరి ', '', 'మల్లీశ్వరి ', 'మల్లీశ్వరి <br>', 'మల్లీశ్వరి <br>', '2', 0, 0, '2009-06-20 12:35:07');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE IF NOT EXISTS `songs` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `songs`
--


-- --------------------------------------------------------

--
-- Table structure for table `trailors`
--

CREATE TABLE IF NOT EXISTS `trailors` (
  `t_id` int(10) NOT NULL AUTO_INCREMENT,
  `movie_id` int(10) DEFAULT NULL,
  `trailor_name` varchar(100) NOT NULL,
  `time_sec` varchar(10) DEFAULT NULL,
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `on_date` date NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=85 ;

--
-- Dumping data for table `trailors`
--

INSERT INTO `trailors` (`t_id`, `movie_id`, `trailor_name`, `time_sec`, `insert_date`, `on_date`, `active`) VALUES
(80, 12, 'pista trailor2', '00:10:20', '2009-06-12 15:49:28', '2009-06-12', 1),
(78, 12, 'pista trailor1', '02:30:00', '2009-06-11 12:25:24', '2009-06-11', 1),
(79, 9, 'arundathi trailor2', '01:55:42', '2009-06-12 15:31:13', '2009-06-12', 1),
(76, 11, ' prayanam trailor1', '01:55:42', '2009-06-11 12:05:14', '2009-06-11', 1),
(74, 9, 'trailor 1', '01:55:42', '2009-06-10 10:03:25', '2009-06-10', 1),
(75, 8, 'trailor 2', '00:10:20', '2009-06-10 10:04:49', '2009-06-10', 1),
(81, 14, 'trailor 1', '01:55:42', '2009-06-12 20:58:36', '2009-06-01', 1),
(82, 13, 'trailor 1', '00:10:20', '2009-06-12 20:59:13', '2009-06-03', 1),
(83, 17, 'malli-1', '01:00:00', '2009-07-03 18:52:30', '2009-07-02', 1),
(84, 17, 'malli-2', '01:00:30', '2009-07-03 18:53:30', '2009-07-02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pass` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('admin','user') COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uname`, `pass`, `type`, `active`) VALUES
(1, 'admin', 'admin321', 'admin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `video_cat_id` int(20) NOT NULL,
  `name` varchar(400) NOT NULL,
  `videouploaded` tinyint(10) NOT NULL DEFAULT '0',
  `no_of_views` int(20) NOT NULL,
  `active` int(10) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_viewed` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `video_cat_id`, `name`, `videouploaded`, `no_of_views`, `active`, `insert_date`, `last_viewed`) VALUES
(6, 1, 'vodafone', 1, 120001, 0, '2009-06-08 13:04:56', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `videos_categeory`
--

CREATE TABLE IF NOT EXISTS `videos_categeory` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `videos_categeory`
--

INSERT INTO `videos_categeory` (`id`, `name`, `insert_date`, `active`) VALUES
(1, 'vodafone12', '2009-06-08 11:57:55', 0),
(2, 'funny', '2009-06-22 15:59:26', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wallpaper_categeory`
--

CREATE TABLE IF NOT EXISTS `wallpaper_categeory` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `catname` varchar(100) NOT NULL,
  `parentid` int(20) NOT NULL,
  `active` int(10) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `wallpaper_categeory`
--

INSERT INTO `wallpaper_categeory` (`id`, `catname`, `parentid`, `active`, `update_date`) VALUES
(1, 'gv', 0, 0, '2009-05-25 18:00:15'),
(2, 'gv', 0, 0, '2009-05-25 18:00:36'),
(3, 'fsaf', 1, 0, '2009-05-26 09:52:06'),
(9, 'sffgjh', 2, 0, '2009-05-26 10:41:45'),
(10, 'gfjh', 2, 0, '2009-05-26 10:41:49'),
(11, 'hgjkg', 2, 0, '2009-05-26 10:41:52'),
(12, 'ghkjm', 2, 0, '2009-05-26 10:41:55'),
(13, 'heroin', 0, 0, '2009-06-12 15:58:04'),
(14, 'nature', 0, 0, '2009-06-20 12:08:56');

-- --------------------------------------------------------

--
-- Table structure for table `wallpaper_images`
--

CREATE TABLE IF NOT EXISTS `wallpaper_images` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `parentid` int(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `active` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wallpaper_images`
--

INSERT INTO `wallpaper_images` (`id`, `parentid`, `title`, `active`) VALUES
(1, 0, 'priyanka', 0);
