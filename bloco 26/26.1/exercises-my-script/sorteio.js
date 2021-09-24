const readlineSync = require('readline-sync');


const geraSorteio = () => {
  const numeroInput = readlineSync.questionInt('Digite um número? ');
  const rng = parseInt(Math.random() * 10);
  if (numeroInput === rng) {
    console.log("Parabéns, número correto!")
  }
  else {
    console.log(`Opa, não foi dessa vez. O número era ${rng}`)
  }

  if (readlineSync.keyInYN('Você deseja jogar novamente?')) {
    geraSorteio()
  }
}

geraSorteio();