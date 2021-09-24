const readlineSync = require('readline-sync');

const peso = readlineSync.questionFloat('Qual seu peso? ');
const altura = readlineSync.questionInt('Qual sua altura? ');

function calcImc (p, a) {
  const calc = (p / Math.pow(a / 100, 2)).toFixed(2);
  if (calc < 18.5) return "Abaixo do peso (magreza)"
  if (calc < 24.9) return "Peso normal"
  if (calc < 29.9) return "Acima do peso (sobrepeso)"
  if (calc < 34.9) return "Obesidade grau I "
  if (calc < 39.9) return "Obesidade grau II "
  else return "Obesidade graus III e IV"
}

console.log(calcImc(peso, altura));