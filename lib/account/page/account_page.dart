import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deer/account/widgets/rise_number_text.dart';
import 'package:flutter_deer/res/resources.dart';
import 'package:flutter_deer/routers/fluro_navigator.dart';
import 'package:flutter_deer/util/image_utils.dart';
import 'package:flutter_deer/widgets/click_item.dart';
import 'package:flutter_deer/widgets/my_app_bar.dart';

import '../account_router.dart';

/// design/6店铺-账户/index.html#artboard2
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          centerTitle: 'Money management',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Gaps.vGap5,
              _buildCard(),
              Gaps.vGap5,
              ClickItem(
                title: 'withdraw',
                onTap: () =>
                    NavigatorUtils.push(context, AccountRouter.withdrawalPage),
              ),
              ClickItem(
                title: 'Withdrawals record',
                onTap: () => NavigatorUtils.push(
                    context, AccountRouter.withdrawalRecordListPage),
              ),
              ClickItem(
                title: 'Withdraw password',
                onTap: () => NavigatorUtils.push(
                    context, AccountRouter.withdrawalPasswordPage),
              ),
            ],
          ),
        ));
  }

  Widget _buildCard() {
    return AspectRatio(
      aspectRatio: 1.85,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6.0),
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ImageUtils.getAssetImage('account/bg'),
            fit: BoxFit.fill,
          ),
        ),
        child: const Column(
          children: <Widget>[
            _AccountMoney(
              title: 'Current balance (yuan)',
              money: '30.12',
              alignment: MainAxisAlignment.end,
              moneyTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoThin'),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  _AccountMoney(
                      title: 'Cumulative settlement amount', money: '20000'),
                  _AccountMoney(
                      title: 'Cumulative commission issued', money: '0.02'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountMoney extends StatelessWidget {
  const _AccountMoney(
      {required this.title,
      required this.money,
      this.alignment,
      this.moneyTextStyle});

  final String title;
  final String money;
  final MainAxisAlignment? alignment;
  final TextStyle? moneyTextStyle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MergeSemantics(
        child: Column(
          mainAxisAlignment: alignment ?? MainAxisAlignment.center,
          children: <Widget>[
            /// 横向撑开Column，扩大语义区域
            const SizedBox(width: double.infinity),
            Text(title,
                style: const TextStyle(
                    color: Colours.text_disabled, fontSize: Dimens.font_sp12)),
            Gaps.vGap8,
            RiseNumberText(NumUtil.getDoubleByValueStr(money) ?? 0,
                style: moneyTextStyle ??
                    const TextStyle(
                        color: Colours.text_disabled,
                        fontSize: Dimens.font_sp14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoThin')),
          ],
        ),
      ),
    );
  }
}
