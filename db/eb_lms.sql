
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


CREATE TABLE IF NOT EXISTS `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_title` varchar(100) NOT NULL,
  `category_id` int(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `book_copies` int(11) NOT NULL,
  `book_pub` varchar(100) NOT NULL,
  `publisher_name` varchar(100) NOT NULL,
  `isbn` varchar(50) NOT NULL,
  `copyright_year` int(11) NOT NULL,
  `date_receive` varchar(20) NOT NULL,
  `date_added` datetime NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

INSERT INTO `book` (`book_title`, `category_id`, `author`, `book_copies`, `book_pub`, `publisher_name`, `isbn`, `copyright_year`, `date_receive`, `date_added`, `status`) VALUES
('Natural Resources', 8, 'Robin Kerrod', 10, 'Marshall Cavendish Corporation', 'Marshall', '1-85435-628-3', 1997, '', '2013-12-11 06:34:27', 'New'),
('Encyclopedia Americana', 5, 'Grolier', 20, 'Connecticut', 'Grolier Incorporation', '0-7172-0119-8', 1988, '', '2013-12-11 06:36:23', 'Archive'),
('Algebra 1', 3, 'Carolyn Bradshaw, Michael Seals', 35, 'Pearson Education, Inc', 'Prentice Hall, New Jersey', '0-13-125087-6', 2004, '', '2013-12-11 06:39:17', 'Damage'),
('The Philippine Daily Inquirer', 7, '..', 3, 'Pasay City', '..', '..', 2013, '', '2013-12-11 06:41:53', 'New'),
('Science in our World', 4, 'Brian Knapp', 25, 'Regency Publishing Group', 'Prentice Hall, Inc', '0-13-050841-1', 1996, '', '2013-12-11 06:44:44', 'Lost'),
('Literature', 9, 'Greg Glowka', 20, 'Regency Publishing Group', 'Prentice Hall, Inc', '0-13-050841-1', 2001, '', '2013-12-11 06:47:44', 'Old'),
('Lexicon Universal Encyclopedia', 5, 'Lexicon', 10, 'Lexicon Publication', 'Pulication Inc., Lexicon', '0-7172-2043-5', 1993, '', '2013-12-11 06:49:53', 'Old'),
('Science and Invention Encyclopedia', 5, 'Clarke Donald, Dartford Mark', 16, 'H.S. Stuttman inc. Publishing', 'Publisher , Westport Connecticut', '0-87475-450-x', 1992, '', '2013-12-11 06:52:58', 'New'),
('Integrated Science Textbook ', 4, 'Merde C. Tan', 8, 'Vibal Publishing House Inc.', '12536. Araneta Avenue Corner Ma. Clara St., Quezon City', '971-570-124-8', 2009, '', '2013-12-11 06:55:27', 'New'),
('Algebra 2', 3, 'Glencoe McGraw Hill', 9, 'The McGrawHill Companies Inc.', 'McGrawhill', '978-0-07-873830-2', 2008, '', '2013-12-11 06:57:35', 'New'),
('Wiki at Panitikan ', 7, 'Lorenza P. Avera', 28, 'JGM & S Corporation', 'JGM & S Corporation', '971-07-1574-7', 2000, '', '2013-12-11 06:59:24', 'Damage'),
('English Expressways TextBook for 4th year', 9, 'Virginia Bermudez Ed. O. et al', 23, 'SD Publications, Inc.', 'Gregorio Araneta Avenue, Quezon City', '978-971-0315-33-8', 2007, '', '2013-12-11 07:01:25', 'New'),
('Asya Pag-usbong Ng Kabihasnan ', 8, 'Ricardo T. Jose, Ph . D.', 21, 'Vibal Publishing House Inc.', 'Araneta Avenue . Cor. Maria Clara St., Quezon City', '971-07-2324-3', 2008, '', '2013-12-11 07:02:56', 'New');


CREATE TABLE IF NOT EXISTS `borrow` (
  `borrow_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(50) NOT NULL,
  `date_borrow` varchar(100) NOT NULL,
  `due_date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`borrow_id`),
  KEY `borrowerid` (`member_id`),
  KEY `borrowid` (`borrow_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=485 ;


INSERT INTO `borrow` (`member_id`, `date_borrow`, `due_date`) VALUES
(55, '2014-03-20 23:50:27', '21/03/2014'),
(55, '2014-03-20 23:49:34', '21/03/2014'),
(52, '2014-03-20 23:38:22', '03/01/2014');


CREATE TABLE IF NOT EXISTS `borrowdetails` (
  `borrow_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `borrow_id` int(11) NOT NULL,
  `borrow_status` varchar(50) NOT NULL,
  `date_return` varchar(100) NOT NULL,
  PRIMARY KEY (`borrow_details_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=165 ;


INSERT INTO `borrowdetails` (`book_id`, `borrow_id`, `borrow_status`, `date_return`) VALUES
(16, 400, 'pending', ''),
(11, 401, 'pending', ''),
(12, 402, 'returned', '2014-03-21 00:30:51');


CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_id` (`category_id`),
  KEY `classid` (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=801 ;


INSERT INTO `category` (`classname`) VALUES
('Periodical'),
('English'),
('Math'),
('Science'),
('Encyclopedia'),
('Filipiniana'),
('Newspaper'),
('General'),
('References');



CREATE TABLE IF NOT EXISTS `lost_book` (
  `Book_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` int(11) NOT NULL,
  `Member_No` varchar(50) NOT NULL,
  `Date Lost` date NOT NULL,
  PRIMARY KEY (`Book_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `year_level` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=66 ;


INSERT INTO `member` (`firstname`, `lastname`, `gender`, `address`, `contact`, `type`, `year_level`, `status`) VALUES
('Mark', 'Sanchez', 'Male', 'Talisay', '212010', 'Teacher', 'Faculty', 'Active'),
('April Joy', 'Aguilar', 'Female', 'E.B. Magalona', '00', 'Student', 'Second Year', 'Banned'),
('Alfonso', 'Pancho', 'Male', 'E.B. Magalona', '009', 'Student', 'First Year', 'Active'),
('Jonathan ', 'Antanilla', 'Male', 'E.B. Magalona', '0032', 'Student', 'Fourth Year', 'Active'),
('Renzo Bryan', 'Pedroso', 'Male', 'Silay City', '03030', 'Student', 'Third Year', 'Active'),
('Eleazar', 'Duterte', 'Male', 'E.B. Magalona', '90902', 'Student', 'Second Year', 'Active'),
('Ellen Mae', 'Espino', 'Female', 'E.B. Magalona', '123', 'Student', 'First Year', 'Active'),
('Ruth', 'Magbanua', 'Female', 'E.B. Magalona', '9340', 'Student', 'Second Year', 'Active'),
('Shaina Marie', 'Gabino', 'Female', 'Silay City', '132134', 'Student', 'Second Year', 'Active'),
('Chairty Joy', 'Punzalan', 'Female', 'E.B. Magalona', '12423', 'Teacher', 'Faculty', 'Active'),
('Kristine May', 'Dela Rosa', 'Female', 'Silay City', '1321', 'Student', 'Second Year', 'Active'),
('Chinie marie', 'Laborosa', 'Female', 'E.B. Magalona', '902101', 'Student', 'Second Year', 'Active'),
('Ruby', 'Morante', 'Female', 'E.B. Magalona', '', 'Teacher', 'Faculty', 'Active');



CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowertype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `borrowertype` (`borrowertype`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;


INSERT INTO `type` (`borrowertype`) VALUES
('Teacher'),
('Employee'),
('Non-Teaching'),
('Student'),
('Contruction');


CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;



INSERT INTO `users` (`username`, `password`, `firstname`, `lastname`) VALUES
('test', 'test', 'john', 'david');


CREATE TABLE IF NOT EXISTS `admin` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;


INSERT INTO `admin` (`username`, `password`, `firstname`, `lastname`) VALUES
('admin', 'admin', 'robert', 'smith');
