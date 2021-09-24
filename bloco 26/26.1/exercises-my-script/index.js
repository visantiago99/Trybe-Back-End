const readlineSync = require('readline-sync');

const scriptArray = ["imc", "velocidade", "sorteio"]

const opcao = readlineSync.keyInSelect(scriptArray, 'Selecione o script');

const scriptFunc = () => {
  if (scriptArray[opcao] === "imc") {
    const imcPath = require('./imc')
  }
  else if (scriptArray[opcao] === "velocidade") {
    const veloPath = require('./velocidade')
  }
  else if (scriptArray[opcao] === "sorteio") {
    const sorteioPath = require('./sorteio')
  }
}

scriptFunc();