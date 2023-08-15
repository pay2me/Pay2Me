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

  bool hasUpperCase(String text) {
    return RegExp(r'[A-Z]').hasMatch(text);
  }

  bool hasLowerCase(String text) {
    return RegExp(r'[a-z]').hasMatch(text);
  }

  bool hasNumber(String text) {
    return RegExp(r'[0-9]').hasMatch(text);
  }

  bool hasSpecialCharacters(String input) {
    return RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(input);
  }
}