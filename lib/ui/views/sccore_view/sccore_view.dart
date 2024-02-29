import 'package:flutter/material.dart';
import 'package:task_P2/ui/shared/custom%20_widgets/custom_tob_container.dart';
import 'package:task_P2/ui/shared/utlis.dart';

class SccoreView extends StatelessWidget {
  const SccoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TobContainer(
              isimageball: true,
              text: "النتائج",
            ),
            Container(
              margin: EdgeInsetsDirectional.symmetric(
                vertical: screenWidth(14),
                horizontal: screenWidth(8),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.amber.shade100,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "السبت",
                        style: TextStyle(
                          fontSize: screenWidth(24),
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "17 نوفمبر",
                        style: TextStyle(
                          fontSize: screenWidth(24),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.all(4),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.orange,
                          width: 3,
                        ),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Colors.orangeAccent,
                          Colors.white,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Text(
                          "السبت",
                          style: TextStyle(
                            fontSize: screenWidth(24),
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "10 نوفمبر",
                          style: TextStyle(
                            fontSize: screenWidth(24),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "السبت",
                        style: TextStyle(
                          fontSize: screenWidth(24),
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "3 نوفمبر",
                        style: TextStyle(
                          fontSize: screenWidth(24),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/images/pngs/ic_arrow_right.png",
                    width: screenWidth(20),
                    height: screenWidth(20),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.all(screenWidth(20)),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/pngs/ic_bg.png",
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              "assets/images/pngs/ic_gabla.png",
                              width: screenWidth(8),
                              height: screenWidth(8),
                            ),
                            Text("صاحب ثالث هدف"),
                            Text("جبلة"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("الجمعة,2023/05/26"),
                            Text("عصراً 12:12"),
                            Text("ملعب خالد بن الوليد"),
                            Text("0:1"),
                            Text("الجولة"),
                            Text("23"),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "assets/images/pngs/ic_karama.png",
                              width: screenWidth(8),
                              height: screenWidth(8),
                            ),
                            Text("الكرامة"),
                            Text("صاحب أول هدف"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsetsDirectional.symmetric(
                  horizontal: screenWidth(20),
                ),
                child: Stack(
                  children: [
                    Container(
                      height: screenWidth(1),
                      margin: EdgeInsetsDirectional.only(
                        top: screenWidth(20),
                      ),
                      padding: EdgeInsetsDirectional.only(
                        top: screenWidth(10),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Color.fromRGBO(237, 237, 237, 1),
                      ),
                      child: Table(
                        columnWidths: {
                          1: FlexColumnWidth(2),
                        },
                        textDirection: TextDirection.rtl,
                        border: TableBorder.all(
                          color: Colors.grey,
                        ),
                        children: [
                          TableRow(
                            children: [
                              Text("ترتيب"),
                              Container(
                                width: screenWidth(10),
                                child: Text(
                                  "الفريق",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // fontSize: screenWidth(30),
                                  ),
                                ),
                              ),
                              Text("لعب"),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                  bottom: BorderSide(
                                    color: Colors.green,
                                    width: 3,
                                  ),
                                )),
                                child: Text("فاز"),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                  bottom: BorderSide(
                                    color: Colors.blue,
                                    width: 3,
                                  ),
                                )),
                                child: Text("تعادل"),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                  bottom: BorderSide(
                                    color: Colors.red,
                                    width: 3,
                                  ),
                                )),
                                child: Text("خسر"),
                              ),
                              Text("نقاط"),
                            ],
                          ),
                          tableRow(
                            sequence: "1",
                            team: "2",
                            game: "3",
                            win: "4",
                            draw: "5",
                            lose: "6",
                            points: "7",
                            borderColor: Colors.amber,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/images/pngs/ic_top_table.png",
                      height: screenWidth(6),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                          top: screenWidth(20),
                        ),
                        child: Text(
                          "جدول ترتيب فرق الدوري السوري2023/2024",
                          style: TextStyle(
                            fontSize: screenWidth(23.5),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Container(
                        width: screenWidth(3),
                        height: screenWidth(13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(50),
                          color: Colors.orangeAccent,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "مشاهدة كامل الجدول",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Expanded(
            //   child: ,
            // ),
          ],
        ),
      ),
    );
  }

  TableRow tableRow({
    required String sequence,
    required String team,
    required String game,
    required String win,
    required String draw,
    required String lose,
    required String points,
    Color? borderColor,
  }) {
    return TableRow(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? Colors.grey,
        ),
      ),
      children: [
        Text(sequence),
        Text(team),
        Text(game),
        Text(win),
        Text(draw),
        Text(lose),
        Text(points),
      ],
    );
  }
}
