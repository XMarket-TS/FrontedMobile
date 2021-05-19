import 'package:http/http.dart' as http;
class RecipesRepository{
  getRandomRecipes() async {
    var client = http.Client();
    try {
      var uriResponse = await client.get(Uri.parse('https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/random'));
      print(await client.get(uriResponse));
    } finally {
    client.close();
    }
  }
}