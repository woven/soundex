library soundex;

const _m = const {
  'B': 1,
  'F': 1,
  'P': 1,
  'V': 1,
  'C': 2,
  'G': 2,
  'J': 2,
  'K': 2,
  'Q': 2,
  'S': 2,
  'X': 2,
  'Z': 2,
  'D': 3,
  'T': 3,
  'L': 4,
  'M': 5,
  'N': 5,
  'R': 6
};

/**
 * Calculates soundex value for the given input.
 *
 * Example:
 *
 * print(soundex('Kevin')) // "K150"
 */
String soundex(String input) {
  if (input == null || input.isEmpty) return '';

  input = input.toUpperCase();

  List sdx = new List.filled(4, 0);

  var i = 0, s = 0, c, p;

  while (s < 4) {
    if (i == input.length) break;

    c = input[i++];

    if (_m.containsKey(c)) {
      var j = _m[c];

      if (j != p) sdx[s++] = p = j;
    } else {
      s += (i == 1 ? 1 : 0);
      p = 0;
    }
  }

  sdx[0] = input[0];

  return sdx.join();
}