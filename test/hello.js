exports.handler = async(event, context, callback) => {
    console.log("Hello World from Lambda. Input is: " + process.env.foo);
};
