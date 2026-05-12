String maskCardNumber(String number){
  String word = number.replaceAll(" ", "");

  if(word.length<8) return number;

  String first = word.substring(0,4);
  String last = word.substring(word.length-4);

  return "$first  ****  ****  $last";
}