class Textwheee {
  String teksten="";

  void addText(char c) {
    println(teksten);
    teksten = teksten+c;

    println(keyCode);

    fill(0);
    text(teksten, 10, 200);
    fill(255);
  }
}
