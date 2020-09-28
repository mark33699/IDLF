import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

class LessonPageListViewCheckbox extends StatefulWidget {
  @override
  _LessonPageListViewCheckboxState createState() => _LessonPageListViewCheckboxState();
}

class _LessonPageListViewCheckboxState extends State<LessonPageListViewCheckbox> {

  List<bool> checkList = List.generate(shrines.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(color: Colors.black,
          child: FlatButton(
            child: Text("資料來源：\n[分享]薩爾達傳說 曠野之息【神廟】中 英 對照表 @ 流浪。生活誌 :: 痞客邦 ::",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white)
            ),
            onPressed: () {},
          )
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (ctx, idx) => Divider(),
            itemCount: shrines.length,
            itemBuilder: (ctx, idx){
              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                secondary: Icon(IcoFontIcons.like),
                activeColor: Colors.orange,
                value: checkList[idx],
                selected: checkList[idx],
                onChanged: (check) {
                  setState(() {
                    checkList[idx] = check;
                  });
                },
                title: Text("${shrines[idx]}"),
              );
            }))
      ],
    );
  }
}

final shrines = [
  "117)耀瓦卡‧伊爾塔神廟 Yowaka Ita Shrine ",
  "118)羅希塔‧奇古神廟 Rohta Chigah Shrine",
  "119)露奈‧科力巴神廟 Ruvo Korbah Shrine",
  "120)艾茨‧科力瑪神廟 Etsu Korima Shrine",
  "58)魯耀‧塔烏神廟 Rota Ooh Shrine ",
  "59)亞卡‧瑪塔神廟 Kaam Ya'tak Shrine",
  "60)尼阿‧奈阿神廟 Noya Neha Shrine  騎士盾",
  "61)達‧卡索神廟 Dah Kase Shrine",
  "62)瓦哥‧卡塔神廟 Wahgo Kaua Shrine",
  "63)卡塔‧丘基神廟 Katah Chuki Shrine 王族之槍",
  "64)納米卡‧奧茲神廟 Namika Ozz Shrine  冰雪槍",
  "65)薩斯‧科薩神廟 Saas Ko'sah Shrine",
  "66)基瓦‧扎塔斯神廟 Zalta Wa Shrine",
  "67)托‧雅薩神廟 Toh Yahsa Shrine   橡膠緊身服 雷之台地 雷鳴的考驗 01",
  "68)米達‧羅基神廟 Mijah Rokee Shrine  冰雪劍 海拉魯丘陵 紅月之夜 05",
  "69)夏奧‧耀神廟 Shae Loya Shrine",
  "70)瑪‧諾拉神廟 Maag No'rah Shrine",
  "71)希‧達哥茲神廟 Sheem Dagoze Shrine雷電大劍 西海拉魯平原 兩個環 07",
  "72)摩‧拉塔尼阿神廟 Mogg Latan Shrine",
  "10)米亞馬‧迦納神廟 Myahm Agana Shrine",
  "11)米茲‧耀廟 Mezza Lo Shrine 阿拉布平原 兩杆槍野獸 10",
  "12)塔諾‧阿神廟 Tahno O'ah Shrine攀登鞋  哈特諾村 三棵杉樹的秘密 24",
  "13)洽斯‧科塔神廟 Chaas Oeta Shrine  攀登護手(頂)",
  "14)吉塔‧薩米神廟 Jitan Sa'mi Shrine  哈特諾村 探索拉聶爾山的寶物 12",
  "15)達烏‧納艾神廟 Dow Na'eh Shrine",
  "16)卡姆‧尤奧神廟 Kam Urog Shrine 哈特諾堡壘 被詛咒的石像 23",
  "1)瓦希‧遼科神廟 Bosh Kala Shrine",
  "2)哈尤‧達瑪神廟 Ha Dahamar Shrine",
  "3)席羅‧席拉神廟 Hila Rao Shrine 海利亞河 不要踐踏花兒 26 ",
  "4)希貝‧尼亞斯神廟 Shee Venath Shrine",
  "5)希貝‧尼羅斯神廟 Shee Vaneer Shrine",
  "6)利‧達席神廟 Ree Dahee Shrine 攀登頭巾",
  "7)塔羅‧尼席神廟 Ta'loh Naeg Shrine ",
  "8)拉納‧羅基神廟 Lakna Rokee Shrine 卡卡利科村 被盜的寶珠 21",
  "9)托托‧伊薩神廟 Toto Sah Shrine",
  "17)奈茲‧耀瑪神廟 Ne'ez Yohma Shrine",
  "18)魯克‧瑪神廟 Rucco Maag Shrine",
  "19)薩奧‧科席神廟 Soh Kofi Shrine",
  "20)卡‧姆神廟 Kah Mael Shrine",
  "21)卡亞‧米瓦神廟 Kaya Wan Shrine",
  "22)協莫‧拉塔神廟 Sheh Rata Shrine",
  "23)達塔‧庫斯神廟 Daka Tuss Shrine",
  "24)希‧尤塔神廟 Shai Yota Shrine火焰大劍 荷隆灣 御風拓路者 09",
  "25)達‧基基神廟 Dagah Keek Shrine  卓拉領地 英傑祭祀詩 11",
  "109)達席‧希諾神廟 Dah Hesho Shrine",
  "110)卡茨‧托薩神廟 Katosa Aug Shrine",
  "111)吉茲‧卡夫伊神廟 Ze Kasha Shrine",
  "112)茨茨阿‧尼瑪神廟 Tutsuwa Nima Shrine  火焰槍 東阿卡萊驛站 力量之泉的傳說 39",
  "113)科尼‧希卡神廟 Ke'nai Shakah Shrine",
  "114)茲納‧卡伊神廟 Zuna Kai Shrine火焰劍  阿卡萊古代研究所 骷髏的左眼 42",
  "115)圖‧卡羅神廟 Tu Ka'loh Shrine  蠻族頭盔 洛美島 孤島的考驗 40",
  "116)利塔‧茲摩神廟 Ritaag Zumo Shrine 馬秋茲半島 前往漩渦狀中心 41",
  "100)塔‧姆爾神廟 Tah Muhl Shrine  山麓驛站 驛站的風景畫 06",
  "101)丘‧拉姆席神廟 Qua Raym Shrine",
  "102)克哈‧拉瑪神廟 Kayra Mah Shrine  鼓隆城 弟弟在何方？37",
  "103)古‧阿齊托神廟 Gorae Torr Shrine 毅力崖 鼓隆的毅力崖挑戰 38",
  "104)達卡‧卡神廟 Daqa Koh Shrine",
  "105)摩阿‧基希托神廟 Mo'a Keet Shrine",
  "106)希摩‧依托塞神廟 Shae Mo'sah Shrine  ",
  "107)曉拉‧哈神廟 Shora Hah Shrine",
  "108)薩‧達究神廟 Sah Dahaj Shrine",
  "92)米羅‧茨席神廟 Mirro Shaz Shrine",
  "93)蒙亞‧托瑪神廟 Monya Toma Shrine  雷電劍",
  "94)基托‧瓦瓦伊神廟 Ketoh Wawai Shrine 古代核心 德依布朗遺跡 暗黑的考驗 06",
  "95)羅納‧卡塔神廟 Rona Kachta Shrine  火焰大劍",
  "96)達‧喬卡席神廟 Daag Chokah Shrine  克洛格森林 最初的考驗 08",
  "97)庫恩‧希達吉神廟 Kuhn Sidajj Shrine  克洛格森林 操控力的考驗 03",
  "98)瑪姆‧拉諾神廟 Maag Halan Shrine  克洛格森林 不燃燒的考驗 02",
  "99)基耀‧烏神廟 Keo Ruun Shrine ",
  "79)席亞‧米烏神廟 Hia Miu Shrine (頂)",
  "80)卡扎‧託基神廟 Qaza Tokki Shrine 蠻族短褲 北洛美城堡遺跡 斷崖的考驗 13",
  "81)妙斯‧希諾神廟 Mozo Shenno Shrine 利特村 高聳入雲的山上有棵參天大樹 16 (頂)",
  "82)夏達‧阿達神廟 Shada Naw Shrine  冰雪大劍",
  "83)夏格瑪神廟 Sha Gehma Shrine",
  "84)迦奧瑪‧阿薩神廟Goma Asaagh Shrine  王族雙手劍 (頂)",
  "85)托‧庫摩神廟 To Quomo Shrine  王族雙手劍",
  "86)拉‧庫阿神廟 Rok Uwog Shrine",
  "87)卡瑪‧拉席神廟 Maka Rah Shrine",
  "88)利‧摩納神廟 Rin Oyaa Shrine",
  "89)拉掿‧庫席神廟 Lanno Kooh Shrine",
  "90)多恩巴‧塔神廟 Dunba Taag Shrine  雷電大劍",
  "91)諾基‧米席神廟 Gee Ha'rah Shrine ",
  "73)阿科‧瓦塔神廟 Akh Va'quot Shrine",
  "74)沃力達‧諾神廟 Bareeda Naag Shrine 利特村 利特的詩謎 14",
  "75)夏‧塔瓦神廟 Sha Warvo Shrine",
  "76)烏塔‧多神廟 Voo Lota Shrine 火焰劍  利特村 利特的兄弟岩 15",
  "77)卡‧奧裘神廟 Kah Okeo Shrine 雷電槍",
  "78)提納‧裘扎神廟 Tena Ko'sah Shrine",
  "52)庫伊‧塔卡神廟 Kuh Takkar Shrine  冰雪劍 ",
  "53)基瑪‧科薩薩神廟 Kema Kosassa Shrine(頂)",
  "54)希‧基托神廟 Sho Dantu Shrine",
  "55)基哈‧烏神廟 Keeha Yoog Shrine 塔邦撻大橋驛站 絕壁花紋 04",
  "56)究尼‧希神廟 Joloo Nah Shrine 娜波露山 比耐力 34",
  "57)薩薩‧卡伊神廟 Sasa Kai Shrine 冰雪劍  格魯格之塔 去影子指示的地方 33",
  "40)吉諾‧耀神廟 Jee Noh Shrine",
  "41)克‧諾伊神廟 Kay Noh Shrine",
  "42)達科‧塔瓦神廟 Dako Tah Shrine 卡拉卡拉集市 消失的沙塵暴 29",
  "43)斯瑪‧薩瑪神廟 Suma Sahma Shrine  摩爾迦娜山 雪山日誌 28 ",
  "44)古科‧齊塞神廟 Daqo Chisay Shrine 雷電劍 ",
  "45)基瑪‧茲斯神廟 Kema Zoos Shrine月光匕首 格魯德小鎮 不會說話的劍士 32",
  "46)拉丘‧烏羅神廟 Raqa Zunzo Shrine  沙海象拉力賽報名處 不敗的女王 27",
  "47)哈瓦‧卡伊神廟 Hawa Koth Shrine",
  "48)迪拉‧瑪神廟 Dila Maag Shrine 蠻族服 南洛美城堡遺跡 沙漠的考驗 31",
  "49)托‧卡尤神廟 Tho Kayu Shrine",
  "50)裘希‧奧神廟 Korsh O'Hu Shrine  火焰槍 格魯德小鎮 七位英雄 30",
  "51)密‧蘇神廟 Misae Suma Shrine  東格魯德 只為求得美酒 35",
  "26)亞奧‧瑪耀神廟 Yah Rin Shrine",
  "27)丘卡‧納塔神廟 Qukah Nata Shrine 克拉爾湖 閃電開啟的考驗 19",
  "28)曉達‧薩神廟 Shoda Sah Shrine",
  "29)瑪‧卡亞神廟 Kah Yah Shrine 雅西諾遺跡 尋找石碑碎塊 22",
  "30)塔瓦‧吉努神廟 Tawa Jinn Shrine 泰爾美山 巨人三兄弟的秘密 25",
  "31)庫古‧齊德神廟 Korgu Chideh Shrine  塞哈特諾島 野外的考驗 17",
  "32)塞伊‧烏托神廟 Shai Utoh Shrine",
  "33)姆奧‧吉姆神廟 Muwo Jeem Shrine",
  "34)希‧庫喬夫神廟 Shae Katha Shnne  雷電槍 思古蘭特樹海 吞食巨蛇的龍 18",
  "35)卡奧‧瑪卡神廟 Ka'o Makagh Shrine",
  "36)希‧塔塔恩科神廟 Shoqa Talone Shnne  帕發海岸 想見見守護者 20",
  "37)普瑪‧尼特神廟 Pumaag Nitae Shrine",
  "38)伊奧‧索奧神廟 Ishto Soh Shrine",
  "39)亞．納加神廟 Ya Naga Shrine"
];

