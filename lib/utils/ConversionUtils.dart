class ConversionUtils {

  static String AddUnitToNum(int num) {
    String result;

    if (num > 8000) {
      result = (num / 10000).toStringAsFixed(1) + "万";
    } else if (num > 800) {
      result = (num / 1000).toStringAsFixed(1) + "千";
    } else {
      result = num.toString();
    }

    return result;
  }
}
