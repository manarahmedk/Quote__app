import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quote_app/model/quote_model.dart';
import 'package:quote_app/view/components/widgets/text_custom.dart';
import 'package:quote_app/view_model/data/network/dio_helper.dart';
import 'package:quote_app/view_model/data/network/end_points.dart';
import 'package:quote_app/view_model/utils/colors.dart';

class QuoteScreen extends StatefulWidget {
  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  QuoteModel? quote;
  String? todayQuote;

  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    callApi();
  }

  void callApi() async {
    final Response response = await DioHelper.get(
      endPoint: EndPoints.quoteOfTheDay,
    );
    quote = await QuoteModel.fromJson(response.data);
    setState(() {
      todayQuote = quote?.quote?.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.orange.withOpacity(0.25),
              border: Border.all(
                color: Colors.orange,
                width: 3,
              ),
            ),
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextCustom(
                  text: "${quote?.quote?.body}",
                  color: AppColors.black,
                  fontSize: 30,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.format_quote_sharp,
                  size: 55,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
