const thievesArmy = (arrResurs, loadCapacity) => {
  let sum = 0
  let arrLooted = []
  let coefficients = [];
  let tempCoeff = []

  arrResurs.forEach(function (item) {
    sum += item
  })

  if(sum <= loadCapacity){
    return arrResurs
  }

  arrResurs.forEach(function (item) {
    index = sum / item
    coefficients.push(Math.round(index))
    tempCoeff.push(Math.round(index))
    arrLooted.push(0)
  })

  let id = 0;
  tempCoeff.sort((a, b) => a - b)
  let maxSum = 0;

  arrResurs.some(function (item, index) {
    id = coefficients.indexOf(tempCoeff[index])
    arrLooted[id] = Math.ceil(loadCapacity / coefficients[id])
    coefficients[id] = 0
    maxSum += arrLooted[id]

    if (maxSum == loadCapacity) {
      return 1
    }
  })

  if (maxSum < loadCapacity){
    id = coefficients.indexOf(tempCoeff[0])
    let maxId = arrLooted.indexOf(Math.max.apply(null, arrLooted))
    arrLooted[maxId] +=  loadCapacity - maxSum
  }

  return arrLooted
}

//let arr = [100, 300, 199]
//let arr = [1,1,1,4,1,6] // 2
//let arr = [1, 1, 1] // 2
//let arr = [100, 300, 199] // 120
//let arr = [1, 1, 6] //2
//console.log(thievesArmy(arr, 120))