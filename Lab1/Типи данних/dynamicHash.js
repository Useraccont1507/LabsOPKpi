const array = [true, 5, 'hello', 12, false, 324234234n, 'kpi', 'dwf', 10*10]

const dynamicHash = {}

for (const keys of array) {
    const type = typeof keys
    let tempo = dynamicHash[type] || 0
    dynamicHash[type] = tempo + 1;
}

console.dir(dynamicHash)