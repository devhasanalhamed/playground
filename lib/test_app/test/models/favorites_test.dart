import 'package:playground/test_app/models/favorites.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Testing App Provider',
    () {
      var favorites = Favorites();

      test(
        'A new item should be added',
        () {
          var number = 35;
          favorites.add(number);
          expect(favorites.items.contains(number), true);
        },
      );

      test(
        'An item should be removed',
        () {
          var number = 45;
          favorites.add(number);
          expect(favorites.items.contains(number), true);
          favorites.remove(number);
          expect(favorites.items.contains(number), false);
        },
      );
    },
  );
}
