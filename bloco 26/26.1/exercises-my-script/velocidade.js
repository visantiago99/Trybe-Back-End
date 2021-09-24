const readlineSync = require('readline-sync');

const distancia = readlineSync.questionInt('Qual a distância? ');
const tempo = readlineSync.questionInt('Em quanto tempo? ');

const calcVeloc = (d, t) => {
  return d / t
}

console.log(calcVeloc(distancia, tempo))