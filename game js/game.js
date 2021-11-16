const thievesArmy = (arrResurs, loadCapacity) =>{
    let sum = 0
    let arrLooted = []
    arrResurs.forEach(function(item) {
        sum += item
      })
      arrResurs.forEach(function(item) {
        arrLooted.push(Math.floor(loadCapacity / (sum / item)))
      })
    return arrLooted
}

// let arr = [100, 300, 200]
// console.log(thievesArmy(arr, 120))