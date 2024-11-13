console.log('SecondWay')

function inc(obj) {
    obj.num += 5
}

const obj = {
    num: 10
}

inc(obj)

console.dir(obj)