console.log('firstWay')

function inc(num) {
    return num += 2
}

const a = 5
const b = inc(a)

console.dir({a, b})