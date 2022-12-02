class CategoryLottie{
  String? categoryLottie(String category) {
    String? lottieUrl;

    if (category=="important") {
      lottieUrl="https://lottie.host/da50858b-4473-4613-83f6-491716f34c0b/fwayFH7JLQ.json";
    }else if(category=="movie"){
      lottieUrl="https://lottie.host/5e15024d-3dfe-4581-8e55-8961e97d5449/Avf2vBGyar.json";
    }else if(category=="book"){
      lottieUrl="https://lottie.host/5541d637-58d7-4865-8c05-a6756edb65d9/72zMGLqMEE.json";
    }else if(category=="normal"){
      lottieUrl="https://lottie.host/895aae61-517a-4058-b8a4-de9f62322571/Hk1BhRSF2P.json";
    }
    return lottieUrl;
  }
}




class LottieUrl{
  static const String lottieSplashUrl="https://lottie.host/c4d5fd0c-55dd-4a76-b3ef-c810f21277ab/ptzyJSnVNc.json";
  static const String lottieNoData="https://lottie.host/714ba92e-1311-4921-8157-593e2efefd07/0zCxATkNqM.json";
}