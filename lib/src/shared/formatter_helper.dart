sealed class FormatterHelper {
  static String formatarValor(double valor) {
    // Formata o valor para o formato de reais brasileiros
    String valorFormatado = valor.toStringAsFixed(2);

    // Substitui o ponto por vírgula nos centavos
    valorFormatado = valorFormatado.replaceAll('.', ',');

    // Adiciona o símbolo de R$ e separadores de milhar
    valorFormatado = 'R\$ ${valorFormatado.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    )}';

    return valorFormatado;
  }

  static double converterParaDouble(String valorFormatado) {
    // Remove o símbolo de R$ e os separadores de milhar
    String valorSemSimbolo =
        valorFormatado.replaceAll('R\$ ', '').replaceAll('.', '');

    // Substitui a vírgula por ponto nos centavos
    valorSemSimbolo = valorSemSimbolo.replaceAll(',', '.');

    // Converte a String para double
    double valorConvertido = double.parse(valorSemSimbolo);

    return valorConvertido;
  }
}
