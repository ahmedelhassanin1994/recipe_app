
import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:mvvm_project/core/common/base/baseviewmodel.dart';
import 'package:mvvm_project/generated/locale_keys.g.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';


class OnBordingViewModel extends BaseViewModel implements OnBordingViewModelInputs,OnBordingViewModelOuts{

  // stream controllers
  final StreamController _streamController=StreamController<SlideViewObject>();
  late final List<SliderObject> _list ;
  int currentindex=0;



  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
  }

  @override
  void start() {
    // TODO: implement start
    _list=_getSliderData();
    // send slider data in our view
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex=currentindex ++;
    if(nextIndex >= _list.length-1) {
      currentindex = 0;
    }
    onPageChanged(currentindex);
    return currentindex;

  }

  @override
  int goPrevios() {
    // TODO: implement goPrevios

    int previousindex=currentindex --;
    if(previousindex == -1) {
      currentindex = _list.length - 1;
    }
    onPageChanged(currentindex);
    return currentindex;
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged

    currentindex =index;
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  // TODO: implement outPutSliderView
  Stream<SlideViewObject> get outPutSliderView => _streamController.stream.map((SlideViewObject) => SlideViewObject);

  // private functions
  List<SliderObject>_getSliderData()=>[
    SliderObject(LocaleKeys.welcome_slider.tr(),LocaleKeys.body_slider.tr(),ImageAssets.onbording_logo1),
    SliderObject(LocaleKeys.welcome_slider2.tr(),LocaleKeys.body_slider.tr(),ImageAssets.onbording_logo2),
    SliderObject(LocaleKeys.welcome_slider3.tr(),LocaleKeys.body_slider.tr(),ImageAssets.onbording_logo3),
    SliderObject(LocaleKeys.welcome_slider4.tr(),LocaleKeys.body_slider.tr(),ImageAssets.onbording_logo4),

  ];

  _postDataToView(){
    inputSliderViewObject.add(SlideViewObject(_list[currentindex], _list.length, currentindex));
  }

}

// inputs mean the orders that our view model will recive from our view
abstract class OnBordingViewModelInputs{

  void goNext(); // When user clicks on right arrow or swipe
  void goPrevios(); // when user clicks on left arrow or swipe
  void onPageChanged(int index);
  Sink get inputSliderViewObject; // this is the way to add data to the stream  ... stream input
}

// outputs mean data or result that will be sent from our view model to our view
abstract class OnBordingViewModelOuts{

  // will be implement it later
  Stream<SlideViewObject> get outPutSliderView;
}

class SlideViewObject{

 late SliderObject sliderObject;
 late int numOfSlides;
 late int currentIndex;

 SlideViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

class SliderObject{
  late String tittle;
  late String subTittle;
  late String image;

  SliderObject(this.tittle, this.subTittle, this.image);
}