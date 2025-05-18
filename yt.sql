-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2025 at 11:22 PM
-- Server version: 5.5.27-log
-- PHP Version: 5.4.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `yt`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`email`, `password`) VALUES
('mohit@gmail.com', '123'),
('rohit@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `sn` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`sn`, `code`, `category`) VALUES
(1, 'zkoB2fmW_1', 'Mountains'),
(2, 'aIUEFYGn_2', 'Rivers'),
(3, 'k6UlfqyX_3', 'Beaches'),
(4, '9h10Tedi_4', 'Forests'),
(5, 'qP8Xao1S_5', 'Night'),
(7, 'ywOtVB7k_7', 'Sunset'),
(8, '9YdSDl1B_8', 'Cities'),
(10, 'P3CySv4J_10', 'Water'),
(13, 'K5hO2sNL_13', 'Waterfall'),
(16, 'FTz7YB8I_16', 'Grounds');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `sn` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `parent_code` varchar(20) NOT NULL,
  `vidcode` varchar(20) NOT NULL,
  `usercode` varchar(20) NOT NULL,
  `comment` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`sn`, `code`, `parent_code`, `vidcode`, `usercode`, `comment`) VALUES
(29, 'wyzg5lbC_29', '80mxGhP6_28', 'm6V50XZ1_16', 'XntjPv3k_2', 'okok'),
(31, 'tj0Vrz6g_31', '4Qg16lks_30', 'm6V50XZ1_16', 'XntjPv3k_2', '423'),
(33, 'uR3EC9As_33', 'cRrEnOxu_32', 'm6V50XZ1_16', 'XntjPv3k_2', '456'),
(35, 'LgeRXl6A_35', 'BQOdLfWn_34', 'm6V50XZ1_16', 'XntjPv3k_2', 'kkk'),
(37, 'Hui9znxv_37', 'fRHWXZEF_36', 'm6V50XZ1_16', 'XntjPv3k_2', 'mfd lmk'),
(39, 'LtXAUGEj_39', 'mRMS1XbH_38', 'm6V50XZ1_16', 'XntjPv3k_2', 'fdsa'),
(41, 'rFB46jYT_41', '0ZHOv6Lt_40', 'm6V50XZ1_16', 'XntjPv3k_2', 'sfad'),
(46, 'VuTzmsYR_46', 'ENH1naX0_44', 'm6V50XZ1_16', 'XntjPv3k_2', 'kok'),
(48, 'xqmrS4Ty_48', 'Iy4895hf_47', 'm6V50XZ1_16', 'XntjPv3k_2', 'nuuu'),
(50, 'GTEnIXFW_50', 'H4Eq7Cnd_49', 'm6V50XZ1_16', 'XntjPv3k_2', 'yes'),
(55, 'bQYzn8hE_55', 'oylgtKVa_51', 'm6V50XZ1_16', 'XntjPv3k_2', 'yesss'),
(56, 'G3fJ5xk9_56', 'oylgtKVa_51', 'm6V50XZ1_16', 'XntjPv3k_2', 'ok'),
(57, 'o3HJaQAp_57', 'oylgtKVa_51', 'm6V50XZ1_16', 'XntjPv3k_2', 'now'),
(59, 'HAEv3SYc_59', 'QO3KUxr2_58', 'm6V50XZ1_16', 'XntjPv3k_2', '121'),
(61, '5egNaY3q_61', 'M1bPFwOv_60', 'm6V50XZ1_16', 'XntjPv3k_2', '12321'),
(62, 'MhVgIcBH_62', 'M1bPFwOv_60', 'm6V50XZ1_16', 'XntjPv3k_2', '1234321'),
(64, 'Sysmj5Tv_64', 'utdFsRDZ_63', 'm6V50XZ1_16', 'XntjPv3k_2', '2'),
(65, '6Pwbji1D_65', 'utdFsRDZ_63', 'm6V50XZ1_16', 'XntjPv3k_2', '3'),
(66, 'QMg5jev6_66', 'utdFsRDZ_63', 'm6V50XZ1_16', 'XntjPv3k_2', '4'),
(68, 'n1qM704p_68', 'IkdX4jr7_67', 'm6V50XZ1_16', 'XntjPv3k_2', '2'),
(69, '5uh6Wyxm_69', 'IkdX4jr7_67', 'm6V50XZ1_16', 'XntjPv3k_2', '3'),
(71, 'l6s0hGYb_71', 'OwVgpjGd_70', 'm6V50XZ1_16', '5cYRgaD9_3', 'If any doubts watch the whole internet'),
(72, 'qWOJDesy_72', '0', 'm6V50XZ1_16', '5cYRgaD9_3', 'Great Video'),
(73, 'ZNXJPpAe_73', 'qWOJDesy_72', 'm6V50XZ1_16', '5cYRgaD9_3', '100% true'),
(74, 'omODAghq_74', '0', 'm6V50XZ1_16', '5cYRgaD9_3', 'Very Good Video'),
(75, 'I7JbaOUu_75', 'omODAghq_74', 'm6V50XZ1_16', '5cYRgaD9_3', 'Great one'),
(76, 'dx9SDYkj_76', '0', 'RZFtNAc4_9', '5cYRgaD9_3', 'Ok'),
(77, 'MZmXtxPE_77', 'dx9SDYkj_76', 'RZFtNAc4_9', '5cYRgaD9_3', 'done'),
(79, '9tMRekxq_79', '65W7Yius_78', 'Qv1V9p8t_12', '5cYRgaD9_3', 'bikaner'),
(81, 'd3u4NxPo_81', 'ydfV8jm5_80', 'Qv1V9p8t_12', '5cYRgaD9_3', '1234'),
(83, 'gLVpzaxO_83', 'Sz6QvnVk_82', 'Qv1V9p8t_12', '5cYRgaD9_3', '456'),
(84, 'ozAYJn49_84', '0', 'Qv1V9p8t_12', '5cYRgaD9_3', '123'),
(86, 'FvNDoHB9_86', 'UemvK7xN_85', 'lr2t8bNc_13', '5cYRgaD9_3', '456'),
(88, 'dFARSB3N_88', 'GjaS5o8H_87', 'lr2t8bNc_13', '5cYRgaD9_3', '456'),
(90, 'H2JSaexy_90', 'rBog43wZ_89', 'lr2t8bNc_13', '5cYRgaD9_3', '456'),
(92, 'dLGN7ymM_92', 'ymdsPk6L_91', 'lr2t8bNc_13', '5cYRgaD9_3', '456'),
(93, 'gcOFLK7d_93', 'ymdsPk6L_91', 'lr2t8bNc_13', '5cYRgaD9_3', '789'),
(95, 'r4QflwgG_95', 'XvuqHmk5_94', 'lr2t8bNc_13', '5cYRgaD9_3', '456'),
(97, 'IrLz7XpO_97', 'fMClBhw2_96', 'lr2t8bNc_13', '5cYRgaD9_3', '456'),
(98, 'JoZ6GdQH_98', 'fMClBhw2_96', 'lr2t8bNc_13', '5cYRgaD9_3', '789'),
(99, 'rh7sMFNc_99', '0', 'lr2t8bNc_13', '5cYRgaD9_3', '123'),
(100, 'GeXFq9kr_100', 'rh7sMFNc_99', 'lr2t8bNc_13', '5cYRgaD9_3', '456');

-- --------------------------------------------------------

--
-- Table structure for table `commentlikes`
--

CREATE TABLE IF NOT EXISTS `commentlikes` (
  `commentcode` varchar(20) NOT NULL,
  `usercode` varchar(20) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commentlikes`
--

INSERT INTO `commentlikes` (`commentcode`, `usercode`, `status`) VALUES
('gh4dKrZI_2', 'XntjPv3k_2', 1),
('vyU5eEqr_2', 'XntjPv3k_2', 1),
('goFt7Z5B_2', 'XntjPv3k_2', 1),
('giUzavjF_1', 'XntjPv3k_2', 1),
('XlGgi9PK_5', 'XntjPv3k_2', 1),
('PRgI6iOc_6', 'XntjPv3k_2', 1),
('jfd7AiCZ_13', 'XntjPv3k_2', 1),
('6XOZQoyk_10', 'XntjPv3k_2', 1),
('PiTkQyER_14', '5cYRgaD9_3', 1),
('UD4bqr0Z_15', '5cYRgaD9_3', 0),
('EJ0XrwZh_16', 'XntjPv3k_2', 1),
('O3tm6INc_20', 'XntjPv3k_2', 1),
('O3tm6INc_20', 'XntjPv3k_2', 1),
('O3tm6INc_20', 'XntjPv3k_2', 1),
('96SRJAUw_21', 'XntjPv3k_2', 1),
('Xnc4QJNA_24', 'XntjPv3k_2', 1),
('Xnc4QJNA_24', 'XntjPv3k_2', 1),
('GdqbBilE_25', 'XntjPv3k_2', 1),
('WkjVc3MC_23', 'XntjPv3k_2', 1),
('WkjVc3MC_23', 'XntjPv3k_2', 1),
('WkjVc3MC_23', 'XntjPv3k_2', 1),
('pxhRwy4l_23', 'XntjPv3k_2', 1),
('pxhRwy4l_23', 'XntjPv3k_2', 1),
('PwdaLfnz_24', 'XntjPv3k_2', 1),
('PwdaLfnz_24', 'XntjPv3k_2', 1),
('6wOLvlsh_22', 'XntjPv3k_2', 0),
('o2lhRznd_20', 'XntjPv3k_2', 0),
('o2lhRznd_20', 'XntjPv3k_2', 0),
('o2lhRznd_20', 'XntjPv3k_2', 0),
('j3bKJUFd_21', 'XntjPv3k_2', 1),
('j3bKJUFd_21', 'XntjPv3k_2', 1),
('IpmEl9UJ_20', 'XntjPv3k_2', 1),
('OT0SZfpE_22', 'XntjPv3k_2', 1),
('KW2aXb0g_21', 'XntjPv3k_2', 1),
('KW2aXb0g_21', 'XntjPv3k_2', 1),
('0RurmwdI_22', 'XntjPv3k_2', 1),
('myM3xC5A_21', 'XntjPv3k_2', 1),
('myM3xC5A_21', 'XntjPv3k_2', 1),
('I5CmlfJY_20', 'XntjPv3k_2', 1),
('I5CmlfJY_20', 'XntjPv3k_2', 1),
('I5CmlfJY_20', 'XntjPv3k_2', 1),
('uMfcjhUp_20', 'XntjPv3k_2', 1),
('YyUugeiz_25', 'XntjPv3k_2', 1),
('36btnF2m_24', 'XntjPv3k_2', 1),
('36btnF2m_24', 'XntjPv3k_2', 1),
('KC5SrL3y_23', 'XntjPv3k_2', 1),
('KC5SrL3y_23', 'XntjPv3k_2', 1),
('KC5SrL3y_23', 'XntjPv3k_2', 1),
('KWdgIZAf_20', 'XntjPv3k_2', 1),
('tj0Vrz6g_31', 'XntjPv3k_2', 1),
('CIclj4eH_45', 'XntjPv3k_2', 1),
('VuTzmsYR_46', 'XntjPv3k_2', 1),
('yXtibHBR_54', 'XntjPv3k_2', 1),
('qRN5xEHy_53', 'XntjPv3k_2', 1),
('bQYzn8hE_55', 'XntjPv3k_2', 1),
('MhVgIcBH_62', 'XntjPv3k_2', 1),
('QMg5jev6_66', 'XntjPv3k_2', 1),
('QMg5jev6_66', 'XntjPv3k_2', 1),
('6Pwbji1D_65', 'XntjPv3k_2', 1),
('6Pwbji1D_65', 'XntjPv3k_2', 1),
('6Pwbji1D_65', 'XntjPv3k_2', 1),
('5uh6Wyxm_69', 'XntjPv3k_2', 1),
('n1qM704p_68', 'XntjPv3k_2', 1),
('OwVgpjGd_70', '5cYRgaD9_3', 1),
('l6s0hGYb_71', '5cYRgaD9_3', 1),
('ZNXJPpAe_73', '5cYRgaD9_3', 1),
('qWOJDesy_72', '5cYRgaD9_3', 1),
('I7JbaOUu_75', '5cYRgaD9_3', 1),
('omODAghq_74', '5cYRgaD9_3', 1),
('MZmXtxPE_77', '5cYRgaD9_3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `sn` int(11) NOT NULL,
  `usercode` varchar(20) NOT NULL,
  `vidcode` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`sn`, `usercode`, `vidcode`) VALUES
(1, '5cYRgaD9_3', 't8acFhgf_8'),
(64, '5cYRgaD9_3', 'm6V50XZ1_16'),
(3, '5cYRgaD9_3', 'FEwf5gGz_4'),
(4, '5cYRgaD9_3', 'afDA1yRE_10'),
(65, '5cYRgaD9_3', 'DRLZMUOe_7'),
(69, '5cYRgaD9_3', 'H5N2sphY_3'),
(52, '5cYRgaD9_3', 'Qv1V9p8t_12'),
(8, '5cYRgaD9_3', 'kuS7Dio8_2'),
(40, '5cYRgaD9_3', 'RZFtNAc4_9'),
(10, '5cYRgaD9_3', 'amq5skQH_5'),
(68, '5cYRgaD9_3', 'Lge63TPW_14'),
(12, '5cYRgaD9_3', 'WbUiPHpg_11'),
(13, '5cYRgaD9_3', 'xuRcHqwt_1'),
(67, '5cYRgaD9_3', 'lr2t8bNc_13'),
(15, '5cYRgaD9_3', 'FXBtCc53_6'),
(16, '5cYRgaD9_3', 'PAfX0V3b_15'),
(17, 'XntjPv3k_2', 'm6V50XZ1_16'),
(18, 'XntjPv3k_2', 'H5N2sphY_3'),
(19, 'XntjPv3k_2', 'FXBtCc53_6'),
(20, 'XntjPv3k_2', 'amq5skQH_5'),
(21, 'XntjPv3k_2', 'PAfX0V3b_15'),
(22, 'XntjPv3k_2', 'WbUiPHpg_11'),
(23, 'XntjPv3k_2', 'afDA1yRE_10'),
(24, 'XntjPv3k_2', 'DRLZMUOe_7'),
(25, 'XntjPv3k_2', 'FEwf5gGz_4'),
(26, 'XntjPv3k_2', 'xuRcHqwt_1'),
(27, 'XntjPv3k_2', 'Lge63TPW_14'),
(28, 'b9P4Esiv_6', 'm6V50XZ1_16'),
(29, 'b9P4Esiv_6', 'H5N2sphY_3'),
(30, 'b9P4Esiv_6', 'FEwf5gGz_4'),
(0, 'b9P4Esiv_6', 'xuRcHqwt_1'),
(0, 'b9P4Esiv_6', 'kuS7Dio8_2');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `usercode` varchar(100) NOT NULL,
  `vidcode` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`usercode`, `vidcode`, `status`) VALUES
('5cYRgaD9_3', 'DRLZMUOe_7', 1),
('5cYRgaD9_3', 'xuRcHqwt_1', 1),
('5cYRgaD9_3', 'amq5skQH_5', 1),
('XntjPv3k_2', 'FEwf5gGz_4', 1),
('XntjPv3k_2', 'RZFtNAc4_9', 1),
('XntjPv3k_2', 'afDA1yRE_10', 1),
('5cYRgaD9_3', 'afDA1yRE_10', 1),
('5cYRgaD9_3', 'WbUiPHpg_11', 1),
('5cYRgaD9_3', 'FXBtCc53_6', 1),
('5cYRgaD9_3', 'kuS7Dio8_2', 1),
('5cYRgaD9_3', 'FEwf5gGz_4', 1),
('XntjPv3k_2', 'xuRcHqwt_1', 1),
('5cYRgaD9_3', 'H5N2sphY_3', 1),
('5cYRgaD9_3', 't8acFhgf_8', 1),
('5cYRgaD9_3', 'Lge63TPW_14', 1),
('5cYRgaD9_3', 'PAfX0V3b_15', 1),
('b9P4Esiv_6', 'm6V50XZ1_16', 1),
('XntjPv3k_2', 'm6V50XZ1_16', 1),
('5cYRgaD9_3', 'm6V50XZ1_16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE IF NOT EXISTS `playlist` (
  `sn` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `dt` varchar(40) NOT NULL,
  `usercode` varchar(20) NOT NULL,
  `playlist` varchar(40) NOT NULL,
  `privacy` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlist`
--

INSERT INTO `playlist` (`sn`, `code`, `dt`, `usercode`, `playlist`, `privacy`) VALUES
(1, 'qO0LAdfi_1', 'Fri Jul 19 12:16:59 IST 2024', '5cYRgaD9_3', 'Popular', 'public'),
(3, 'mCTP5ZyW_3', 'Sat Jul 27 02:36:18 IST 2024', '5cYRgaD9_3', 'Amazing Videos', 'public'),
(4, 'QzO0mKZX_4', 'Sat Jul 27 03:19:47 IST 2024', '5cYRgaD9_3', 'Great Videos', 'public'),
(5, 'dNDrjsBh_5', 'Tue Dec 17 16:13:18 IST 2024', '5cYRgaD9_3', 'Newplaylist', 'private');

-- --------------------------------------------------------

--
-- Table structure for table `playlistvideos`
--

CREATE TABLE IF NOT EXISTS `playlistvideos` (
  `playlistcode` varchar(20) NOT NULL,
  `vidcode` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlistvideos`
--

INSERT INTO `playlistvideos` (`playlistcode`, `vidcode`) VALUES
('MnxZFkcH_2', 'm6V50XZ1_16'),
('MnxZFkcH_2', 'amq5skQH_5'),
('Du156fWF_3', 'PAfX0V3b_15'),
('Du156fWF_3', 'H5N2sphY_3'),
('', 'm6V50XZ1_16'),
('', 'WbUiPHpg_11'),
('', 'FXBtCc53_6'),
('VqLak6gO_2', 'DRLZMUOe_7'),
('zDKh2CMi_3', 'FEwf5gGz_4'),
('3pFghU7S_4', 'xuRcHqwt_1'),
('qO0LAdfi_1', 'Lge63TPW_14'),
('roJLaGyD_2', 'DRLZMUOe_7'),
('mCTP5ZyW_3', 'amq5skQH_5'),
('QzO0mKZX_4', 'Qv1V9p8t_12'),
('dNDrjsBh_5', 'lr2t8bNc_13'),
('dNDrjsBh_5', 'Lge63TPW_14'),
('dNDrjsBh_5', 'H5N2sphY_3');

-- --------------------------------------------------------

--
-- Table structure for table `subs`
--

CREATE TABLE IF NOT EXISTS `subs` (
  `channel_code` varchar(40) NOT NULL,
  `user_code` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subs`
--

INSERT INTO `subs` (`channel_code`, `user_code`) VALUES
('ujiqwo1a_4', 'XntjPv3k_2'),
('5cYRgaD9_3', 'WsYcb53k_5'),
('WsYcb53k_5', 'XntjPv3k_2'),
('5cYRgaD9_3', 'b9P4Esiv_6'),
('ujiqwo1a_4', 'b9P4Esiv_6'),
('5cYRgaD9_3', 'XntjPv3k_2'),
('sLwyBRgd_1', '5cYRgaD9_3'),
('XntjPv3k_2', '5cYRgaD9_3'),
('WsYcb53k_5', '5cYRgaD9_3');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `sn` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `des` varchar(500) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`sn`, `code`, `name`, `des`, `email`, `password`, `status`) VALUES
(1, 'sLwyBRgd_1', 'Gautam ', 'Convey meaning through color with a handful of color utility classes. Includes support for styling links with hover states, too.', 'gk@gmail.com', '123', 0),
(2, 'XntjPv3k_2', 'Yuvraj', 'Convey meaning through color with a handful of color utility classes. Includes support for styling links with hover states, too.', 'yuvraj@gmail.com', '123', 1),
(3, '5cYRgaD9_3', 'Mohit', 'Convey meaning through color with a handful of color utility classes. Includes support for styling links with hover states, too.', 'mohit@gmail.com', '123', 1),
(4, 'ujiqwo1a_4', 'Devraj', 'Convey meaning through color with a handful of color utility classes. Includes support for styling links with hover states, too.', 'dev@gmail.com', '123', 1),
(5, 'WsYcb53k_5', 'Sanjay', 'Convey meaning through color with a handful of color utility classes. Includes support for styling links with hover states, too.', 'sanjay@gmail.com', '123', 1),
(6, 'b9P4Esiv_6', 'Amit Singh', 'Very brilliant student.', 'amit@gmail.com', '123', 0);

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `sn` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `descrip` varchar(100) NOT NULL,
  `dt` varchar(100) NOT NULL,
  `cat_code` varchar(100) NOT NULL,
  `user_code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`sn`, `code`, `title`, `descrip`, `dt`, `cat_code`, `user_code`) VALUES
(2, 'kuS7Dio8_2', 'Forest Roads', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Tue Dec 26 16:55:31 IST 2023', '9h10Tedi_4', 'ujiqwo1a_4'),
(3, 'H5N2sphY_3', 'Afternoon in Mountains', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Tue Dec 26 16:56:00 IST 2023', 'zkoB2fmW_1', 'ujiqwo1a_4'),
(5, 'amq5skQH_5', 'Buildings', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Tue Dec 26 16:57:04 IST 2023', '9YdSDl1B_8', 'ujiqwo1a_4'),
(7, 'DRLZMUOe_7', 'Seashore', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Tue Dec 26 16:59:14 IST 2023', 'k6UlfqyX_3', 'XntjPv3k_2'),
(8, 't8acFhgf_8', 'Mountain Drone Video', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Tue Dec 26 16:59:47 IST 2023', 'zkoB2fmW_1', 'XntjPv3k_2'),
(9, 'RZFtNAc4_9', 'Mountain Flowers', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Tue Dec 26 17:00:20 IST 2023', 'zkoB2fmW_1', 'XntjPv3k_2'),
(10, 'afDA1yRE_10', 'Snow Mountains', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Tue Dec 26 17:01:21 IST 2023', 'zkoB2fmW_1', '5cYRgaD9_3'),
(11, 'WbUiPHpg_11', 'Beach', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Tue Dec 26 17:01:44 IST 2023', 'k6UlfqyX_3', '5cYRgaD9_3'),
(12, 'Qv1V9p8t_12', 'Beach Drone Shot', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Tue Dec 26 17:02:25 IST 2023', 'k6UlfqyX_3', '5cYRgaD9_3'),
(13, 'lr2t8bNc_13', 'Seaside', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Tue Dec 26 17:03:37 IST 2023', 'P3CySv4J_10', '5cYRgaD9_3'),
(14, 'Lge63TPW_14', 'Mountain Nights', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Tue Dec 26 17:03:57 IST 2023', 'zkoB2fmW_1', '5cYRgaD9_3'),
(16, 'm6V50XZ1_16', 'Seaside Sunset', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Wed Jun 19 13:11:29 IST 2024', 'P3CySv4J_10', '5cYRgaD9_3');

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE IF NOT EXISTS `views` (
  `vidcode` varchar(20) NOT NULL,
  `channelcode` varchar(20) NOT NULL,
  `views` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `views`
--

INSERT INTO `views` (`vidcode`, `channelcode`, `views`) VALUES
('H5N2sphY_3', 'ujiqwo1a_4', 42),
('kuS7Dio8_2', 'ujiqwo1a_4', 18),
('FXBtCc53_6', 'XntjPv3k_2', 35),
('DRLZMUOe_7', 'XntjPv3k_2', 44),
('RZFtNAc4_9', 'XntjPv3k_2', 8),
('xuRcHqwt_1', 'ujiqwo1a_4', 38),
('m6V50XZ1_16', '5cYRgaD9_3', 1460),
('Qv1V9p8t_12', '5cYRgaD9_3', 26),
('t8acFhgf_8', 'XntjPv3k_2', 51),
('WbUiPHpg_11', '5cYRgaD9_3', 22),
('Lge63TPW_14', '5cYRgaD9_3', 26),
('FEwf5gGz_4', 'ujiqwo1a_4', 64),
('amq5skQH_5', 'ujiqwo1a_4', 21),
('PAfX0V3b_15', '5cYRgaD9_3', 21),
('afDA1yRE_10', '5cYRgaD9_3', 83),
('lr2t8bNc_13', '5cYRgaD9_3', 35);

-- --------------------------------------------------------

--
-- Table structure for table `watchlater`
--

CREATE TABLE IF NOT EXISTS `watchlater` (
  `sn` int(11) NOT NULL,
  `vidcode` varchar(20) NOT NULL,
  `usercode` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `watchlater`
--

INSERT INTO `watchlater` (`sn`, `vidcode`, `usercode`) VALUES
(1, 'amq5skQH_5', '5cYRgaD9_3'),
(2, 'Lge63TPW_14', '5cYRgaD9_3'),
(3, 'Qv1V9p8t_12', '5cYRgaD9_3'),
(4, 'WbUiPHpg_11', '5cYRgaD9_3'),
(5, 'xuRcHqwt_1', '5cYRgaD9_3'),
(6, 'PAfX0V3b_15', '5cYRgaD9_3'),
(7, 'm6V50XZ1_16', 'XntjPv3k_2'),
(8, 'lr2t8bNc_13', '5cYRgaD9_3'),
(37, 'm6V50XZ1_16', '5cYRgaD9_3');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
