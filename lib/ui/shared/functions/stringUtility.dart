class StringUtility {
  String parseFirstToUpperCase(String text) {
    List<String> textSplited = text.split('');
    String primeiraLetra = textSplited[0].toUpperCase();
    textSplited.removeAt(0);
    String newtext = "";

    for (String letra in textSplited) {
      newtext += letra;
    }

    newtext = primeiraLetra + newtext;
    return newtext;
  }
}