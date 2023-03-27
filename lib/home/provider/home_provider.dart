import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeProvider extends ChangeNotifier {
  int i = 0;
  bool con = false;

  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  List img = [
    'https://tooxclusive.com/wp-content/uploads/2021/05/Screen-Shot-2021-05-16-at-6.28.00-PM.png',
    'https://tse2.mm.bing.net/th?id=OIP.RCbuSOJLsL9S3SRrUkdX4gHaEK&pid=Api&P=0',
    'https://tse3.mm.bing.net/th?id=OIP.Y0TKnlFEB0nbMfC_NfHxVAHaEK&pid=Api&P=0',
    'https://tse1.mm.bing.net/th?id=OIP.3Mpi-CW7nnuqxEXU3VuyrwHaEK&pid=Api&P=0',
    'https://i.ytimg.com/vi/YLBlkLmCUrQ/maxresdefault.jpg',
    'https://tse4.mm.bing.net/th?id=OIP.EpNUpGFjqixNiTOF7GvVaQAAAA&pid=Api&P=0',
    'https://tse1.mm.bing.net/th?id=OIP.A_FhgioO1r_pyYvls3y99QHaEd&pid=Api&P=0',
    'https://tse4.mm.bing.net/th?id=OIP.aaWXYaKBwWYxbSVaItVn6QHaEH&pid=Api&P=0',
    'https://tse2.mm.bing.net/th?id=OIP.9_AAo-1Gq03XdlRhlfe28QHaEK&pid=Api&P=0',
    'https://tse3.mm.bing.net/th?id=OIP.xbULnsCCI7flAeGVyyxJ5AHaEK&pid=Api&P=0',
    'https://tse3.mm.bing.net/th?id=OIP.YQbf45Js54hIm4iGacfi2AHaEK&pid=Api&P=0',
  ];

  List videoname = [
    'Ask ft',
    'Meet',
    'She Dont Know',
    'Buzz',
    'Akh Lad Jaave',
    'Mercy',
    'Bahara',
    'Players',
    'O Sajna',
    'Maan Meri Jaan',
    'Malang Sajna'
  ];

  List detials=[
    'Track Name: Ask ft\nLyrics: Raxstar\nWritten by: Mohammed Yusuf ZamanShweta Pandya',
    'Song: Meet\nSinger: Arijit Singh\nMusic: Sachin-Jigar\nLyrics: Priya Saraiya\nMusic Label: T-Series',
    'Song: She Dont Know\nSinger: Millind Gaba\nMusic: Millind Gaba\nLyrics: Millind Gaba\nMusic Label: T-Series',
    'Song: Buzz\nSinger: Aastha Gill & Badshah\nLyrics: Badshah\nMusic Label: Sony Music India',
    'Song: Akh Lad Jaave\nSinger:  Badshah, Asees Kaur And Jubin Nautiyal\nMusic: Tanishk Bagchi\nLyrics: Tanishk Bagchi And Badshah\nMusic Label: T-Series',
    'Song: Mercy\nSinger:  Badshah & Lauren Gottlieb\nMusic: Badshah\nLyrics: Badshah\nMusic Label: Sony Music India',
    'Song: Bahara\nSinger:  Vishal & Shekhar, Tanishk Bagchi\nLyrics: Kumaar, Dr Devendra Kafir\nMusic Label: Sony Music India',
    'Song: Players\nSinger: Badshah x Karan Aujla \nLyrics: Badshah\nFemale Vocals - Devika Badyal',
    'Song: O Sajna\nSinger: Neha Kakkar\nMusic: Tanishk Bagchi\nLyrics: Jaani\nMusic Label: T-Series',
    'Track Name: Maan Meri Jaan\nLyrics: King\nMusic Production: Saurabh Lokhande\nComposition: King\nBacking Vocals : Priyanshi Srivastava Prateeksha Srivastava\nMix & Master: Hanish Taneja',
    'Track Name: Malang Sajna\nLyrics: Kumaar\nComposition: Sachet-Parampara\nMusic Label: T-Series',
  ];

  List video = [
    'assest/videos/Ask.mp4',
    'assest/videos/Meet.mp4',
    'assest/videos/SheDont.mp4',
    'assest/videos/Buzz.mp4',
    'assest/videos/Akh_Lad_Jaave.mp4',
    'assest/videos/Mercy.mp4',
    'assest/videos/Bahara.mp4',
    'assest/videos/Players.mp4',
    'assest/videos/O_Sajna.mp4',
    'assest/videos/Maan_Meri_Jaan.mp4',
    'assest/videos/MalangSajna.mp4',
  ];

  void chi(int index) {
    i = index;
  }

  void initvideo() {
    videoPlayerController = VideoPlayerController.asset('${video[i]}');
    videoPlayerController!.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      aspectRatio: 16 / 9,
      looping: false,
      autoInitialize: true,
      materialProgressColors: ChewieProgressColors(
          backgroundColor: Colors.white24,
          bufferedColor: Colors.white54,
          playedColor: Colors.white),
    );
  }

  void chCon()
  {
    con=!con;
    notifyListeners();
  }

  Widget det1()
  {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Text('${videoname[i]}',style: TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }

  Widget det()
  {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10),
      child: Text(
        "${detials[i]}",
        style: TextStyle(
            color: Colors.white70,
            fontSize: 15),
      ),
    );
  }
}
