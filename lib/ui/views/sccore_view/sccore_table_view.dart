import 'package:flutter/material.dart';
import 'package:task_P2/ui/shared/utlis.dart';

class SccoreTableView extends StatelessWidget {
  const SccoreTableView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: screenWidth(18),
          vertical: screenWidth(10),
        ),
        child: Column(
          children: [
            Container(
              margin:
                  EdgeInsetsDirectional.symmetric(vertical: screenWidth(18)),
              height: screenWidth(8),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    width: screenWidth(4),
                    margin: EdgeInsetsDirectional.only(
                      end: screenWidth(20),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            Table(
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
            )
          ],
        ),
      ),
    );
  }
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
