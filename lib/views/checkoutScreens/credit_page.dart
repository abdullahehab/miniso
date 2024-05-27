import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:miniso/views/checkoutScreens/done_checkout.dart';

import '../../component/navigate.dart';
import '../../helpers/theme.dart';


class CreditPage extends StatelessWidget {
  const CreditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MySample();
  }
}



class MySample extends StatefulWidget {
  const MySample({super.key});

  @override
  State<StatefulWidget> createState() => MySampleState();
}

class MySampleState extends State<MySample> {
  bool isLightTheme = false;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = true;
  bool useFloatingAnimation = true;
  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.7),
      width: 2.0,
    ),
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 15, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const SizedBox(height: 50),
                    CreditCardWidget(
                      enableFloatingCard: useFloatingAnimation,
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      bankName: 'Bank Name',
                      showBackView: isCvvFocused,
                      obscureCardNumber: true,
                      obscureCardCvv: true,
                      isHolderNameVisible: true,
                      cardBgColor: AppColors.primary,
                      // backgroundImage: 'assets/images/logo22.png',
                      isSwipeGestureEnabled: true,
                      onCreditCardWidgetChange:
                          (CreditCardBrand creditCardBrand) {},
                      customCardTypeIcons: <CustomCardTypeIcon>[
                        CustomCardTypeIcon(
                          cardType: CardType.unionpay,
                          cardImage: Image.asset(
                            'assets/images/money.png',
                            height: 48,
                            width: 48,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        CreditCardForm(
                          formKey: formKey,
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumber: cardNumber,
                          cvvCode: cvvCode,
                          isHolderNameVisible: true,
                          isCardNumberVisible: true,
                          isExpiryDateVisible: true,
                          cardHolderName: cardHolderName,
                          expiryDate: expiryDate,
                          inputConfiguration: const InputConfiguration(
                            cardNumberDecoration: InputDecoration(
                                labelText: 'Number',
                                hintText: 'XXXX XXXX XXXX XXXX',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.primary,),),),
                            expiryDateDecoration: InputDecoration(
                                labelText: 'Expired Date',
                                hintText: 'XX/XX',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color:  AppColors.primary,),),),
                            cvvCodeDecoration: InputDecoration(
                                labelText: 'CVV',
                                hintText: 'XXX',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color:  AppColors.primary,),),),
                            cardHolderDecoration: InputDecoration(
                                labelText: 'Card Holder',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color:  AppColors.primary,),),),
                          ),
                          onCreditCardModelChange: onCreditCardModelChange,
                        ),
                        const SizedBox(height: 100),
                        AnimatedButton(
                          text: 'Success Dialog',
                          width: 200,
                          height: 100,
                          color: AppColors.primary,
                          pressEvent: () {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.scale,
                              headerAnimationLoop: false,
                              dialogType: DialogType.success,
                              btnOkColor: AppColors.primary,
                              showCloseIcon: true,
                              title: 'Succesful Operation ',
                              desc:
                              'Your Subscription has been successfully renewed',
                              btnOkOnPress: () {
                                debugPrint('OnClcik');
                                navigateAndFinish(context, const DoneCheckoutPage());
                              },
                              btnOkIcon: Icons.check_circle,
                              onDismissCallback: (type) {
                                debugPrint(
                                    'Dialog Dissmiss from callback $type');
                              },
                            ).show();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}