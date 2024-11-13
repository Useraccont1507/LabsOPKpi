const array = [true, 5,'hello', 12, false, 324234234n, 'kpi', 'dwf', 10*10]

const hash = {
    number: 0,
    string: 0,
    boolean: 0,
    bigint: 0
}

for (const keys of array) {
    const type = typeof keys
    console.log(type)
    hash[type]++
}

console.dir(hash)