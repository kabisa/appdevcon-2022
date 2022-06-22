import 'package:flutter/material.dart';
import 'package:flutter_workshop/data/transaction.dart';

class TransactionWidget extends StatelessWidget {
  final Transaction transaction;

  const TransactionWidget({
    Key key,
    @required this.transaction,
  }) : super(key: key);

  String _relativeDate(Transaction transaction) {
    int daysAgo = DateTime.now().difference(transaction.createdAt).inDays;
    return daysAgo == 0 ? "Today" : "$daysAgo days ago";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "${transaction.kudos} ₭",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                              "https://i.pravatar.cc/300?u=${transaction.fromName}"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                              "https://i.pravatar.cc/300?u=${transaction.toName}"),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    _relativeDate(transaction),
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                alignment: Alignment.centerLeft,
                child: Text(
                  transaction.toString(),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )),
    );
  }
}
