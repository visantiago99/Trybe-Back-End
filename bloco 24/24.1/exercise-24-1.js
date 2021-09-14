// Exercício 1 : Altere o imdbRating para 7.7 no filme Batman .
db.class.updateOne(
  {title: "Batman"},
  {$set: {imdbRating: 7.7}}
  );
// Exercício 2 : Altere budget para 1 no filme Godzilla .
db.class.updateOne(
  {title: "Godzilla"},
  {$set: {budget: 1}}
  );
// Exercício 3 : Altere budget para 15 e imdbRating para 5.5 no filme Home Alone .
db.class.updateOne(
  {title: "Home Alone"},
  {$set: {budget: 15, imdbRating: 5.5}}
  );
// Exercício 4 : Aumente em 2 o imdbRating do filme Batman .
db.class.updateOne(
  {title: "Batman"},
  {$inc: {imdbRating: 2}}
  );
// Exercício 5 : Aumente em 5 o budget do filme Home Alone .
db.class.updateOne(
  {title: "Home Alone"},
  {$inc: {budget: 5}}
  );
// Exercício 6 : Multiplique por 4 o imdbRating do filme Batman .
db.class.updateOne(
  {title: "Batman"},
  {$mul: {imdbRating: 4}}
  );
// Exercício 7 : Renomeie o campo budget para estimatedBudget do filme Batman .
db.class.updateOne(
  {title: "Batman"},
  {$rename: {budget: "estimatedBudget"}}
  );
// Exercício 8 : Utilize o operador $min para alterar o budget para 5 do filme Home Alone .
db.class.updateOne(
  {title: "Home Alone"},
  {$min: {budget: 5}}
  );
// Exercício 9 : Utilize o operador $max para alterar o imdbRating para 8.6 do filme Godzilla . Além disso, altere a categoria "adventure" para "thriller" do filme Godzilla .
// Exercício 10 : Utilizando o operador $currentDate , crie um campo chamado lastUpdated com o tipo timestamp no filme Home Alone .
// Exercício 11 : Utilizando uma única operação, crie um campo chamado sequels e atribua a ele o valor 0 em todos os documentos.
// Exercício 12 : Utilizando uma única operação, remova os campos budget e estimatedBudget em todos os documentos.
// Exercício 13 : Para os filmes Batman ou Home Alone , atribua a imdbRating o valor 17 , caso o valor de imdbRating seja menor que 17 .