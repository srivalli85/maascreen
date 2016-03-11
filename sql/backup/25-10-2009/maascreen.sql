-- phpMyAdmin SQL Dump
-- version 3.1.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 25, 2009 at 11:55 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=86 ;

--
-- Dumping data for table `categeory`
--

INSERT INTO `categeory` (`id`, `catname`, `parentid`, `active`, `update_date`) VALUES
(77, 'athadu', 66, 0, '2009-05-19 17:54:41'),
(78, 'good  pictures', 0, 0, '2009-05-19 17:53:10'),
(79, 'godavari', 66, 0, '2009-05-19 17:55:02'),
(80, 'ssad', 78, 0, '2009-05-21 09:57:48'),
(81, 'adsda', 78, 0, '2009-05-21 09:57:51'),
(82, 'ytyt', 78, 0, '2009-05-21 10:45:55'),
(83, '67657', 0, 0, '2009-05-21 10:46:03'),
(84, 'kjsdf;k', 0, 0, '2009-06-16 16:48:57'),
(85, 'fdgkj;ls', 84, 0, '2009-06-16 16:49:11');

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
  `active` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `film_news`
--

INSERT INTO `film_news` (`id`, `heading`, `summery`, `description`, `insert_date`, `breaking_news`, `active`) VALUES
(50, 'Priya Anand opposite Ram', '<font><font style="color: #000000; font-family: verdana; font-size: 13px; text-decoration: none;">Priya Anand, who is all set to debut with critically-acclaimed director Shekar Kammula''s ongoing <em>Leader </em>opposite debutant Daggubati Rana, has been roped in to playthe lead role in actor Ram''s next project titled <em>Krishna Krishna Rama Rama</em>,</font></font>', '<font style="color: #000000; font-family: verdana; font-size: 13px; text-decoration: none;"><p>Priya Anand, who is all set to debut with critically-acclaimed director Shekar Kammula''s ongoing <em>Leader </em>opposite debutant Daggubati Rana, has been roped in to playthe lead role in actor Ram''s next project titled <em>Krishna Krishna Rama Rama</em>,\nproduced by Dil Raju and directed by Srivas (Lakshyam fame). Arjun\nplays a vital role in this movie, set to begin its regular shoot from\nJuly.</p>\n<p>Meanwhile, her <em>Leader</em>, touted to be an action-packed\nentertainer, is progressing briskly at various locations of Andhra\nPradesh. Priya Anand is also busy with director Ahmed''s Tamil flick <em>Vaamanan</em>, starring Jai and Lakshmi Rai in the lead. <em>Vaamanan </em>is the story of a person who wants to become a film hero.</p></font>', '2009-06-06', 1, 0),
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
(66, 'hi hellooooo', 'sdgsdfgdfg', 'dsfgdfgdfg', '2009-06-10', 0, 0),
(68, 'malleswari', 'vgdfdsfsdf', 'dfgdfgdfgdfgdfg', '2009-06-10', 0, 0),
(69, 'pradeepfsdf', 'dskf kdsfk sdf', 'wd sa dsads', '2009-02-02', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `flash_player`
--

CREATE TABLE IF NOT EXISTS `flash_player` (
  `id` int(10) DEFAULT NULL,
  `controlbar` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `height` int(3) DEFAULT NULL,
  `width` int(3) DEFAULT NULL,
  `playlist` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skin` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autostart` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bufferlength` tinyint(2) DEFAULT NULL,
  `displayclick` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icons` tinyint(1) DEFAULT NULL,
  `linktarget` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mute` tinyint(1) DEFAULT NULL,
  `quality` tinyint(1) DEFAULT NULL,
  `repeat` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resizing` tinyint(1) DEFAULT NULL,
  `shuffle` tinyint(1) DEFAULT NULL,
  `stretching` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `volume` smallint(3) DEFAULT NULL,
  `aboutlink` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flash_player`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `gallery_categeory`
--

INSERT INTO `gallery_categeory` (`id`, `catname`, `parentid`, `active`, `update_date`) VALUES
(5, 'fds', 0, 0, '2009-05-27 13:25:46'),
(6, 'RAJESH', 0, 0, '2009-07-29 11:59:36'),
(7, 'raj', 6, 0, '2009-07-29 11:59:45'),
(8, 'raviteja', 0, 0, '2009-08-25 10:10:56'),
(9, 'actors', 0, 0, '2009-08-25 10:11:26'),
(10, 'raviteja', 9, 0, '2009-08-25 10:11:34'),
(11, 'chiru', 0, 0, '2009-08-25 10:12:53');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `gallery_images`
--

INSERT INTO `gallery_images` (`id`, `title`, `parentid`, `active`) VALUES
(1, 'dfgdfg', 7, 0),
(2, 'dfhhh', 7, 0),
(3, 'image1', 10, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `parentid`, `title`, `active`) VALUES
(1, 77, 'sfdsfds', 0),
(2, 77, 'rtytrytyryrty', 0),
(3, 80, 'dfsdsfsdf', 0),
(4, 85, 'jkdsklfks', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=189 ;

--
-- Dumping data for table `int_goss`
--

INSERT INTO `int_goss` (`id`, `person_name`, `description`, `on_date`, `insert_date`, `type`, `active`) VALUES
(102, 'sdas', 'dsadsad', '2009-02-02', '2009-05-21 18:38:52', 'Interview', 0),
(104, 'sdfdsf dsf', '<P>dsf dsf dsf dsf dsfds</P>\n<P>f</P>\n<P>dsfds</P>\n<P>f</P>\n<P>dsf</P>\n<P>ds</P>', '2009-02-02', '2009-05-21 18:45:58', 'Interview', 0),
(107, 'dgfd', 'fdgfdfgfdg', '2009-02-03', '2009-05-26 17:54:40', 'Interview', 0),
(108, 'sad', 'sadsa', '2009-02-02', '2009-05-26 17:55:31', 'Interview', 0),
(109, 'sad', 'sadsa', '2009-02-02', '2009-05-26 17:59:32', 'Interview', 0),
(110, 'dasd', 'sads', '2009-02-02', '2009-05-26 18:00:28', 'Interview', 0),
(111, 'dasd', 'sads', '2009-02-02', '2009-05-26 18:29:12', 'Interview', 0),
(112, 'fgfdgfdgdfg', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '0000-00-00', '2009-05-27 16:15:28', 'Interview', 0),
(113, 'dsfsdfsdfsdf', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '0000-00-00', '2009-05-27 16:16:04', 'Interview', 0),
(114, 'asdasdsa', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '0000-00-00', '2009-05-27 16:16:32', 'Interview', 0),
(115, 'sadasd', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '0000-00-00', '2009-05-27 16:21:54', 'Interview', 0),
(116, 'sfdfsdf', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '0000-00-00', '2009-05-27 16:24:20', 'Gossips', 0),
(117, 'qewe', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-27 16:30:14', 'Interview', 0),
(118, 'asdsadsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:26:58', 'Interview', 0),
(119, 'asdsadsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:30:01', 'Interview', 0),
(120, 'asdsadsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:30:21', 'Interview', 0),
(121, 'asdsadsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:30:38', 'Interview', 0),
(122, 'saadsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:31:13', 'Interview', 0),
(123, 'saadsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:31:31', 'Interview', 0),
(124, 'saadsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:32:36', 'Interview', 0),
(125, 'saadsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:32:45', 'Interview', 0),
(126, 'saadsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:34:35', 'Interview', 0),
(127, 'saadsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:35:05', 'Interview', 0),
(128, 'saadsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:45:28', 'Interview', 0),
(129, NULL, NULL, NULL, '2009-05-29 09:45:28', NULL, 0),
(130, 'saadsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:45:34', 'Interview', 0),
(131, NULL, NULL, NULL, '2009-05-29 09:45:34', NULL, 0),
(132, 'sads', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:46:51', 'Interview', 0),
(133, 'asds', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:47:37', 'Interview', 0),
(134, 'asds', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:47:50', 'Interview', 0),
(135, 'sdsadsa', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:48:01', 'Interview', 0),
(136, 'sad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:48:33', 'Interview', 0),
(137, 'sadsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:51:11', 'Interview', 0),
(138, 'sadsadsa', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:58:31', 'Interview', 0),
(139, 'sdfd', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 09:58:56', 'Interview', 0),
(140, 'sadsa', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '0200-02-02', '2009-05-29 10:02:39', 'Interview', 0),
(141, 'sadsa', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '0200-02-02', '2009-05-29 10:03:07', 'Interview', 0),
(142, 'sadsa', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '0200-02-02', '2009-05-29 10:03:25', 'Interview', 0),
(143, 'sadsa', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '0200-02-02', '2009-05-29 10:06:17', 'Interview', 0),
(144, 'sadsa', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '0200-02-02', '2009-05-29 10:06:41', 'Interview', 0),
(145, 'sadsa', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '0200-02-02', '2009-05-29 10:07:47', 'Interview', 0),
(146, 'sadsa', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '0200-02-02', '2009-05-29 10:08:06', 'Interview', 0),
(147, 'sadsa', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '0200-02-02', '2009-05-29 10:08:48', 'Interview', 0),
(148, 'sadsa', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '0200-02-02', '2009-05-29 10:08:53', 'Interview', 0),
(149, 'sadsa', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '0200-02-02', '2009-05-29 10:19:37', 'Interview', 0),
(150, 'asdsa', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 10:20:19', 'Interview', 0),
(151, 'zcczxxzcz', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 10:23:22', 'Interview', 0),
(152, 'sdasdsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 10:23:45', 'Interview', 0),
(153, 'dfds', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 10:25:16', 'Interview', 0),
(154, 'sadsa', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 10:25:47', 'Interview', 0),
(155, 'asdas', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 10:29:09', 'Interview', 0),
(156, 'sad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 10:31:04', 'Interview', 0),
(188, 'asdsa', 'dasds', '2009-02-02', '2009-06-13 17:40:02', 'Interview', 0),
(158, 'sdsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 10:32:27', 'Interview', 0),
(159, 'sdsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 10:32:51', 'Interview', 0),
(160, 'sdsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 10:33:53', 'Interview', 0),
(161, 'dsads', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 10:35:09', 'Interview', 0),
(162, 'dsads', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 10:36:05', 'Interview', 0),
(163, 'dsads', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 10:36:27', 'Interview', 0),
(164, 'dsads', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 10:37:01', 'Interview', 0),
(165, 'dsads', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 11:59:22', 'Interview', 0),
(166, 'dasd', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 11:59:44', 'Interview', 0),
(167, 'dsfdsfdsf', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 12:00:02', 'Interview', 0),
(168, 'sdf', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 12:03:14', 'Interview', 0),
(169, 'dsfsd', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 12:03:29', 'Interview', 0),
(170, 'sdfsdfdsf', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 13:09:28', 'Interview', 0),
(171, 'dsfdf', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 13:18:27', 'Interview', 0),
(172, 'dsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 13:18:54', 'Interview', 0),
(173, 'sdfd', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 13:19:46', 'Interview', 0),
(174, 'asd', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 13:20:47', 'Gossips', 0),
(175, 'sasadsa', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 13:23:36', 'Interview', 0),
(176, 'sdasd', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 13:24:16', 'Interview', 0),
(177, 'sdsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 13:28:34', 'Interview', 0),
(178, 'sdfdsf', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 13:28:48', 'Interview', 0),
(179, 'dsa', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 14:41:54', 'Interview', 0),
(180, 'dasdsadsads', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 14:46:28', 'Interview', 0),
(181, 'sasdsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 14:46:48', 'Interview', 0),
(182, 'asdsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 16:31:29', 'Interview', 0),
(183, 'sadsad', 'here&#39;s the "<em>preloaded</em> <b>content</b>"', '2009-02-02', '2009-05-29 16:32:10', 'Interview', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=109 ;

--
-- Dumping data for table `int_goss_media`
--

INSERT INTO `int_goss_media` (`id`, `int_goss_id`, `media_name`, `media_type`, `active_video`, `insert_date`, `active`) VALUES
(104, 184, 'Interview', 'Image', 0, '2009-06-13 15:53:24', 0),
(105, 185, 'Interview', 'Image', 0, '2009-06-13 17:28:28', 0),
(106, 186, 'Gossips', 'Image', 0, '2009-06-13 17:28:41', 0),
(107, 187, 'Interview', 'Image', 0, '2009-06-13 17:38:59', 0),
(108, 188, 'Interview', 'Image', 0, '2009-06-13 17:40:02', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `movie_name`, `release_date`, `wallpapers_id`, `gallery_id`, `interview_id`, `insert_date`, `active`) VALUES
(1, 'kick', '2009-02-22', 14, 100, NULL, '2009-06-10 10:27:21', 0),
(2, 'diary', '2009-05-29', NULL, NULL, NULL, '2009-06-08 15:49:56', 0),
(3, 'Prayanam', '2009-05-29', NULL, NULL, NULL, '2009-06-08 16:02:30', 0),
(4, 'Arundhati', '2009-01-16', 14, 95, NULL, '2009-06-10 10:27:47', 0),
(7, 'Don1', '2008-11-02', 17, 0, NULL, '2009-06-09 17:16:26', 0);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE IF NOT EXISTS `newsletter` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`, `active`, `insert_date`) VALUES
(1, 'Subscribe here', 0, '0000-00-00 00:00:00'),
(2, 'Subscribe here', 0, '0000-00-00 00:00:00'),
(3, 'asas', 0, '0000-00-00 00:00:00'),
(4, 'aSAs', 0, '0000-00-00 00:00:00'),
(5, 'asd', 0, '0000-00-00 00:00:00'),
(6, 'asds', 0, '0000-00-00 00:00:00'),
(7, 'fgfdg@dfdfdf', 0, '0000-00-00 00:00:00'),
(8, 'sdfdsfds@dfdsfd', 0, '0000-00-00 00:00:00'),
(9, 'rampeli.prade@dsfds.sdfdsdf', 0, '0000-00-00 00:00:00'),
(10, 'rampelli.pradeep@gmail.com', 0, '0000-00-00 00:00:00'),
(11, 'subbareddyonline4u@gmail.com', 0, '0000-00-00 00:00:00'),
(12, 'mail2rampelli@gmail.com', 0, '2009-06-12 11:42:02'),
(13, 'fsafdsasds@ddd.com', 0, '2009-07-18 18:15:41');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `movie_id`, `punchline`, `genre`, `type`, `banner`, `cast`, `art`, `music`, `cinematography`, `stunts`, `editing`, `story`, `screenplay`, `direction`, `producer`, `summary`, `description`, `rating`, `image`, `active`, `insert_date`) VALUES
(3, 1, 'Catch if u can', 'Comedy1', 'Straight', 'RR Moviemkers', 'Ravi Teja, Ileana, Shyam, Brahmanandam, Kota, Venu Madhav, Sayaji Shinde, Jaya Prakash Reddy, Ali, Benerjee, Chalapati Rao', 'Narayana Reddy ', 'Thaman S ', 'Rasool Ellore', 'Vijay ', 'Gowtam Raju', 'Surender Reddy ', 'Surender Reddy ', 'Surender Reddy ', 'Venkat ', '<span class="Apple-style-span" style="word-spacing: 0px; font-family: ''times new roman''; font-style: normal; font-variant: normal; font-weight: normal; font-size: 16px; line-height: normal; font-size-adjust: none; font-stretch: normal; text-transform: none; color: #000000; text-indent: 0px; white-space: normal; letter-spacing: normal; border-collapse: separate; orphans: 2; widows: 2;"><font size="2" face="Arial, Helvetica, sans-serif">The movie starts off with an entertaining first half though there is not much of a story. The movie lacks pace in the second half and do appear prolonged at times. But a purposeful flashback and an entertaining climax makes up for it.&nbsp; .....<br></font></span>																											', '<span class="Apple-style-span" style="word-spacing: 0px; font-family: ''times new roman''; font-style: normal; font-variant: normal; font-weight: normal; font-size: 16px; line-height: normal; font-size-adjust: none; font-stretch: normal; text-transform: none; color: #000000; text-indent: 0px; white-space: normal; letter-spacing: normal; border-collapse: separate; orphans: 2; widows: 2;">\n<p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"><b><font color="#0000ff">Story</font></b><br><br><img style="width: 150px; height: 100px;" alt="kick" src="http://idlebrain.com/images4/small-kick2.jpg" vspace="" align="right" border="0" hspace="">Kalyan (Ravi Teja) is a kind of guy who prefers a life full of thrills than leading a regular life style. He seeks kick in whatever he does. He finds liking in Naina (Ileana). They separate due to differences. Krishna (Shyam) is a young cop who is in lookout for a big ticket thief who happens to be Kalyan. Meanwhile, Naina agrees for an engagement with Krishna. The rest of the story is all about how Kalyan wins back his lady love and the real intent behind the robberies of Kalyan.</font></p>\n<p align="justify"><font size="2" color="#0000ff" face="Arial, Helvetica, sans-serif"><b>Artists Performance</b></font></p>\n<p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"><img style="width: 150px; height: 100px;" alt="kick" src="http://idlebrain.com/images4/small-kick3.jpg" vspace="" align="left" border="0" hspace=""><strong>Ravi Teja:</strong><span class="Apple-converted-space">&nbsp;</span>Ravi Teja is known for entertainment and he made sure that he contributed a lot for this movie with his kind of antics. He also mimicked many actors like Amitabh Bachchan in an entertaining way. You can see lot of similarities between Ravi Teja’s character in this movie and Pawan Kalyan’s character in Jalsa.</font></p>\n<p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"><img style="width: 150px; height: 100px;" alt="kick" src="http://idlebrain.com/images4/small-kick6.jpg" vspace="" align="right" border="0" hspace=""><strong>Others:</strong><span class="Apple-converted-space">&nbsp;</span>Ileana is looking fresh and pretty in this movie. Shyam is perfect as a sincere cop who is set out to nab the robber. Brahmanandam did another entertaining role of Halwa Raj. Jaya Prakash Reddy’s role of comedy cop is funny (especially tom n jerry kind of sequence in police station). Kota did the role of chief minister. Venu Madhav, Ali and Sayaji Shinde are adequate.</font></p>\n<p style="color: #CC3300;" align="justify"><font size="2" face="Arial, Helvetica, sans-serif"><b>Technical departments</b></font></p>\n<p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"><img style="width: 150px; height: 100px;" alt="kick" src="http://idlebrain.com/images4/small-kick8.jpg" vspace="" align="left" border="0" hspace=""><strong>Story - screenplay - direction</strong>: The story of the movie is about a guy with abnormal life style doing something purposeful. Though the story of the movie is pretty serious, the director has chosen comedy as the way of expression. Hence, you find only 20% of the movie to be serious and remaining 80% is dedicated for humor. Surender Reddy whose strength lies in conceiving good action episodes concentrated more on comedy and ignored his strength of technical glossiness. This film is entertaining as long as you don’t mind the script and story. If you look from the script angle, the fifteen minutes before interval and the last 20 minutes make sense. The director must have chosen to treat this movie with humor aspect after seeing another mass director VV Vinayak coming out with flying colors with humor treatment of Krishna movie with Ravi Teja. The idea of ‘loser’ code word is good. This film has similarities to movies like Gentleman and Dhoom. And the director has shown a noble intent behind hero’s robberies unlike Dhoom film where hero does it for fun. However, the sophistication and technical orientation in heist episodes is missing. The robberies and chases in the movie are unexciting.</font></p>\n<p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"><img style="width: 150px; height: 100px;" alt="kick" src="http://idlebrain.com/images4/small-kick9.jpg" vspace="" align="right" border="0" hspace=""><strong>Other departments</strong>: Music by S Thaman is mediocre. Cinematography by Rasool is just okay, however there is not much lighting used for the scenes shot in Malaysia. Dialogues are adequate. But, the heroine utters curse words very often (she said<span class="Apple-converted-space">&nbsp;</span><em>naa kodaka</em><span class="Apple-converted-space">&nbsp;</span>for four times,<span class="Apple-converted-space">&nbsp;</span><em>nee yabba</em>innumerable times). The postproduction of the movie lacks finesse.</font></p>\n<p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"><img style="width: 150px; height: 100px;" alt="kick" src="http://idlebrain.com/images4/small-kick5.jpg" vspace="" align="left" border="0" hspace=""><strong>Analysis</strong>: The movie starts off with an entertaining first half though there is not much of a story. The movie lacks pace in the second half and do appear prolonged at times. But a purposeful flashback and an entertaining climax makes up for it. The plus points of the film are Ravi Teja, Ileana and comedy. On the flip side, the runtime of the movie is excessive and the sophistication/finesse expected out of such big projects is missing. On a whole, Kick is like a poor man’s Dhoom stuffed with ample Ravi Teja kind of comedy. You may watch it for entertainment.</font></p></span>																											', '1', 0, 0, '2009-06-04 11:14:32'),
(12, 1, 'dfssdf', 'dsfds', 'fsd', 'fdsfd', 'dfssdf', 'fsd', 'dsfsd', 'dfssdf', 'fsdf', 'dfd', 'fdf', 'fdsf', 'fdsf', 'dfsd', 'fsdfdsf ', 'sfdfdsf ', '2', 0, 0, '2009-06-08 11:16:05'),
(13, 2, 'forbidden writings', 'Thriller', 'Straight', 'Gen Next Movies ', ' Sivaji, Shraddha Das, Sridhar, Yandamuri Veerendranath, Jeeva, Dr. Siva Prasad, Harsha Vardhan etc', ' Vishal', 'Mantra Anand', ' Srinivasa Reddy', '', 'Gowtam Raju', 'Aroon', 'Aroon - Kalyan Ram Chukka', 'Machakanti Rama Krishna', 'Kalyan Ram Chukka', '<font size="2" face="Arial, Helvetica, sans-serif">Diary is touted as a\nsequel to Mantra movie. But there is no resemblance between Mantra and\nDiary except that both of them are thrillers. Diary takes off in an\ninteresting way and there is good revelation in the interval. But the\nnarration goes off-center in the second half and the climax appears\ncomical.</font>', '<p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"><b><font color="#0000ff">Story</font></b><br>\n                              <br>\n                              <img src="http://www.idlebrain.com/images4/small-diary10.jpg" alt="diary" width="150" align="right" height="100">\nVamsi (Sivaji) buys a used and fully-furnished beach house in Vizag\nfrom a real estate dealer. He saves a dancing girl Maya (Shraddha Das)\nfrom a goon in a local gathering. She stays along with Vamsi in his\nhouse during that night because it was raining heavily. As they explore\nthe house in the night, they find a diary written in 2002. They find\nout that it was written by the man who owned that house in the past.\nHis wife gets killed and she is rumored to be staying there as a ghost.\nAnd the events mentioned in the diary start happened to this pair. The\nrest of the story is about unlocking the mystery behind the house.</font></p>\n                            <p align="justify"><font size="2" color="#0000ff" face="Arial, Helvetica, sans-serif"><b>Artists Performance</b></font></p>\n                            <p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"><img src="http://www.idlebrain.com/images4/small-diary8.jpg" alt="diary" width="150" align="left" height="100">Sivaji\nis very good in this movie. He improvised many scenes and dialogues.\nShraddha Das is good in the role of mystic Maya. She has less to talk\nand more to express. She suited the role well though one would raise\ndoubts about the sophistication in expressions of a dancing girl\n(characterization inconsistency). She extremely glamorous as she wears\nnothing but a full sleeves shirt in most of the first half. Dr. Siva\nPrasad provides comedy though it is loud. Sridhar is good as the guy\nfrom flashback. The girl who did Sridhar’s wife is adequate. Yandamuri\nVeerendranath did a special appearance in the climax and he has got\ngood comedy timing. Jeeva is fine.</font></p>\n                            <p align="justify"><font size="2" color="#0000ff" face="Arial, Helvetica, sans-serif"><b>Technical departments</b></font></p>\n                            <p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"><img src="http://www.idlebrain.com/images4/small-diary6.jpg" alt="diary" width="150" align="right" height="100"><strong>Story - screenplay - direction</strong>:\nStory of the movie is different, but not complete. The ending is\nincomplete and there are glaring loop holes at script level. The\nconcept of Diary reminded me of Yandamuri Veerandranath’s Thriller\nnovel where a few pages are left blank for us to write something on it.\nThe writer tried to pen the screenplay in different way. But there is a\nflaw in it as they end up showing the same flashback heroine even after\nthe identty of the girl was revealed. Direction of the movie is ok in\nthe first half and it lacks grip in the second half. The director\nshould have taken care of a few silly mistakes (showing CBIT yellow bus\non the roads of Vizag and Sakshi newspaper in year 2002). A village\ndancer showing such sophistication when she enters hero’s house shows\ninconsistency in that character. </font></p>\n                            <p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"><img src="http://www.idlebrain.com/images4/small-diary5.jpg" alt="diary" width="150" align="left" height="100"><strong>Other departments</strong>:     Background <a id="KonaLink4" target="undefined" class="kLink" style="text-decoration: underline ! important; position: static;" href="http://www.idlebrain.com/movie/archive/mr-diary.html#"><font style="color: blue ! important; font-family: Arial,Helvetica,sans-serif; font-weight: 400; font-size: 13px; position: static;" color="blue"><span class="kLink" style="color: blue ! important; font-family: Arial,Helvetica,sans-serif; font-weight: 400; font-size: 13px; position: static;">music</span></font></a>\nby Mantra Anand is good. Cinematography by Srinivasa Reddy is nice. The\nproducers have taken proper care in the post-production of the movie\nand it showed up. The entire movie is good at technical level. Editing\nis adequate. Dialogues are satisfactory. Art direction is commendable.</font></p>\n                            <p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"><img src="http://www.idlebrain.com/images4/small-diary4.jpg" alt="diary" width="150" align="right" height="100"><strong>Analysis</strong>:\nDiary is touted as a sequel to Mantra movie. But there is no\nresemblance between Mantra and Diary except that both of them are\nthrillers. Diary takes off in an interesting way and there is good\nrevelation in the interval. But the narration goes off-center in the\nsecond half and the climax appears comical. Though there are a few\nchilling moments in the movie, logic-less climax and slack second half\nwork against the movie. </font></p>', '2', 0, 0, '2009-06-08 15:54:42'),
(14, 4, 'magnum opus', 'Thriller', ' Straight ', 'Mallemala Entertainments ', 'Anushka, Sonu Sood, Deepak, Manorama, Sayaji Shinde, Kaikala Satyanarayana, Ahuti Prasad, Annapurna', 'Ashok', 'Koti ', 'Senthil Kumar ', '', 'Marthand K Venkatesh', 'Mallemala unit ', 'Mallemala unit ', 'Kodi Rama Krishna', 'M Shyam Prasad Reddy', '<font size="2" face="Arial, Helvetica, sans-serif">First half of the film is excellent and the second half is good. The\nplus points of the film are performances, screenplay, technical values\nand grandeur. The only negative point I see in this film is violence\n(got an A certificate from censors), which is very much required for\nthe film to be effective. After a long time, I watched a Telugu film\nthat has both content and technology rightly mixed to give a vibrant\noutput.</font>', '<p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"><b><font color="#0000ff">Story</font></b><br>\n                              <br>\n                              <img src="http://www.idlebrain.com/images4/small-arundhati1.jpg" alt="arundhati" width="150" align="right" height="100">\nArundhati (Anushka) belongs to Gadwal samsthanam in 1920’s. She is\nknown for her bravery in saving the Samstanam by killing Pasupathi\n(Sonu Sood) an evildoer who creates ruckus in that place. She is\npraised as Jejemma (named after the famous Goddess in that area). But\nthe spirit of Pasupathi haunts that place. Another girl is born in the\nsame lineage after 3 generations and she is named as Arundhati. The\nspirit of Pasupati is after Arundhati to take the revenge. The rest of\nthe story is all about how Arundhati puts an end to the evil spirit of\nPasupathi.</font></p>\n                            <p align="justify"><font size="2" color="#0000ff" face="Arial, Helvetica, sans-serif"><b>Artists Performance</b></font></p>\n                            <p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"><img src="http://www.idlebrain.com/images4/small-arundhati10.jpg" alt="arundhati" width="150" align="left" height="100"><strong>Anushka:</strong>\nThis is Anushka’s first performance oriented film and she is simply\namazing in two roles. There are many shots in the film where the scenes\nfrom the present time will dissolve into to flashback and vice versa.\nThese scenes are done on Anushka are crucial in the film. She has to\nshow the variations between the old Arundhati and new Arundhati. She\ndid exceptionally well with subtle yet impact creating performance.\nShilpa and Sowmya dubbed the voices of old and new characters\nrespectively.</font></p>\n                            <p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"><img src="http://www.idlebrain.com/images4/small-arundhati11.jpg" alt="arundhati" width="150" align="right" height="100"><strong>Others:</strong> Sonu Sood looks deadly in the role of Aghora. His performance is excellent. A special mention should be given to P <a id="KonaLink2" target="undefined" class="kLink" style="text-decoration: underline ! important; position: static;" href="http://www.idlebrain.com/movie/archive/mr-arundhati.html#"><font style="color: blue ! important; font-family: Arial,Helvetica,sans-serif; font-weight: 400; font-size: 13px; position: static;" color="blue"><span class="kLink" style="color: blue ! important; font-family: Arial,Helvetica,sans-serif; font-weight: 400; font-size: 13px; position: static;">Ravi </span><span class="kLink" style="color: blue ! important; font-family: Arial,Helvetica,sans-serif; font-weight: 400; font-size: 13px; position: static;">Shankar</span></font></a>\nwho dubbed the voice of Sonu Sood. It is a great opportunity for any\ndubbing artists to get a role like this. The way he pronounces ‘ninnu\nvadalaa … vasta .. vasta’ is extremely good. Sayaji Shinde got a\nbeautiful role ‘Talla Sayibu’ in this film. He is completely believable\nin that role. Manorama is very good. Deepak is nice. Satyanarayana and\nothers are good. All other artists are appropriately cast in their\nroles. </font></p>\n                            <p align="justify"><font size="2" color="#0000ff" face="Arial, Helvetica, sans-serif"><b>Technical departments</b></font></p>\n                            <p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"><img src="http://www.idlebrain.com/images4/small-arundhati6.jpg" alt="arundhati" width="150" align="left" height="100"><strong>Story - screenplay - direction</strong>:\nStory of the film is good. Screenplay is very good. The beauty of this\nscreenplay is about revealing the story and information in parts. There\nis always something to look forward to with anticipation in the film.\nIt possesses one of the best screenplays in the recent times. Direction\nby Kodi Rama Krishna is very good. However, there are a couple of\nviolent scenes that are disturbing to the family crowds. You can see a\nfew <a id="KonaLink3" target="undefined" class="kLink" style="text-decoration: underline ! important; position: static;" href="http://www.idlebrain.com/movie/archive/mr-arundhati.html#"><font style="color: blue ! important; font-family: Arial,Helvetica,sans-serif; font-weight: 400; font-size: 13px; position: static;" color="blue"><span class="kLink" style="color: blue ! important; font-family: Arial,Helvetica,sans-serif; font-weight: 400; font-size: 13px; position: static;">Hollywood</span></font></a>\ninspirations like Lord of the Rings, House of Flying Daggers (drum\ndance), Final Destination 1 (car - train episode). A couple of episodes\n(the thread of drum dance by the guru &amp; establishing Arundhati as\nthe warrior) should have been more effectively established. </font></p>\n                            <p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"><img src="http://www.idlebrain.com/images4/small-arundhati7.jpg" alt="arundhati" width="150" align="right" height="100"><strong>Other departments</strong>:   Visual effects and graphics done by Rahul Nambiar are extraordinary. Cinematography by Senthil Kumar is excellent. <a id="KonaLink4" target="undefined" class="kLink" style="text-decoration: underline ! important; position: static;" href="http://www.idlebrain.com/movie/archive/mr-arundhati.html#"><font style="color: blue ! important; font-family: Arial,Helvetica,sans-serif; font-weight: 400; font-size: 13px; position: static;" color="blue"><span class="kLink" style="color: blue ! important; font-family: Arial,Helvetica,sans-serif; font-weight: 400; font-size: 13px; position: static;">Background </span><span class="kLink" style="color: blue ! important; font-family: Arial,Helvetica,sans-serif; font-weight: 400; font-size: 13px; position: static;">music</span></font></a> and rerecording by Koti is brilliant. The <a id="KonaLink5" target="undefined" class="kLink" style="text-decoration: underline ! important; position: static;" href="http://www.idlebrain.com/movie/archive/mr-arundhati.html#"><font style="color: blue ! important; font-family: Arial,Helvetica,sans-serif; font-weight: 400; font-size: 13px; position: static;" color="blue"><span class="kLink" style="color: blue ! important; font-family: Arial,Helvetica,sans-serif; font-weight: 400; font-size: 13px; position: static;">songs</span></font></a>\nin the film go with the flow of narration. Art direction by Ashok is\nfirst-rate. Make-up work is good. Editing is smooth. Digital Ingredient\n(color grading) is very good. Production values of this film are\nextravagant. </font></p>\n                            <p align="justify"><font size="2" face="Arial, Helvetica, sans-serif"><img src="http://www.idlebrain.com/images4/small-arundhati8.jpg" alt="arundhati" width="150" align="left" height="100"><strong>Analysis</strong>:\nFirst half of the film is excellent and the second half is good. The\nplus points of the film are performances, screenplay, technical values\nand grandeur. The only negative point I see in this film is violence\n(got an A certificate from censors), which is very much required for\nthe film to be effective. After a long time, I watched a Telugu film\nthat has both content and technology rightly mixed to give a vibrant\noutput. Arundhati is a film which you can proudly show it as a Telugu\nfilm to all your non-Telugu friends. And it will live up to the\nadjective of ‘Magnum Opus’. Two thumbs up to Shyam Prasad Reddy for\nmaking a brilliant film. Don’t watch it on internet or pirated DVDs.\nArundhati is a film that must be watched in a good theater with nice\nsound/projection system. </font></p>', '4', 0, 0, '2009-06-08 16:09:18');

-- --------------------------------------------------------

--
-- Table structure for table `slideimages`
--

CREATE TABLE IF NOT EXISTS `slideimages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `slideimages`
--

INSERT INTO `slideimages` (`id`, `title`) VALUES
(13, 'hello'),
(15, 'octavio funny show'),
(16, 'ravi teja kick movie');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE IF NOT EXISTS `songs` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `name`, `time`) VALUES
(1, 'dhgchdgfh', ''),
(2, 'www', '23');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=78 ;

--
-- Dumping data for table `trailors`
--

INSERT INTO `trailors` (`t_id`, `movie_id`, `trailor_name`, `time_sec`, `insert_date`, `on_date`, `active`) VALUES
(77, 1, 'basha', '03:03 sec', '2009-06-10 15:20:31', '0000-00-00', 1),
(76, 1, 'kick fights', '02:02:02', '2009-06-10 14:41:13', '0000-00-00', 1);

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
  `time` varchar(10) NOT NULL DEFAULT '00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `video_cat_id`, `name`, `videouploaded`, `no_of_views`, `active`, `insert_date`, `last_viewed`, `time`) VALUES
(24, 3, 'katrina', 1, 12001, 0, '2009-03-06 18:56:04', '0000-00-00', '00:00'),
(27, 4, 'burru pitta', 1, 12000, 0, '2009-04-10 11:16:35', '0000-00-00', '00:00'),
(29, 5, 'vana', 1, 12001, 0, '2009-04-10 11:17:38', '0000-00-00', '00:00'),
(30, 4, 'chitti miriyalu', 1, 1201, 0, '2009-03-10 11:59:12', '0000-00-00', '00:00'),
(31, 0, 'jfd;lklkg', 1, 28, 0, '2009-06-16 16:55:38', '0000-00-00', '344543'),
(32, 0, 'jfd;lklkg', 1, 29, 0, '2009-06-16 16:57:56', '0000-00-00', '344543'),
(33, 0, 'jfd;lklkg', 1, 32, 0, '2009-06-16 16:59:03', '0000-00-00', '344543'),
(34, 0, 'jfd;lklkg', 1, 25, 0, '2009-06-16 16:59:51', '0000-00-00', '344543'),
(35, 0, 'jfd;lklkg', 1, 24, 0, '2009-06-16 17:00:04', '0000-00-00', '344543'),
(36, 0, 'jfd;lklkg', 1, 25, 0, '2009-06-16 17:00:46', '0000-00-00', '344543'),
(37, 0, 'jfd;lklkg', 1, 32, 0, '2009-06-16 17:04:43', '0000-00-00', '344543'),
(38, 0, 'jfd;lklkg', 1, 26, 0, '2009-06-16 17:05:08', '0000-00-00', '344543'),
(39, 0, 'jfd;lklkg', 1, 30, 0, '2009-06-16 17:07:03', '0000-00-00', '344543');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `videos_categeory`
--

INSERT INTO `videos_categeory` (`id`, `name`, `insert_date`, `active`) VALUES
(1, 'new', '2009-08-09 16:06:32', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wallpaper_categeory`
--

CREATE TABLE IF NOT EXISTS `wallpaper_categeory` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `catname` varchar(100) NOT NULL,
  `parentid` int(20) NOT NULL,
  `active` int(10) NOT NULL DEFAULT '0',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `wallpaper_categeory`
--

INSERT INTO `wallpaper_categeory` (`id`, `catname`, `parentid`, `active`, `update_date`) VALUES
(13, 'movies', 0, 0, '2009-06-09 10:27:13'),
(14, 'kick', 13, 0, '2009-06-09 11:41:27'),
(16, '99', 13, 0, '2009-06-09 11:41:43'),
(17, 'don', 13, 0, '2009-06-09 11:41:48'),
(18, 'acresss', 0, 0, '2009-06-09 11:43:13'),
(19, 'actors', 18, 0, '2009-07-24 11:30:42'),
(20, '', 0, 0, '2009-07-24 11:30:44');

-- --------------------------------------------------------

--
-- Table structure for table `wallpaper_images`
--

CREATE TABLE IF NOT EXISTS `wallpaper_images` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `parentid` int(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `active` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wallpaper_images`
--

INSERT INTO `wallpaper_images` (`id`, `parentid`, `title`, `active`) VALUES
(1, 0, '', 0);
