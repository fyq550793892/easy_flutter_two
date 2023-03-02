import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

/// @Author: fanyuqing
/// @Description: dialog弹窗
/// @date: 2022/10/12

class DialogWidget extends StatelessWidget {
  const DialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            ShowTipDialogUtil.showTipDialog(context, oneLine: "第一行");
          },
          child: Text("展示dialog"),
        ),
      ),
    );
  }
}

class ShowTipDialogUtil {
  static Future showTipDialog(
    BuildContext context, {
    String? oneLine,
    String? twoLine,
    String? tipBtStr,
    String? titleName,
  }) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return TipDialogWidget(
          titleName: titleName,
          tipBtStr: tipBtStr,
          oneLineMessage: oneLine,
          twoLineMessage: twoLine,
        );
      },
    );
  }
}

class TipDialogWidget extends StatefulWidget {
  final String? titleName;
  final String? oneLineMessage;
  final String? twoLineMessage;
  final String? tipBtStr;

  TipDialogWidget({
    Key? key,
    this.titleName,
    this.oneLineMessage,
    this.tipBtStr,
    this.twoLineMessage,
  }) : super(key: key);

  @override
  State<TipDialogWidget> createState() => _TipDialogWidgetState();
}

class _TipDialogWidgetState extends State<TipDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              child: Container(
                width: 270.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    16.w,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 16.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 16.w),
                      child: Column(
                        children: [
                          Text(
                            widget.titleName ?? "提示",
                            style: TextStyle(
                              fontSize: 18.w,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 14.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.oneLineMessage ?? "",
                                style: TextStyle(
                                  fontSize: 15.w,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              if (widget.twoLineMessage != null)
                                Text(
                                  widget.twoLineMessage ?? "",
                                  style: TextStyle(
                                    fontSize: 15.w,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 23.w,
                    ),
                    Divider(
                      height: 1.w,
                      thickness: 1.w,
                      color: Colors.grey,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 44.w,
                        width: 270.w,
                        child: Text(
                          widget.tipBtStr ?? "确定",
                          style: TextStyle(
                            fontSize: 16.w,
                            color: Colors.pink,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
